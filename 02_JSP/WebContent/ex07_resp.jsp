<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//요청종보(request)로 부터 파라미터 값 추출
	String name = request.getParameter("name");
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String email = request.getParameter("pwd");
	
	String[] hobbies = request.getParameterValues("hobby");
	if(hobbies == null) {
		hobbies = new String[] {"선택없음"};
	}
	
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>

	<% %>
	<ul>
		<li>이름 : <%=name %></li>
		<li>아이디 : <%=id %></li>
		<li>암호 : <%=pwd %></li>
		<li>암호 : <%=email %></li>
		<li>취미 : 
		<%
			for (int i=0; i<hobbies.length; i++) {
				out.print(hobbies[i] + ", ");
			}
		%>
		</li>
		<hr>
		<h2>표현식 사용해서 취미 출력</h2>
		<p>취미 : 
		<%
		for(String hobby : hobbies) { %>
			<%=hobby + " " %>
		<%
		}
		%>
	</ul>
</body>
</html>