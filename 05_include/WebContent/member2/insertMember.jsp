<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	String addr = request.getParameter("addr");
	
	final String DRIVER = "oracle.jdbc.OracleDriver";
	final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	final String USER = "SQLD_CBT";
	final String PASSWORD = "sqld";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "INSERT INTO MEMBER2 (IDX, ID, PWD, NAME, AGE, ADDRESS, REG) ";
	sql += "VALUES (MEMBER2_SEQ.NEXTVAL, ?, ?, ?, ?, ?, SYSDATE) ";
	
	try {
		//1. 드라이버 로딩
		Class.forName(DRIVER);
		//2. DB연결
		conn = DriverManager.getConnection(URL, USER, PASSWORD);
		//3. Statement 객체 생성(Connection 객체로 부터)
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, id);
		pstmt.setString(2, pwd);
		pstmt.setString(3, name);
		pstmt.setInt(4, age);
		pstmt.setString(5, addr);

		//4. 쿼리실행
		int cnt = pstmt.executeUpdate();
		//5. 쿼리 실행 결과 처리
		if(cnt>0) {
			response.sendRedirect("selectAll.jsp");
		} else {
		
		}
		
	} catch (Exception e) {
		//예외처리
		e.printStackTrace();
		response.sendRedirect("error.jsp");
	} finally {
		try {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
			
	}
%>
