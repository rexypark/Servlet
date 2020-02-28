<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//전달받은 데이터를 사용해서 DB 데이터 삭제 처리
	//정상삭제후 : list.jsp 이동
	//예외 발생 시 : 현재 페이지 보여주기
	
	String driver = "oracle.jdbc.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "SQLD_CBT";
	String password = "sqld";
	
	int empNo = Integer.parseInt(request.getParameter("idx"));
	System.out.print("empNo : " + empNo);
	Connection conn = null;
	PreparedStatement  pstmt = null;
	ResultSet rs = null;
	
	
	//사용할 쿼리 작성
	String sql = "";
	
	sql += "DELETE FROM GUEST " ;
	sql += " WHERE SABUN = ? ";

	try {
		//1. 드라이버 로딩
		Class.forName(driver);
		//2. DB연결
		conn = DriverManager.getConnection(url, user, password);
		//3. Statement 객체 생성(Connection 객체로 부터)
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, empNo);
		//4. 쿼리실행
		int cnt = pstmt.executeUpdate();
		//5. 쿼리 실행 결과 처리
		//키값으로 조회하는 경우 if
		if(cnt>0) {
			response.sendRedirect("list.jsp");
		}
	} catch (Exception e) {
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">`
<title>사원정보 삭제 실패</title>
</head>
<body>
	<h1>사원 삭제 실패</h1>
	<p>삭제작업 처리를 하지 못했습니다.<br>
	[상세페이지로 이동] 클릭해서 다시 작업하세요.</p>
	<a href="detail.jsp?idx=<%=empNo %>"></a>
	<a href="list.jsp"></a>
	
</body>
</html>
<%
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