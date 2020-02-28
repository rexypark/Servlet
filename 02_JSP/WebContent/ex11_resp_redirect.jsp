<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리다이렉트 처리</title>
</head>
<body>
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	System.out.println("id : " + id + "  pwd : " + pwd);
%>
	<h2>[ ex11_resp_redirect.jsp 응답페이지 ]</h2>
	<hr>
	<h2>아이디 : <%=id %></h2>
	<h2>암호 : <%=pwd %></h2>
<%
	//재요청 처리(리다이렉트)
	//재요청 시 request 객체 데이터 사라지고 원래 패이지에서 
	//지정한 페이지를 다시 호출한다.
	// start page      ->      called page(-> sendRedirect(another page))
	//								    ㅣ
	//								  V
	// another page		<-		 start page
	response.sendRedirect("ex11_resp_redirect-2.jsp");
%>
</body>
</html>