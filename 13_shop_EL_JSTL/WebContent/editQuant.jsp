<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 장바구니(cart)에 담고, 제품상세페이지로 이동
	1. 제품번호, 수량을 받아 해당 제품의 수량을 변경
	2. 장바구니 리스트로 돌아가기
	3. 장바구니에 담은 후 다시 상세페이지로 이동
	   (제품번호의 상세정보 표시 : 제품번호 전달)
--%>
<jsp:useBean id="cart" class="com.bc.mybatis.Cart" scope="session"/>

<%
	//전달 받은 파라미터 추출
	String p_num = request.getParameter("p_num");
	int quant = Integer.parseInt(request.getParameter("quant"));
	System.out.println("> p_num : " + p_num);
	System.out.println("> quant : " + quant);
	
	//해당 제품 개수 바꾸기
	cart.changeQuant(p_num, quant);
	System.out.println("> 카트 금액 : " + cart.getList().toString());
	
	//제품 상세페이지로 이동
	response.sendRedirect("cartList.jsp");
%>

