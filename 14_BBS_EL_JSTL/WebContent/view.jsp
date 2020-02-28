<%@page import="com.bs.mybatis.COMMVO"%>
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
	String b_idx = request.getParameter("b_idx");
	String cPage = request.getParameter("cPage");

	
	//1. 게시글 조회 수 1 증가 처리(실습)
	//해당 인덱스의 게시글의 hit + 1 
	DAO.updateHIT(Integer.parseInt(b_idx)); //id="hit"
	
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
	function addComm() {
		var firstForm = document.forms[0];
		console.log("firstForm : " + firstForm);
		console.log("firstForm.elements.length : " + firstForm.elements.length);
		for (var i=0; i < firstForm.elements.length; i++) {
			if(firstForm.elements[i].value.trim() == "") {
				alert(firstForm.elements[i].title + "입력하세요");
				firstForm.elements[i].focus();
				return;
			}
		}
		firstForm.submit();
	}
	function modify_go() {
		document.frm.action = "modify.jsp";
		document.frm.submit();
	}	
	function delete_go() {
		document.frm.action = "delete.jsp";
		document.frm.submit();
	}
	function list_go(cPage) {
		document.frm.action = "list.jsp?cPage="+cPage;
		document.frm.submit();
	}
</script>
</head>
<body>
	<form method="post" name="frm">
	<table id="detail">
		<caption id="cap">상세보기</caption>
		<tr>
			<th id="title">제목</th>
			<td>${bvo.subject }</td>
		</tr>
		<tr>
			<th id="title">첨부파일</th>
			<c:choose>
				<c:when test="${bvo.file_name == null}">
					<td>파일 없음</td>
				</c:when>
				<c:otherwise>
					<td>${bvo.file_name }</td>
				</c:otherwise>
			</c:choose>
		</tr>
		<tr>
			<th id="title">작성자</th>
			<td>${bvo.writer }</td>
		</tr>
		<tr>
			<th id="title" class="content">내용</th>
			<td>${bvo.content }</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="button" value="수정" onclick="modify_go()">
				<input type="button" value="삭제" onclick="delete_go()">
				<input type="button" value="목록" onclick="list_go(${cPage })">
				<input type="hidden" name="cPage" value="${cPage }">
			</td>
		</tr>
	</table>
</form>

	<form action="addComm.jsp" method="post">
		<p>이름 : <input type="text" name="writer" size="15" title="이름"></p>
		<p>내용 : <textarea name="content" rows="8" size="45" title="내용"></textarea></p>
		<p>비밀번호 : <input type="password" name="pwd" size="15" title="비밀번호">
		<input type="submit" value="댓글저장"> 
		<input type="hidden" name="b_idx" onclick="${bvo.b_idx }"> 
		<input type="hidden" name="cPage" onclick="${cPage }"> 
	</form>	
	
	<hr>
	<p>댓글들</p>
	<c:forEach items="${c_list }" var="vo">
		<hr>
		<form action="ans_del.jsp" method="post">
		<!-- c_idx, writer, content, pwd, write_date, ip, b_idx; -->
		<p>이름 : ${vo.writer }</p>
		<p>날짜 : ${vo.write_date }</p>
		<p>내용 : ${vo.content }</p>
		<input type="submit" value="댓글삭제">
	
		<input type="hidden" name="b_idx" value="${vo.b_idx }"> 
		<input type="hidden" name="c_idx" value="${vo.c_idx }"> 
		<input type="hidden" name="pwd" value="${vo.pwd }"> 
		</form>
		
	</c:forEach>
</body>
</html>