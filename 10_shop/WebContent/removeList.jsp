<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="cart" class="com.bc.mybatis.Cart"></jsp:useBean>
<%
	String p_num = request.getParameter("p_num");
	System.out.println("p_num : " + p_num);
	
	cart.delProduct(p_num);
	
	response.sendRedirect("cartList.jsp");
%>