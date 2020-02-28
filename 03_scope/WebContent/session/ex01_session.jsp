<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션(session) 범위</title>
<script>
	//세션에 속성값 저장
	function sessionSet() {
		//location.href = "ex01_sessionSet.jsp";
		location.href = "ex01_sessionSet.jsp?name=hong&age=27";
	}
	
	//세션에 저장된 속성 삭제
	function sessionRemove() {
		location.href = "ex01_sessionRemove.jsp";
	}
	
	//세션 초기화
	function sessionInvalidate() {
		location.href = "ex01_sessionInvalidate.jsp";
	}
	
</script>
</head>
<body>
<%
	String name = null;
	String age = null;
	System.out.println(">> session id : " + session.getId()
			+ ", new : " + session.isNew());
	
	if (session.getAttribute("attr_name") != null) {
		name = (String) session.getAttribute("attr_name")
				+ " -세션에서 읽은 값";
	} else {
		name = "세션에 속성 없음(이름)";
	}
	
	if (session.getAttribute("attr_age") != null) {
		age = (String) session.getAttribute("attr_age")
				+ " -세션에서 읽은 값";
	} else {
		age = "세션에 속성 없음(나이)";
	}
	
	//====== request scope에 데이터 저장 및 사용
	String req_name = (String) request.getAttribute("req_name");
	String req_age = (String) request.getAttribute("req_name");
%>
	<h1>세션(session) 테스트</h1>
	<input type="button" value="세션 속성에 저장"
			onclick="sessionSet()">
	<input type="button" value="세션 속성 삭제"
			onclick="sessionRemove()">
	<input type="button" value="세션 초기화"
			onclick="sessionInvalidate()">
	
	<hr>
	<h1>세션스코프(session)</h1>
	<h2>세션ID : <%=session.getId() %></h2>
	<h2>이름 : <%=name %></h2>
	<h2>나이 : <%=age %></h2>

	<hr><hr>
	<h1>request 스코프(request)</h1>
	<h2>이름(req) : <%=req_name %></h2>
	<h2>나이(req) : <%=req_age %></h2>
	
	<br><br><br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br><br><br><br>
</body>
</html>


















