<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<jsp:useBean id="cart" class="com.bc.mybatis.Cart" scope="session"/>
<%
	String p_num = request.getParameter("p_num");
	System.out.println("p_num : " + p_num);
	System.out.println("cart.getList() : " + cart.getList());
	cart.delProduct(p_num);
	
	response.sendRedirect("cartList.jsp");
%>