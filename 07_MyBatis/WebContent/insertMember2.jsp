<%@page import="java.io.IOException"%>
<%@page import="com.sun.xml.internal.ws.policy.privateutil.PolicyUtils.IO"%>
<%@page import="com.study.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//전달 받은 데이터 추출
/*
	1. 파라미터 값을 MemberVO 타입의 객체(memberVO)에 저장
	2. mapper 파일에 있는 insert Member id에 있는 SQL문 사용
	   memberVO 객체를 파라미터 값으로 전달
	3. 페이지 이동 : selectAll 
	//SqlSessionFactory factory = DBService.getFactory();
	//SqlSession sqlSession = factory.openSession();

	openSession(true) : 자동 커밋상태로 세션 객체 생성
	openSession(), openSession(false) : Auto Commit 해제 선택(별도 트랜잭션)
	- insert, update, delete 작업 후 반드시 commit, rollback 할 것
			
	//mapper 데이터 조회 결과 두가지 형태
	SqlSession.selectList(mapper의 id명) : select 결과가 여러개(n개)
	SqlSession.selectOne(mapper의 id명) : select 결과가 여러개(0, 1개)
	
*/
%>

<%-- useBean을 활용 하여 memberVO변수에 MemberVO 객체 생성 --%>
<jsp:useBean id="memberVO" class="com.study.mybatis.MemberVO" scope="request"/>

<%-- memberVO 변수에 모든 값을 저장 --%>
<jsp:setProperty property="*" name="memberVO"/>

<%
	System.out.print("memberVO : " + memberVO);

	//factory에 SqlSessionFactory객체(DB생성 공장)를 선언
	SqlSessionFactory factory = DBService.getFactory();
	
	//SqlSession객체를 생성하여 factory를 실행한다. 
	//.openSession(); default = false이다.(no auto commit)
	//no auto commit일 시 만약 데이터가 없으면 처리를 하지 않는다. 
	SqlSession sqlSession = factory.openSession();
	
	//mapper id > insertMember2에 memberVO를 전달
	int result = 0;
	try {
		result = sqlSession.insert("insertMember2",memberVO);
		sqlSession.commit();
	} catch (Exception e) {
		sqlSession.rollback();
	} finally {
		sqlSession.close();
	}
	
	response.sendRedirect("selectAll.jsp");
	
%>


