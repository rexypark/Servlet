<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>forEach varStatus 속성</h2>
<%
	List<String> list = new ArrayList<String>();
	list.add("홍길동-1");
	list.add("홍길동-2");
	list.add("홍길동-3");
	list.add("홍길동-4");
	pageContext.setAttribute("alist", list);
%>
	<h2>forEach varStatus 속성</h2>
	<p>List값 : 
	<c:forEach items="${alist }" var="listItem">
		${listItem } &nbsp;&nbsp;
	</c:forEach>
	</p>
	
	<hr>
	<hr>
	
	 
	<c:forEach items="${alist }" var="listItem" varStatus="status" begin="0" end="${alist.size() }" step="1">
	<p>List값 :
		var 값 :  ${listItem } <br>
		current : ${status.current }<br>
		count : ${status.count }<br> <!-- 처리되는 데이터 건수 -->
		index : ${status.index }<br> <!-- 처리되는 데이터 인덱스 -->
		first : ${status.first }<br> <!-- 첫번째 데이터 여부 -->
		last : ${status.last }<br> <!-- 마지막 데이터 여부 -->

		begin : ${status.begin }<br><!-- begin 데이터 -->
		end : ${status.end }<br><!-- end 데이터 -->
		step : ${status.step }<br><!-- step 데이터 -->
	</p>
	<hr>
	</c:forEach>

	
	
</body>
</html>