<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 데이터를 사용해서 DB에 입력처리

--%>
<%
	final String DRIVER = "oracle.jdbc.OracleDriver";
	final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	final String USER = "SQLD_CBT";
	final String PASSWORD = "sqld";
	
	
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	//-------------- getParameter
	//String empNo = request.getParameter("sabun");
	//String name = request.getParameter("name");
	//String pay = request.getParameter("pay");
	
	int empNo = Integer.parseInt(request.getParameter("sabun"));
	String name = request.getParameter("name");
	int pay = Integer.parseInt(request.getParameter("pay"));
	
	System.out.println("사번 : " + empNo + "이름 : " + name + "금액 : " + pay);
	
	//String sql = "INSERT INTO GUEST (SABUN, NAME, NALJA, PAY )";
	//sql += "VALUES (" + empNo + ", '" + name + "', SYSDATE, " + pay + ")";
	
	String sql = "INSERT INTO GUEST (SABUN, NAME, NALJA, PAY )";
	sql += "VALUES (?, ?, SYSDATE, ?)";
	
	%>
<%-- --%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
	int cnt = 0;
	
	try {
		//1. 드라이버 로딩
		Class.forName(DRIVER);
		//2. DB연결
		conn = DriverManager.getConnection(URL, USER, PASSWORD);
		//3. Statement 객체 생성(Connection 객체로 부터)
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1,empNo);
		pstmt.setString(2,name);
		pstmt.setInt(3,pay);
		
		//4. 쿼리실행
		cnt = pstmt.executeUpdate();
		//5. 쿼리 실행 결과 처리
		if(cnt>0) {
			response.sendRedirect("list.jsp");
		} else {
		
		}
		
	} catch (Exception e) {
%>
		<h1>사원 등록 실패</h1>
		<p>입력작업 처리를 하지 못했습니다.<br>
		[입력페이지로 이동] 클릭해서 다시 작업하세요
		</p>
		<a href="addForm.jsp">입력페이지 이동</a>			
		
<%	
		//예외처리
		e.printStackTrace();
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
</body>
</html>

