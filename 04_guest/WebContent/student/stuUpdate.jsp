<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 	
	// post방식 시에
	request.setCharacterEncoding("UTF-8");

	//수정할 데이터 : 성명, 날짜(sysdate), 금액
	//정상수정후 : list.jsp 이동
	//예외발생 시 : 현제페이지 보여주기

	String driver = "oracle.jdbc.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "SQLD_CBT";
	String password = "sqld";
	
	int idx = Integer.parseInt(request.getParameter("idx"));
	int kor = Integer.parseInt(request.getParameter("kor"));
	int eng = Integer.parseInt(request.getParameter("eng"));
	int math = Integer.parseInt(request.getParameter("math"));
	System.out.print("idx : " + idx + "kor : " + kor + "eng : " + eng + "math : " + math);
	Connection conn = null;
	PreparedStatement  pstmt = null;
	ResultSet rs = null;
	
	String sql = "UPDATE STUDENT02 SET KOR = ?, ENG = ?, MATH = ? ";
		  sql += "WHERE IDX = ? ";
%>    
<%
	try {
		//1. 드라이버 로딩
		Class.forName(driver);
		//2. DB연결
		conn = DriverManager.getConnection(url, user, password);
		//3. Statement 객체 생성(Connection 객체로 부터)
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, kor);
		pstmt.setInt(2, eng);
		pstmt.setInt(3, math);
		pstmt.setInt(4, idx);
		//4. 쿼리실행
		int cnt = pstmt.executeUpdate();
		//5. 쿼리 실행 결과 처리
		if(cnt > 0 ) {
			response.sendRedirect("stuList.jsp");
		}
		
	} catch (Exception e) {
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>정보 수정 실패</h1>
		<p>정보수정 처리를 하지 못했습니다.<br>
		[수정페이지로 이동] 클릭해서 다시 작업하세요
		</p>
		<a href="stuUpdate.jsp">수정페이지 이동</a>		
</body>
</html>
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

