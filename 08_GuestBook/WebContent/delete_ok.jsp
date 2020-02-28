<%@page import="com.bc.mybatis.GuestbookVO"%>
<%@page import="java.util.List"%>
<%@page import="com.bc.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
<%
	String pwd = request.getParameter("pwd");
	GuestbookVO vo = (GuestbookVO)session.getAttribute("onlistVO");
	
	if(!pwd.equals(vo.getPwd())) {%>
		<script>
			alert("암호 불일치, 암호를 확인하세요");
			history.back();
		</script> 
<%
	} else {//암호일치
		System.out.print(">> 암호 일치 삭제작업 진행");
		
		SqlSession ss = DBService.getFactory().openSession();
		
		try {
			ss.delete("deleteData", vo.getIdx());
%>
			<script>
				alert("작업완료 \n 목록페이지로 이동");
				location.href = "list.jsp";
			</script>
<%	

		} catch (Exception e){
%>
			<script>
				alert("작업완료 \n 목록페이지로 이동");
				location.href = "list.jsp";
			</script>
<%	
		} finally {
			ss.close();
		}
	
	}
%>
	

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록 상세화면</title>
<link href="css/guestbook.css" rel="stylesheet" type="text/css">
<script>	
	function delete_ok(frm) {
		var pwd2 = frm.pwd.value;
		console.log("pwd1 : " + pwd1);
		console.log("pwd2 : " + pwd2);
		//frm.action = "delete.jsp"
		//frm.submit();
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
				<th>비밀번호</th>
				<td><input type="text" name="pwd"></td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2">
					<input type="button" value="삭 제" onclick="delete_ok(this.form)">
				</td>
			</tr>
		</tfoot>
	</table>
	
	</form>	
</div>

</body>
</html>
