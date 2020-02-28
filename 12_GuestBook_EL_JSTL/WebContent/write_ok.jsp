<%@page import="com.bc.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.bc.mybatis.GuestbookVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 데이터를 DB에 저장(write_ok.jsp)
	입력성공시 : 목록페이지로 이동(list.jsp)
	입력실패(예외) : 메시지 표시 후 이전화면(입력페이지) 이동	
--%>
<%
	//(실습) 순서에 따라 입력(insert) 작업 처리
	//0. 한글처리(POST 방식으로 데이터 받았을 떄)
	request.setCharacterEncoding("UTF-8");

//1. 파라미터 값 추추해서 VO객체에 저장
%>
<jsp:useBean id="guestVO" class="com.bc.mybatis.GuestbookVO"/>
<jsp:setProperty property="*" name="guestVO"/>
<%
	//2. SqlSession 객체 생성(DB연동작업용) - 자동커밋 형태로
	SqlSession ss = DBService.getFactory().openSession(true);
	try {
		ss.insert("writeInsert", guestVO);
%>

		<script>
		alert("정상입력되었습니다. \n 목록 페이지로 이동합니다.");
		</script>
<%		response.sendRedirect("list.jsp");	

//3. 매퍼(mapper)의 SQL의 "insert" ID 사용해서 DB에 입력(insert)
	
	} catch (Exception e) {
		e.printStackTrace();
%>
		<script>
		alert("데이터가 없습니다. \n 입력 페이지로 이동합니다.");
		</script>
<%
		response.sendRedirect("write.jsp");
	}
	//4. 작업 후 분기 처리 및 close 처리
	ss.close();
	
	
%>












