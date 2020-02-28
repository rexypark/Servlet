<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//요청한 곳으로 보내기
	String site = request.getParameter("site");
	switch (site) {
		case "naver" :
			response.sendRedirect("https://www.naver.com");
			break;
		case "daum" :
			response.sendRedirect("https://www.daum.net");
			break;
		case "google" :
			response.sendRedirect("https://www.google.com");
			break;
			
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요청한 곳으로 보내기</title>
</head>
<body>

</body>
</html>