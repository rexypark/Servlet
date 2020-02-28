<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 ID 데이터 삭제하고 전체 데이터 보여주기--%>
<%
	//전달받은 아이디(id) 추출
	String id = request.getParameter("id");

	//JDBC 프로그램을 위한 변수 선언
	String driver = "oracle.jdbc.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "SQLD_CBT";
	String password = "sqld";
	
	Connection conn = null;
	PreparedStatement pstmt = null;

	int result = 0;
	try {
		//1. 드라이버 로딩
		Class.forName(driver);
		//2. DB연결
		conn = DriverManager.getConnection(url, user, password);
		
		//사용할 쿼리 작성
		String sql = "";
		sql += "DELETE FROM MEMBER2 WHERE ID2 = ? ";
		
		//3. Statement 객체 생성(Connection 객체로 부터)
		pstmt = conn.prepareStatement(sql);
		
		//바인드 변수에 값 매핑(id)
		pstmt.setString(1, id);
		
		//4. 쿼리실행
		result = pstmt.executeUpdate();
	
		response.sendRedirect("selectAll.jsp");
		
	} catch (Exception e) {
		//예외처리
		e.printStackTrace();
		response.sendRedirect("error.jsp");
	} finally {
		try {
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("> delete finally 실행 끝");
	}
%>	













