<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- ID 검색 데이터 정보 보여주기 --%>
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
	ResultSet rs = null;

	try {
		//1. 드라이버 로딩
		Class.forName(driver);
		//2. DB연결
		conn = DriverManager.getConnection(url, user, password);
		
		//사용할 쿼리 작성
		String sql = "";
		sql += "SELECT IDX, ID, PWD, NAME, AGE, ADDRESS, ";
		sql += "       REG, TO_CHAR(REG, 'YYYY/MM/DD') SREG ";
		sql += "  FROM MEMBER2 ";
		sql += " WHERE ID = ? ";
		
		//3. Statement 객체 생성(Connection 객체로 부터)
		pstmt = conn.prepareStatement(sql);
		
		//바인드 변수에 값 매핑(id)
		pstmt.setString(1, id);
		
		//4. 쿼리실행
		rs = pstmt.executeQuery();
%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 데이터 검색</title>
<script type="text/javascript" src="includee/event.js"></script>
</head>
<body>
	<%-- 테이블형태로 만든 메뉴 및 입력폼 삽입 --%>
	<%@ include file="includee/menu.jspf" %>
	
	<h1>전체 데이터 검색</h1>
	<table border>
	<thead>
		<tr>
			<th>번호</th><th>아이디</th><th>패스워드</th>
			<th>이름</th><th>나이</th><th>주소</th><th>날짜</th>
		</tr>
	</thead>
	<tbody>
<%
		if (rs.next()) { %>
		<tr>
			<td><%=rs.getInt("IDX") %></td>
			<td><%=rs.getString("ID") %></td>
			<td><%=rs.getString("PWD") %></td>
			<td><%=rs.getString("NAME") %></td>
			<td><%=rs.getInt("AGE") %></td>
			<td><%=rs.getString("ADDRESS") %></td>
			<td><%=rs.getString("REG") %></td>
		</tr>
<%		
		}
		%>		
	</tbody>
	</table>
</body>
</html>

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













