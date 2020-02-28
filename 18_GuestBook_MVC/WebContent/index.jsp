<%@page import="com.bc.model.vo.GuestbookVO"%>
<%@page import="java.util.List"%>
<%@page import="com.bc.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
 <link href="css/board.css" rel="stylesheet" type="text/css">
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
	<c:choose>
	<c:when test="${not empty list }">
		<c:forEach var="vo" items="${list}">
			<tr>
				<td class="center">${vo.idx }</td>
				<td class="center">${vo.name }</td>
				<td>
					<a href="onelist.jsp?idx=${vo.idx }">${vo.getSubject()}</a>
				</td>
				<td>${vo.getRegdate() }</td>
			</tr>
		</c:forEach>
	</c:when>
	<c:otherwise>
			<tr>
			<td colspan='4'>데이터가 없습니다</td>
			</tr>

	</c:otherwise>
	</c:choose>
			</tbody>
			<tfoot>
			<tr>
				<td colspan="4">
				<ol class="paging">
				<%--이전으로에 대한 사용여부 처리--%>
				<c:choose>
					<%--사용불가(disable) : 첫번째 블록인 경우--%>
					<c:when test="${pvo.beginPage == 1}">
						<li class="disable">이전으로</li>
					</c:when>
					<c:otherwise>
						<li>
												<!-- 이전으로 클릭 할 시 현재 블록의 시작 페이지에서 1을 뺀 값 -->
						<a href="list.jsp?cPage=${pvo.beginPage - 1}">이전으로</a>
						</li>
					</c:otherwise>
				</c:choose>
				
				
					<c:forEach var="k" begin="${pvo.beginPage}" end="${pvo.endPage}">
						<c:choose>
							<c:when test="${k == pvo.nowPage}">
								<li class="now">${k }</li>
							</c:when>
							<c:otherwise>
								<li>
									<a href="list.jsp?cPage=${k}">${k}</a>
								</li>	
							</c:otherwise>
						
						</c:choose>
					</c:forEach>
					
					<%--다음으로에 대한 사용여부 처리--%>
					<c:choose>
					<%--사용불가(disable) : 첫번째 블록인 경우--%>
					<c:when test="${pvo.endPage >= pvo.totalPage}">
						<li class="disable">다음으로</li>
					</c:when>
					<c:otherwise>
						<li>
												<!-- 다음으로 클릭 할 시 현재 블록의 시작 페이지에서 1을 더한 값 -->
						<a href="list.jsp?cPage=${pvo.endPage + 1}">다음으로</a>
						</li>
					</c:otherwise>
				</c:choose>
				</ol>
				</td>
			</tr>
			
			</tfoot>	
	</table>

</div>

</body>
</html>












