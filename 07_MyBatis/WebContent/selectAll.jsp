<%@page import="java.io.IOException"%>
<%@page import="com.study.mybatis.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="com.study.mybatis.DBService"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전체 데이터 정보 보여주기 --%>
<%
	//SqlSessionFactory factory = DBService.getFactory();
	//SqlSession sqlSession = factory.openSession();

	/*  openSession(true) : 자동 커밋상태로 세션 객체 생성
		openSession(), openSession(false) : Auto Commit 해제 선택(별도 트랜잭션)
			- insert, update, delete 작업 후 반드시 commit, rollback 할 것
			
		//mapper 데이터 조회 결과 두가지 형태
		SqlSession.selectList(mapper의 id명) : select 결과가 여러개(n개)
		SqlSession.selectOne(mapper의 id명) : select 결과가 여러개(0, 1개)
		
	*/
	
	//SqlSession 객체를 얻기(NO auto commit)
	SqlSession sqlSession = DBService.getFactory().openSession();
	List<MemberVO> memberList = sqlSession.selectList("selectAll");
	System.out.println("memberList : " + memberList);
	
	sqlSession.close();
	
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
<%
	//데이터 출력
	if(memberList.size() > 0) {
		for (MemberVO vo : memberList) {%>
		<ul>
			<li>idx : <%=vo.getIdx() %>
				id : <%=vo.getId() %>
				pwd : <%=vo.getPwd() %>
				name : <%=vo.getName() %>
				age : <%=vo.getAge() %>
				address : <%=vo.getAddress() %>
				reg : <%=vo.getReg() %>
				
			</li>
		</ul>
<%		
		}
	} else { // 조회 데이터 없음
		System.out.println("조회 데이터 없음");	
	}
%>
</body>
</html>
