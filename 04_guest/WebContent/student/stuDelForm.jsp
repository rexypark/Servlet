<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//JDBC 프로그램을 위한 변수 선언
	//CONNECTION / PREPAREDSTATEMENT SELECT QUERY
	String driver = "oracle.jdbc.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "SQLD_CBT";
	String password = "sqld";
	
	Connection conn = null;
	PreparedStatement  pstmt = null;
	ResultSet rs = null;
	//사용할 쿼리 작성
	String sql = "";
	
	sql += "SELECT IDX, NAME, KOR, ENG, MATH " ;
	sql +=	" FROM STUDENT02";
	sql +=	" ORDER BY IDX ";
	
	String sqlCnt = "select count(*) as cnt from guest";

	try {
		//1. 드라이버 로딩
		Class.forName(driver);
		//2. DB연결
		conn = DriverManager.getConnection(url, user, password);
		//3. Statement 객체 생성(Connection 객체로 부터)
		pstmt = conn.prepareStatement(sql);
		//4. 쿼리실행
		rs = pstmt.executeQuery();
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main page</title>
<style>
	table { border-collapse: collapse; width: 800px; }
	th, td { border: 1px solid black; }
	
	h1,h2 { text-align: center; }
	table table { width: 60%; margin: auto;}
	
</style>
</head>
<body>

	<table border>
		<tr>
			<th><a href="main.jsp"><img src="../imgs/bitcamp_logo.png"></a></th>
			<th width="100px"><a href="stuList.jsp">조회</a></th>
			<th width="100px"><a href="stuForm.jsp">학생등록</a></th>
			<th width="100px"><a href="stuAdd.jsp">성적입력</a></th>
			<th width="100px"><a href="stuDelForm.jsp">데이터 삭제</a></th>
		</tr>
		<tr>
			<td colspan="5" height="400px">
				<center>
					<h1>성적입력 대상자 선택</h1>
					<form action="stuDel.jsp">
						<select name="idx">
<% 
						while(rs.next()) {
							int idx = rs.getInt("idx");
		
%>							<option value="<%=idx %>"><%=idx %></option>
<%
		}
%>
						</select>
						<input type="submit" value="입력">
					</form>
				</center>
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
