<%@page import="com.bc.mybatis.VO"%>
<%@page import="com.bc.mybatis.DAO"%>
<%@page import="com.bc.mybatis.Paging"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table { width: 700px; }
tr {
	text-align: center;
	padding: 4px 10px;
	background-color: #F6F6F6;
}

th {
	text-align: center;
	padding: 4px 10px;
	background-color: #B2CCFF;
}
/* paging */
table tfoot ol.paging {
	list-style: none;
}

table tfoot ol.paging li {
	float: left;
	margin-right: 8px;
}

table tfoot ol.paging li a {
	display: block;
	padding: 3px 7px;
	border: 1px solid #00B3DC;
	color: #2f313e;
	font-weight: bold;
	text-decoration: none;
}

table tfoot ol.paging li a:hover {
	background: #00B3DC;
	color: white;
	font-weight: bold;
}

.disable {
	padding: 3px 7px;
	border: 1px solid silver;
	color: silver;
}

.now {
	padding: 3px 7px;
	border: 1px solid #ff4aa5;
	background: #ff4aa5;
	color: white;
	font-weight: bold;
}
</style>
</head>
<body>
    <%
		Paging p = new Paging();
		// 1. 전체 게시물의 수를 구한다.
		p.setTotalRecord(DAO.getTotalCount());
		
		p.setTotalPage();

		//  현재 페이지 구하기
		String cPage = request.getParameter("cPage");
		// null 아니면 의 뜻은 (처음 방문이 아니면 뜻과 같음)
		if (cPage != null) {
			p.setNowPage(Integer.parseInt(cPage));
		}

		// 3. 현재 페이지의 시작번호와 끝번호를 구하기
		p.setBegin((p.getNowPage() - 1) * p.getNumPerPage() + 1);
		p.setEnd((p.getBegin() - 1) + p.getNumPerPage());
		System.out.println("p.getEnd() : " + p.getEnd());
		
		// 현재 페이지를 이용한 블록의 시작번호와 끝번호
		p.setBeginPage((int) (((p.getNowPage() - 1) / p.getPagePerBlock()) * p.getPagePerBlock() + 1));
		p.setEndPage(p.getBeginPage() + p.getPagePerBlock() - 1);

		
		// 주의 사항 ; endPage가 totalPage보다 클수 있다.
		if (p.getEndPage() > p.getTotalPage()) {
			p.setEndPage(p.getTotalPage());
		}

		// 여러개의 파라미터값을 vo와 상관없이 매개변수로 사용하는 방법 :map형식 
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("begin", p.getBegin());
		map.put("end", p.getEnd());
		System.out.println("p.getEnd() : " + p.getEnd());
		List<VO> list = DAO.getList(map);
		
		pageContext.setAttribute("list", list);
		pageContext.setAttribute("pvo", p);
		pageContext.setAttribute("cPage", cPage);
		
	%>
	<h2>BBS 리스트</h2>
	<table>
	
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>글쓴이</th>
			<th>날짜</th>
			<th>조회수</th>
		</tr>
		<c:choose>
			<c:when test="${empty list}">
				<tr>
					<td colspan="5"><h2>등록된 자료가 없습니다.</h2></td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="k" items="${list}">
					<tr>
						<td>${k.r_num}</td>
						<td align="left">
						   <c:forEach var="k2" begin="1" end="${k.step}" step="1">
								&nbsp;&nbsp;
							</c:forEach> 
							<a href="view.jsp?seq=${k.seq}&cPage=${pvo.nowPage}">ㄴ${k.title}</a></td>
						<td>${k.writer}</td>
						<%-- <td>${k.regdate.substring(0,10)}</td> --%>
						<td><fmt:formatDate value="${k.regdate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						<td>${k.hit}</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		<tfoot>
			<tr>
				<td colspan="4">
					<ol class="paging">
						<c:choose>
							<c:when test="${pvo.beginPage < pvo.pagePerBlock}">
								<li class="disable">이전으로</li>
							</c:when>
							<c:otherwise>
								<li><a 
								href="list.jsp?cPage=${pvo.beginPage - pvo.pagePerBlock}">이전으로</a></li>>
						  	</c:otherwise>
						</c:choose>

						<c:forEach var="k" begin="${pvo.beginPage }" end="${pvo.endPage}" step="1">
							<c:if test="${k == pvo.nowPage}">
								<li class="now">${k}</li>
							</c:if>
							<c:if test="${k != pvo.nowPage}">
								<li><a href="list.jsp?cPage=${k }">${k }</a></li>
							</c:if>
						</c:forEach>
						
						<c:choose>
							<c:when test="${pvo.endPage >= pvo.totalPage}">
								<li class="disable">다음으로</li>
							</c:when>
							<c:otherwise>
								<li><a href="list.jsp?cPage=${pvo.beginPage + pvo.pagePerBlock}">다음으로</a></li>
						  	</c:otherwise>
						</c:choose>
					</ol>
				</td>
				<td><input type="button" value="글쓰기" onclick="javascript:location.href='write.jsp'" /> </td>
			</tr>
		</tfoot>
	</table>
</body>
</html>






