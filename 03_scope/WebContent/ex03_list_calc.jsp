<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	ArrayList<String> wishList = (ArrayList<String>)session.getAttribute("product_list");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 품목 계산하기</title>
</head>
<body>
	<h2>계산</h2>
	<p>[<%=session.getAttribute("username") %>] 님 계산할 목록</p>
	<h2>계산 할 품목</h2>
	<%-- (실습) ul, li 사용해서 장바구니 목록 출력 --%>
<%
	if (wishList.get(0) != null) {
		out.print("<ul>"); 
		for (int i=0; i<wishList.size(); i++) {
			out.print("<li>" + wishList.get(i) + "</li>");
		}
		out.print("</ul>");
	} else {
		out.print("<p>계산 할 품목이 없습니다.</p>");
	}
%>
	
</body>
</html>