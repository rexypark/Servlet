<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	// (실습) 전달받은 파라미터 값을 사용해서 HTML 태그 만들기
	// 스크립트립 or out 표현식 사용해서 처리하고 출력
	
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>성적처리 결과</title>

</head>
<body>
	//스크립트립
	<h1>(실습)성적처리 결과</h1>
	
	<%--------------------------------------------------------- --%>
	<%
	Map<String, String[]> paramArr = request.getParameterMap();
	Enumeration<String> paramNames = request.getParameterNames();
	ArrayList<String> nameList = new ArrayList<String>();
	
	int sum = 0;
	while(paramNames.hasMoreElements()) {
		
		String names = paramNames.nextElement();
		String val = paramArr.get(names)[0];
		nameList.add(names);
		try {
			int valNum = Integer.parseInt(val);
			//name
			out.print("<h3>");
			out.print(names + " : ");
			//val
			out.print(val);
			out.print("</h3>");
			sum += valNum;
		} catch (NumberFormatException e) {
			out.print("<h3>");
			//name
			out.print(names + " : ");
			//val
			out.print(val);
			out.print("</h3>");
		}
		
	}
	
	double avg = sum  / 3 * 100 / 100.0;
	out.print("<h3>");
	out.print("총점 : " + sum);
	out.print("</h3>");
	out.print("<h3>");
	out.print("평균 : " + avg);
	out.print("</h3>");
	%>
	<%-----------------------------------------------------------%>
	<h2>성적처리 결과</h2>
	
	<hr>
	<h2>테이블로 출력</h2>
	<table>
		<tr>
			<th><%=nameList.get(0) %></th>
			<th><%=paramArr.get(nameList.get(0))[0] %></th>
		</tr>
		<tr>
			<td><%=nameList.get(1) %></td>
			<td><%=paramArr.get(nameList.get(1))[0] %></td>
		</tr>
		<tr>
			<td><%=nameList.get(1) %></td>
			<td><%=paramArr.get(nameList.get(1))[0] %></td>
		</tr>
		<tr>
			<td><%=nameList.get(1) %></td>
			<td><%=paramArr.get(nameList.get(1))[0] %></td>
		</tr>
	</table>
	
</body>
</html>