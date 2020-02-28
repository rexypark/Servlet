<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	// 1. 전달 받은 데이터 확인
	String product = (String)request.getParameter("product");
	System.out.println("product : " + product);
	// 2. 장바구니에 담기 ㅣ ArrayList에 저장
	ArrayList<String> list = (ArrayList<String>)session.getAttribute("product_list");
	if(list == null) {
		session.setAttribute("product_list", new ArrayList<String>());
		list = (ArrayList<String>)session.getAttribute("product_list");
	}
	list.add(product); //목록 (장바구니)
	System.out.println("list : " + list);
%>

<script>
	// 3. 쇼핑페이지로 이동(페이지 전환)
	alert("[<%=product %>]이 추가되었습니다.");
	history.go(-1); //뒤로 이동하기(이전으로)
</script>