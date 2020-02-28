<%@page import="com.bc.mybatis.VO"%>
<%@page import="com.bc.mybatis.DAO"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("utf-8");
	int groups = Integer.parseInt(request.getParameter("groups"));
	int step = Integer.parseInt(request.getParameter("step"));  
	int lev = Integer.parseInt(request.getParameter("lev"));

	String writer = request.getParameter("writer");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String pwd = request.getParameter("pwd");
	String ip = request.getRemoteAddr();
	
	// 댓글은 일단 lev, step 을 증가
	// 3 1 1
	lev ++;
	step ++;
	
	// DB는 groups, lev 사용 해서 업데이트를 함 
	Map<String,Integer> map = new HashMap<String,Integer>();
	map.put("groups", groups);
	map.put("lev", lev);

	DAO.getUpdateLev(map); //lev 일괄 업데이트 : 같거나 큰 번호 1씩 증가
	
	VO vo = new VO();
	vo.setWriter(writer);
	vo.setTitle(title);
	vo.setContent(content);
	vo.setPwd(pwd);
	vo.setGroups(groups);
	vo.setStep(step);
	vo.setLev(lev);
	vo.setFilename("");
	vo.setIp(ip);
	
	DAO.getReInsert(vo);
	response.sendRedirect("list.jsp");
%>


















