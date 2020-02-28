<%@page import="com.bc.vo.PersonVO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL forEach</title>
</head>
<body>
	<h1>JSTL forEach : List, Set, Map</h1>
	<h2>Array 출력</h2>
	<p>출력대상 : {"a", "ab", "abc","abcd"}</p>
<%
	String[] strs = {"a", "ab", "abc", "abcd"};
	pageContext.setAttribute("arr", strs);
	
%>
	<c:forEach var="str" items="${arr}">
		<p>${str}</p>
	</c:forEach>
	
	<h3>배열(Array) 일부 데이터만 사용(2,3번째 : 1,2번 인덱스)</h3>
	<c:forEach var="str" items="${arr}" begin="1" end="2" step="1">
		<li>${str }</li>
	</c:forEach>		
	<hr><hr>
	<%--========= List 출력 =========--%>
	<h1>List출력</h1>
<%
	List<Integer> list = new ArrayList<Integer>();
	list.add(132);
	list.add(45);
	list.add(24);
	list.add(45);
	list.add(345);
	pageContext.setAttribute("alist", list);
%>
	<c:forEach var="listItem" items="${alist }">
		<li>${listItem}</li>
	</c:forEach>
	
	<hr><hr>
	<%--========= Set 출력 =========--%>
		<h1>Set출력</h1>
<%
	Set<String> set = new HashSet();
	set.add("홍길동");
	set.add("김유신");
	set.add("강감찬");
	set.add("을지문덕");
	pageContext.setAttribute("hset", set);
%>
	<c:forEach var="setItem" items="${hset }">
		<li>${setItem}</li>
	</c:forEach>
	
	<hr><hr>
	<%--========= Map 출력 =========--%>
			<h1>Map출력</h1>
<%	
	Map<String, String> map = new HashMap<String, String>();
	map.put("k1","a");
	map.put("k2","ab");
	map.put("k3","abc");
	map.put("k4","abcd");
	map.put("k5","abcde");
	map.put("k6","abcdef");
	pageContext.setAttribute("hmap", map);
	 %>
	<c:forEach var="mapItem" items="${hmap }">
		<li>${mapItem.key} - ${mapItem.value}</li>
	</c:forEach>	
	<hr><hr>
	<%--===========================--%>
	<h1>VO가 담긴 List값 사용</h1>
	
<%
	List<PersonVO> listBean = new ArrayList<PersonVO>();
		listBean.add(new PersonVO("홍길동", "27"));
		listBean.add(new PersonVO("김유신", "23"));
		listBean.add(new PersonVO("강감찬", "39"));
		listBean.add(new PersonVO("을지문덕", "57"));

		pageContext.setAttribute("persons", listBean);
		
%>
	<c:forEach var="beanItem" items="${persons }">
		<li>${beanItem.name} - ${beanItem.age}</li>
	</c:forEach>	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>