<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL VO</title>
</head>
<body>
	<h1>JSTL VO객체 다루기</h1>
	<h2>객체에 값 설정(VO 객체)</h2>
	<jsp:useBean id="person" class="com.bc.vo.PersonVO"/>
	<c:set target="${person }" property="name" value="홍길동"/>
	<c:set target="${person }" property="age" value="27"/>
	
	<p>person : <c:out value="${person }"></c:out> </p><br>
	<p>person : ${person } </p>	
	<hr>
	
	<p>peson.name : 
		<c:out value="${person.name }" default="이름없음"/>
	</p>
	<p>person.getName() : ${person.getName() }</p>
	<p>person.age : ${person.age }</p>
	<p>person.getAge() : ${person.getAge() }</p>
	
	<p>peson.gender : 
		<c:out value="${person.gender }" default="설정값없음"/>
	</p>
	
</body>
</html>