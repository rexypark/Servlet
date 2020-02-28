<body><%@page import="com.bs.mybatis.COMMVO"%>
<%@page import="java.util.List"%>
<%@page import="com.bs.mybatis.DAO"%>
<%@page import="com.bs.mybatis.BBSVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<%--
	전달받은 파라미터 값 b_idx, cPage
	1. 게시글의 조회수 1증가
	2. 게시글(b_idx) 데이터 조회 후 화면 표시
	3. 게시글(b_idx)에 딸린 댓글이 있으면 화면 표시
--%>

<%

	//파라미터 값 추출
	BBSVO vo = (BBSVO)session.getAttribute("bvo");
	String b_idx = vo.getB_idx();
	String cPage = request.getParameter("cPage");
	System.out.println("vo : " + vo);
	System.out.println("b_idx : " + b_idx);
	
	
	//2. 게시글(b_idx) 데이터 조회  후 화면 표시(HTML 작성)
	BBSVO bvo = DAO.selectOne(Integer.parseInt(b_idx)); //id="one"
	System.out.println("클릭 후 게시글 데이터 조회 : " + bvo);
	
	//3. 게시글(b_idx)에 딸린 댓글이 있으면 화면 표시
	List<COMMVO> c_list = DAO.getCommList(Integer.parseInt(b_idx));//id="comm"
	System.out.println("클릭 후 댓글 데이터 조회 : " + c_list);
	
	//EL, JSTL 사용을 위한 속성 등록
	session.setAttribute("bvo", bvo);
	session.setAttribute("cPage", cPage); // 작업중 페이지로 이동 시 사용 해당 페이지를 가진 리스트 페이지를 호출
	pageContext.setAttribute("c_list", c_list);
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
<style>
	table#detail {
		width: 500px;
		border-collapse: collapse; 
		text-align: center;
	}
	caption#cap {
		font-size: 30px;
		margin-bottom: 20px;
	}
	table#detail th, td { border: 1px solid black; }
	#title {background-color: lightsteelblue;}			
	th {height: 50px;}	
	.content {height : 150px;}
</style>

<script>
	function updateData() {
		var firstForm = document.forms[0];
		console.log("firstForm : " + firstForm);
		console.log("firstForm.elements.length : " + firstForm.elements.length);
		for (var i=0; i < firstForm.elements.length; i++) {
			if(firstForm.elements[i].value.trim() == "") {
				if(i == 1) continue; //파일속성 제외
				alert(firstForm.elements[i].title + "입력하세요");
				firstForm.elements[i].focus();
				return;
			}
		}
		firstForm.submit();
	}
	
	
</script>
</head>
<body>
<form action="updateProc.jsp" method="post">
	<table id="detail">
		<caption id="cap">수정하기</caption>
		<tr>
			<th id="title">제목</th>
			<td>
				<input type="text" name="subject" size="15" title="이름">
			</td>
		</tr>
		<tr>
			<th id="title">첨부파일</th>
			<td>
				<input type="file" name="file_name">
			</td>
		</tr>
		<tr>
			<th id="title">작성자</th>
			<td>
			<input type="text" name="writer" size="15" title="작성자">
			</td>
		</tr>
		<tr>
			<th id="title">내용</th>
			<td><textarea name="content" rows="8" size="45" title="내용">
					</textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="button" value="수정" onclick="updateData()">
				<input type="button" value="목록" onclick="javascript:location.href='list.jsp?cPage=${cPage}'">
			</td>
		</tr>
	</table>
</form>	
	
	<hr>
	<p>댓글들</p>
	<c:forEach items="${c_list }" var="vo">
		<hr>
		<!-- c_idx, writer, content, pwd, write_date, ip, b_idx; -->
		<p>이름 : ${vo.writer }</p>
		<p>날짜 : ${vo.write_date }</p>
		<p>내용 : ${vo.content }</p>
		<input type="button" value="댓글삭제" onclick="">
	</c:forEach>

</body>
</html>