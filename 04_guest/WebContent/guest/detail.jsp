<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 사번으로 DB조회해서 데이터 가져와서 화면 출력 --%>
<%
//JDBC 프로그램을 위한 변수 선언
	//CONNECTION / PREPAREDSTATEMENT SELECT QUERY
	String driver = "oracle.jdbc.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "SQLD_CBT";
	String password = "sqld";
	
	int empNo = Integer.parseInt(request.getParameter("idx"));
	System.out.print("empNo : " + empNo);
	Connection conn = null;
	PreparedStatement  pstmt = null;
	ResultSet rs = null;
	
	String name = "";
	Date day = null;
	int pay = 0;
	
	
	//전체 인원수
	int cnt = 0;
	
	//사용할 쿼리 작성
	String sql = "";
	
	sql += "SELECT SABUN, NAME, NALJA, PAY " ;
	sql +=	" FROM GUEST";
	sql +=	" WHERE SABUN = ? ";

	try {
		//1. 드라이버 로딩
		Class.forName(driver);
		//2. DB연결
		conn = DriverManager.getConnection(url, user, password);
		//3. Statement 객체 생성(Connection 객체로 부터)
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, empNo);
		//4. 쿼리실행
		rs = pstmt.executeQuery();
		//5. 쿼리 실행 결과 처리
		//키값으로 조회하는 경우 if
		if(rs.next()) {
			name = rs.getString("name");
			day = rs.getDate("nalja");
			pay = rs.getInt("pay");
		}	
		
			
%>
<%-- 		
	if(rs.next()) {
			<tr>
				<th>사번</th>
				<td><%=empNo %></td>
			</tr>
			<tr>
				<th>성명</th>
				<td><%=rs.getString("name") %></td>
			</tr>
			<tr>
				<th>날짜</th>
				<td><%=rs.getDate("nalja") %></td>
			</tr>
			<tr>
				<th>금액</th>
				<td><%=rs.getInt("pay") %></td>
			</tr>
--%>
<%
	} catch (Exception e) {
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
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>[<%=name %>] 상세정보</h1>
	<table border>
		<tr>
			<th>사번</th>
			<td><%=empNo %></td>
		</tr>
		<tr>
			<th>성명</th>
			<td><%=name %></td>
		</tr>
		<tr>
			<th>날짜</th>
			<td><%=day %></td>
		</tr>
		<tr>
			<th>금액</th>
			<td><%=pay %></td>
		</tr>
	</table>
	<p>
		<a href="editForm.jsp?idx=<%=empNo %>&name=<%=name %>&pay=<%=pay %>">수정</a>
		<a href="delete.jsp?idx=<%=empNo %>">삭제</a>
	</p>
</body>
</html>