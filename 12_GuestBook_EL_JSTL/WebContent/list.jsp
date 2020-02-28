<%@page import="com.bc.mybatis.GuestbookVO"%>
<%@page import="java.util.List"%>
<%@page import="com.bc.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	//DB에 있는 데이터 전체 가져와서 화면에 표시
	//1. SqlSession 객체 생성
	SqlSession ss = DBService.getFactory().openSession();
	
	//2. 매퍼의 SQl문 실행
	//List<GuestbookVO> list = ss.selectList("all");
	//ss.close();
	
	//------------------------------------------------
	//2. EL, JSTL 사용하기 위해 scope에 등록
	pageContext.setAttribute("attr_list", ss.selectList("all"));
	ss.close();
	System.out.print(pageContext.getAttribute("attr_list"));
	//3. SQL문 실행 후 받은 결과 처리
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체목록</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<!-- <link href="css/guestbook.css" rel="stylesheet" type="text/css"> -->
<style>
	div { width:70%;  margin: auto;}
	div > h2, div > p { text-align: center;}
	table { border: 1px solid lightgray;}
	table > tr:hover { background:"lightgray"; }
</style>
</head>
<body>

<div id="container">
	<h2>방명록</h2>
	<hr>
	<p><a href="write.jsp">[방명록 쓰기]</a></p>
	
	<table class="table">
		<thead>
			<tr>
				<th>번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>작성일시</th>
			</tr>
		</thead>
		<tbody>
	<c:if test="${not empty attr_list.size() }">
		<c:forEach items="${attr_list}" var="vo">
			<tr>
				<td class="center">${vo.getIdx() }</td>
				<td class="center">${vo.getName() }</td>
				<td>
					<a href="onelist.jsp?idx=${vo.getIdx() }">${vo.getSubject() }</a>
				</td>
				<td>${vo.getRegdate() }</td>
			</tr>
		</c:forEach>
	</c:if>
	
	<c:if test="${empty attr_list.size() }">
			<tr>
			<td colspan='4'>데이터가 없습니다</td>
			</tr>
	</c:if>

		</tbody>
	</table>

</div>

</body>
</html>












