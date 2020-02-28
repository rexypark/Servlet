<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String driver = "oracle.jdbc.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "SQLD_CBT";
	String password = "sqld";
	
	Connection conn = null;
	PreparedStatement  pstmt = null;
	ResultSet rs = null;
	
	String sqlCnt = "SELECT MAX(IDX) AS MAXIDX FROM STUDENT02 ";

	try {
		//1. 드라이버 로딩
		Class.forName(driver);
		//2. DB연결
		conn = DriverManager.getConnection(url, user, password);
		//3. Statement 객체 생성(Connection 객체로 부터)
		pstmt = conn.prepareStatement(sqlCnt);
		//4. 쿼리실행
		rs = pstmt.executeQuery();
		int maxIdx = 0;
		if(rs.next()) {
			maxIdx = rs.getInt("MAXIDX") + 1111;
		}
%>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main page</title>
<style>
	table { border-collapse: collapse; width: 800px; }
	
	th, td { border: 1px solid black; }
	
	p#center { width: 80%; margin: auto; }
	
	h1, h2 { text-align: center; }
	
	table table { width: 50%; margin: auto; }
	
</style>
</head>
<body>

	<table border>
		<tr>
			<th><a href="main.jsp"><img src="../imgs/bitcamp_logo.png"></a></th>
			<th width="100px"><a href="stuList.jsp">조회</a></th>
			<th width="100px" bgcolor="orange"><a href="stuForm.jsp">학생등록</a></th>
			<th width="100px"><a href="stuAdd.jsp">성적입력</a></th>
			<th width="100px"><a href="stuDel.jsp">데이터 삭제</a></th>
		</tr>
		<tr>
			<td colspan="5" height="400px">
				<div>
					<h1>학생 정보 입력</h1>
					<form action="stuInsert.jsp">
						<table>
							<tr>
								<th>학번</th>

								<td><input type="text" name="idx" value="<%=maxIdx %>" readonly></td>
							</tr>
							<tr>
								<th>이름</th>
								<td><input type="text" name="name"></td>
							</tr>
							<tr>
								<td colspan="2">
									<input type="submit" value="입력">
									<input type="reset" value="취소">
								</td>
							</tr>
						</table>
					</form>
				</div>
			</td>
		</tr>
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