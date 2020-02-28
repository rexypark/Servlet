<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>응답페이지</title>
</head>
<body>
	<h2>JSTL02_resp.jsp</h2>
	<h3>이름 : ${name }</h3>
	<h3>나이 : ${age }</h3>
	<hr>

	<h2>JSTL02_resp.jsp</h2>
	<h3>이름 : ${param.name }</h3>
	<h3>나이 : ${param.age }</h3>
	<hr>
	
	<h2>전달받은 파라미터 값을 param 객체애 사용하지 않고 사용하려면<br>
		scope상의 속성에 저장 후 사용해야 한다
	</h2>
<%
	String name = request.getParameter("name");
	pageContext.setAttribute("att_name", name);
	String age = request.getParameter("age");
	pageContext.setAttribute("att_age", age);
%>	
	<h2>JSTL02_resp.jsp</h2>
	<h3>이름 : ${att_name }</h3>
	<h3>나이 : ${att_age }</h3>
	<hr>
	
	
</body>
</html>