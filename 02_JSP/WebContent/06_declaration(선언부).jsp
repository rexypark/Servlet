<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선언부(declaration)</title>
</head>
<body>
	<h2>1~10까지의 합 구하기</h2>
	<%-- 스크립트릿(서블릿의 service() 메소드 영역코드)
		 service() 내에 선언함.
	
	 --%>
	<%
		int sum = 0;   //지역변수(service 메소드 내에 있는)
	
		for (int i = 1; i<=10; i++) {
			sum += i;
		}
		out.print("1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 + 10 = ");
	%>
	<%=sum %>
	
	<%--============================ --%>
	<h2>선언부(declaration): 필드변수, 메소드 선언</h2>
	<%!
		int tot = 0;
		private int add(int a, int b) {
			return a + b;
		}
		
		int fir_num = 100;
		int sec_num = 200;
		
	%>
	<%
		tot = add(fir_num, sec_num);
	%>
	<h2>덧셈2</h2>
	<p>100 + 200 = 300</p>
	<p><%=fir_num %> + <%=sec_num %> = <%=tot %></p>
	
	
</body>
</html>