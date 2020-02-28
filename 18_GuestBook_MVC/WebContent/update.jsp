<%@page import="com.bc.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.bc.model.vo.GuestbookVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 VO객체를 사용해서 데이터 수정처리 
	0. 전달받은 데이터 추출(session 객체에 있는)
	1. 조회된 데이터를 HTML 태그에 표시
	2. 수정 버튼이 눌러지면 암호확인 
		- 입력값과 VO에 있는 값 비교
	3. 암호 일치하면 DB 데이터 수정요청처리, 
	      불일치면 권한없음 메시지 표시
--%>    

<%
	request.setCharacterEncoding("UTF-8");

	// vo 객체를 계속 사용하기 위해서 session에 등록
	GuestbookVO vo = (GuestbookVO)session.getAttribute("onlistVO");
	System.out.print("vo : " + vo);
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정화면</title>
<link href="css/guestbook.css" rel="stylesheet" type="text/css">
<script>	
	function update_info(frm) {
		var pwd1 = frm.pwd.value;
		var pwd2 = "<%=vo.getPwd() %>";
		console.log("pw1 : " + pwd1);
		console.log("pw2 : " + pwd2);
		if(pwd1 != pwd2) {
			alert("비밀번호가 다릅니다. \n수정이 취소되었습니다.");
			frm.pwd.value = "";
			frm.pwd.focus();
		} else {
			frm.action = "GuestController?type=updateInfo"
			frm.submit();
		}
	}
</script>
</head>
<body>

<div id="container">
	<h2>방명록 : 입력화면</h2>
	<hr>
	<p><a href="list.jsp">[목록으로 이동]</a></p>
	
	<form action="write_ok.jsp" method="post">
	<table>
		<tbody>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="name" value="<%=vo.getName() %>"></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="subject" value="<%=vo.getSubject() %>"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="text" name="email" value="<%=vo.getEmail() %>"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="text" name="pwd"></td>
			</tr>
			<tr>
				<td colspan="2">
					<textarea name="content" rows="5" cols="60" ><%=vo.getContent() %></textarea>
				</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2">
					<input type="button" value="수 정" onclick="update_info(this.form)">
					<input type="reset" value="다시작성">
					<input type="hidden" name="idx" value="<%=vo.getIdx() %>">
				</td>
			</tr>
		</tfoot>
	</table>
	
	</form>	
</div>

</body>
</html>
