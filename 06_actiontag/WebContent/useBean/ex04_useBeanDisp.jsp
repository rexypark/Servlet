<%@page import="com.mystudy.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%-- 전달받은 파라미터 값 VO 저장
	1. MemberVO 타입의 객체(memberVO) 생성
	2. 전달받은 파라미터 값을 memberVO 객체(인스턴스)에 저장
	3. memberVO의 값 가져와서 화면 출력
	MemberVO memberVO = new MemberVO();
	memberVO.setName(request.getParameter("name"));
	memberVO.setName(request.getParameter("age"));
--%>

<jsp:useBean id="memberVO" class="com.mystudy.MemberVO" scope="request"/>
<jsp:setProperty property="*" name="memberVO"/>



<h1>자바빈(Bean, VO)을 이용한 파라미터 출력</h1>
<ul>
	<li>이름 : <%=memberVO.getName() %></li>
	<li>나이 : <%=memberVO.getAge() %></li>
	<li>비밀번호 : <%=memberVO.getPwd() %></li>
	<li>성별 : <%=memberVO.getGender() %></li>
	<li>취미 : 
	<%
	String[] hobbies = memberVO.getHobby();
	for (String hob : hobbies) {
		out.println(hob);
	}
	
	%>	</li>
</ul>

<%
	System.out.println("memberVO : " + memberVO);
%>
