<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- 파라미터 값 추출해서 화면표시 --%>    

<%
	//한글처리
	response.setCharacterEncoding("UTF-8");
	//파라미터 값 추출
	/*String name = request.getParameter("name"); 
	String age = request.getParameter("age"); 
	String gender = request.getParameter("gender"); 
	String[] list = request.getParameterValues("hobby");
	String hobby = "";
	for (String i : list) {
		hobby += i + " ";
	}*/

	
	Map<String,String[]> paraMap = request.getParameterMap();
	System.out.println("paraMap : " + paraMap);
	List<String> keyList = new ArrayList();
	keyList.addAll(paraMap.keySet());
	System.out.println(keyList);
	System.out.println(paraMap.get(keyList.get(3))[1]);
	
	String name = paraMap.get(keyList.get(0))[0]; 
	String age = paraMap.get(keyList.get(1))[0];
	String gender = paraMap.get(keyList.get(2))[0];
	String[] list = paraMap.get(keyList.get(3));
	String hobby = "";
	for (String i : list) {
		hobby += i + " ";
	}
	
	pageContext.setAttribute("name", name);
	pageContext.setAttribute("age", age);
	pageContext.setAttribute("gender", gender);
	pageContext.setAttribute("hobby", hobby);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>표현식</title>
</head>
<body>
	<h2>결과보기</h2>
	<ul>
		<li>이름 : ${name }</li>
		<li>나이 : ${age }</li>
		<li>성별 : ${gender }</li>
		<li>취미 : ${hobby }</li>
	</ul>
</body>
</html>