<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%--  --%>
<% //1. 파라미터 값 추출
	String id = request.getParameter("id");
	String pw = request.getParameter("pwd");
	
	//2. 전달받은 값(id, pwd) 사용 로그인 처리
	//DB에 있는 데이터를 확인해서 처리해야 하지만, 간단히 처리
	//id : rexypark, pwd : qkrtjdrn12#이면 로그인 성공처리 그외 실패처리
	boolean loginResult = false;
	
	if (id.equals("rexypark") && pw.equals("qkrtjdrn12#")) {
		loginResult = true;
	}
	
	//3. 로그인 성공/실패 여부에 따라 session 값 설정
	if(loginResult) {//로그인 성공
		session.setAttribute("login_check", "success");
		session.setAttribute("id", id);
	} else {
		session.setAttribute("login_check", "fail");
	}
	
	//4. 페이지 전환(로그인 페이지로 이동) 
	response.sendRedirect("ex02_login.jsp");
%>