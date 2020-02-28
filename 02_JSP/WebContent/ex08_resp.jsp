<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	//coffee의 val(key값)에 따른 메뉴와 가격을 저장하는 Map생성
 	Map<String, String[]> caffee_menu = new HashMap<String, String[]>();
 	//커피의 메뉴와 가격을 리스트화
 	String[][] coffee_info = {{"아메리카노","3000"}, {"카페모카","3500"}, 
 							  {"에소프레소","2500"}, {"카페라떼","4000"}};
%>

<%
	//getParameter
	String coffee = request.getParameter("coffee");
	String su = request.getParameter("su");
	String givenMoney = request.getParameter("money");
	//----------------------------
	
	//커피 value와 메뉴이름, 가격 매칭
	caffee_menu.put("1", coffee_info[0]);
	caffee_menu.put("2", coffee_info[1]);
	caffee_menu.put("3", coffee_info[2]);
	caffee_menu.put("4", coffee_info[3]);
	 
	 
	//----------------------------
	
	//주문 커피
	String ordered_coffee = caffee_menu.get(coffee)[0];
	
	//주문 커피 가격
	int ordered_coffee_price = Integer.parseInt(caffee_menu.get(coffee)[1]);
	 
	//수량
	int cnt = Integer.parseInt(su);
	 
	//합계금액
	int totPrice = ordered_coffee_price*cnt;
	 
    //입금액
	int inputMoney = Integer.parseInt(givenMoney);
	 
	//잔돈
	int exchange = inputMoney - (totPrice);
	
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커피계산</title>
</head>
<body>
	<h2>주문 계산 결과</h2>
	<%-- 커피종류 : 아메리카노
	단가 : 3000원
	수량 : 3개
	총금액 : 9000원
	--------------------
	입금액 : 10000원
	
	잔돈 : 1000원
	
	
	
	 --%>
	 
	 
	 <%
	 
	 %>
	 
	 
	<ul>
		<li>주문 커피 : <%=ordered_coffee %></li>
		<li>단가 : <%=ordered_coffee_price %></li>
		<li>수량 : <%=cnt %></li>
		<li>-----------------</li>
		<li>입금액 : <%=inputMoney %></li>
		<li>합계금액 : <%=totPrice %></li>
		
		<li> </li>
		<li>잔돈 : <%=exchange %></li>
	</ul>
</body>
</html>