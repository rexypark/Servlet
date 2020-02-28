<%@page import="com.bc.mybatis.ShopDAO"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.bc.mybatis.ShopVO"%>
<%@page import="java.util.List"%>
<%@page import="com.bc.mybatis.DBService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!-- 전달받은 제품목록에 값이 해당하는 제품 정보를 DB에서 조회하면서 목록 생성 -->
    
<%
	//전달받은 파라미터 값 추출
	String category = request.getParameter("category");
	System.out.println("category : " + category);
	//DB데이터 조회
	
	/* 첫번째 방법 
	SqlSession ss = DBService.getFactory().openSession();
	List<ShopVO> list = ss.selectList("list", category);
	System.out.print(list);
	for (ShopVO vo : list) {
		System.out.print(vo);
	}
	
	
	//jsp:useBean 동작방식
	ShopDAO dao =(ShopDAO)session.getAttribute("dao");
	if (dao == null) {
		dao = new ShopDAO();
		session.setAttribute("dao", dao);
	}*/
%>
	<%-- 두번째 방법(DAO) --%>
<jsp:useBean id="dao" class="com.bc.mybatis.ShopDAO" scope="session"/>
<% 
	/*
	System.out.println("category : " + category);
	System.out.println("dao : " + dao.list(category));
	List<ShopVO> list = dao.list(category);
	for (ShopVO vo : list) {
		System.out.println("vo : " + vo);
	}
	*/
	pageContext.setAttribute("list", dao.list(category));
	System.out.println("list : " + pageContext.getAttribute("list"));
	
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품목록</title>
<style>
	table {
		width: 600px;
		margin: 30px auto 0 auto; /*상 우 하 좌 */
		border: 1px solid navy;
		border-collapse: collapse;
		font-size: 0.8em;
	}
	th, td { border: 1px solid navy; padding: 4px; }
	th { background-color: #dedede; }
	.red { color: red; }
</style>
</head>
<body>
	<jsp:include page="shop.jsp"></jsp:include>
	<table border>
		<tr>
			<th width="15%">제품번호</th>
			<th width="10%">이미지</th>
			<th width="20%">제품명</th>
			<th width="15%">제품가격</th>
			<th width="15%">비고</th>
		</tr>
<%--
		<tr>
			<td>vC-13</td>
			<td>
				<img src="images/pds1.jpg" width="100px" height="95px">
			</td>
			<td>제품명</td>
			<td>제품가격(판매가)
				<span class="red">할인율:40%</span>
			</td>
			<td>가격(원가)</td>
		</tr>
 --%>
 <c:if test="${list.size() <= 0}">
 	<tr>
	 	<td colspan='5'>
	 		현재 등록된 데이터가 없습니다.
	 	</td>
 	</tr>
 </c:if>
  <c:if test="${list.size() > 0}">
  	<c:forEach items="${list }" var="vo">
  		<tr>
			<td>
				<a href="product_content.jsp?p_num=${vo.getP_num() }">
					 ${vo.getP_num()  }
				</a>
			</td>
			<td>
				<img src="images/${vo.getP_image_s() }"  width="100px" height="95px">
			</td>
			<td>${vo.getP_name() }</td>
			<td>
				할인가 : ${vo.getP_saleprice() }원
				<br>
				<span class="red">
					(할인율 : ${vo.getPercent() }%)
				</span>
			</td>
			<td>${vo.getP_price() }원</td>
		</tr>
  	</c:forEach>
  </c:if>

	</table>
</body>
</html>