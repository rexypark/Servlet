<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL(Expression Language)</title>
</head>
<body>
<%-- EL (Expression Language) : 표현언어
	1. 표현식을 대신해서 사용 : ${ }
	<%=변수명 %> ${변수명}, ${계산식}
	2. 변수값 표시할 경우 반드시 scope안에 변수(속성)가 존재해야함
		scope 객체 : pageContext, request, session, application
		해당 scope 상에 setAttribute 설정된 변수(속성)값만 사용 가능
	3. 같은 이름이 다른 scope상에 존재하는 경우 접근 우선순위가 적용 된다
	pageContext > request > session > application
	*스코프를 지정 하지 않는경우 해당 순서대로 해당 변수값을 찾는다.
	  단, scope 지정하면 해당 scope에서만 찾음
 --%>
 
	<h2>EL(Expression) 산술연산 사용 예</h2>
	<ul>
		<li>15 + 7 = <%=15+7 %></li>
		<li>15 - 7 = <%=15-7 %></li>
		<li>15 * 7 = <%=15*7 %></li>
		<li>15 / 7 = <%=15/7 %></li>
		<li>15 % 7 = <%=15%7 %></li>
	</ul>
	<hr>

	<h2>EL(Expression) 표현언어</h2>
	<ul>
		<li>15 + 7 = ${ 15+7 }</li>
		<li>15 - 7 = ${ 15-7 }</li>
		<li>15 * 7 = ${ 15*7 }</li>
		<li>15 / 7 = ${ 15/7 } : double 형식으로 처리</li>
		<li>15 % 7 = ${ 15%7 }</li>
	</ul>
	<hr>

	<h2>선언부, 스크립트릿 변수 사용시</h2>
	<p>표현식은 사용가능하지만, EL에서는 사용못함</p>
	<%! int su2 = 15 + 7; %>
	<% int su3 = 15 - 7; %>
	
	<ul>
		<li>표현식(선언부변수) su2 : 15 + 7 = <%=su2 %></li>
		<li>표현식(스크립트릿변수) su2 : 15 - 7 = <%=su3 %></li>
	</ul>
	<ol>
		<li>EL(선언부변수) su2 : 15 + 7 = ${ su2 }</li>
		<li>EL(스크립트릿변수) su2 : 15 - 7 = ${ su3 }</li>
		<h2>(주의) EL은 scope 상에 데이터가 있어야 사용가능</h2>
	</ol>

	<h3>EL 사용시에 해당스코프상에 속성 정의</h3>
	<%pageContext.setAttribute("attr_su3", su3); %>
	<ol>
		<li>EL(선언부변수) su2 : 15 + 7 = ${ su2 }</li>
		<li>EL(스크립트릿변수) su2 : 15 - 7 = ${ attr_su3 }</li>
	</ol>
	<%------------------------ --%>
	<h2>동일한 이름의 속성명이 여러 scope애ㅔ 존재할 때</h2>
	<p>scope 명시적 지정시 해당 scope에서만 찾아서 사용</p>
<%
	pageContext.setAttribute("pc","팬티엄-pageContext");
	request.setAttribute("pc","팬티엄-request");
	session.setAttribute("pc","팬티엄-session");
	application.setAttribute("pc","팬티엄-application");
	
%>	
	<ul>
		<li>scope 지정 없이 사용 : ${ pc }</li>
	</ul>
	<ol>
		<li>page 지정  : pageScope지정 : ${ pageScope.pc }</li>
		<li>request 지정  : requesScope지정 : ${ requesScope.pc }</li>
		<li>session 지정  : sessionScope지정 : ${ sessionScope.pc }</li>
		<li>application 지정  : applicationScope지정 : ${ applicationScope.pc }</li>
	</ol>
	<hr><hr>
</body>
</html>