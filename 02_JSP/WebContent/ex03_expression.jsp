<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>표현식(expression)</title>
</head>
<body>
	<h2>표현식(Expression)</h2>
	<p>HTML문을 사용해서 클라이언트에게 전달</p>
	
	<hr>
	<h2>out 객체를 사용해서 클라이언트에게 전달</h2>
	<h2>
	<%
	
	
	%>
	</h2>
	<hr>
	<h3>
	<%-- out.print("표현식(Expression) 사용해서 클라이언트에게 전달"); --%> 
	<%="표현식(Expression) 사용해서 클라이언트에게 전달"	%>
	</h3>
	<hr>
	<p>int 변수 2개(num1, num2)의 값을 표현식을 사용해서 합계(sum)출력</p>
	<p>출력형태 : 100 + 200 = 300 (num1 + num2 = sum)</p>
	
	<%
	int num1 = 100;
	int num2 = 200;
	int sum = num1 + num2;
	%>
	<h2>계산 후 출력(out 객체 사용)</h2>
	<p>out : <% out.print(num1 + " + " + num2 + " = " + sum); %></p>
	<hr>
	<h2>계산 후 출력(%= %사용)</h2>
	<h3>표현식사용 : <%=num1 %> + <%=num2 %> = <%=sum %></h3>
	<h3>표현식 : <%=num1 +" + "+ num2 +" = " + sum  %></h3>
</body>
</html>