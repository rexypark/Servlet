<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서브페이지</title>
</head>
<body>
	<h1>서브페이지(sub)</h1>
	<a href="main.jsp">메인 페이지로 이동</a>
	<h2>서브 페이지 내용</h2>
	<p>sub 내용......</p>
	<p>sub 내용......</p>
	<p>sub 내용......</p>
	<p>sub 내용......</p>
	<p>sub 내용......</p>
	
	<%--디렉티브(directive) include : copy & paste 적용됨 --%>
<%!
	//선언부 : 서블릿의 필드영역에 코드 추가
	int globalNum = 0;
%>
<%
	//서블릿의 service() 메소드에 작성되는 코드
	int localNum = 0;
	localNum++;
	globalNum++;
	
	out.println("<h2>localNum : " + localNum + "</h2>");
	out.println("<h2>globalNum : " + globalNum + "</h2>");
%>
	
	<%@ include file="footer.jsp" %>
	
	
	
<br><br><br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br><br><br>	
</body>
</html>













