<%@page import="com.bc.mybatis.ShopVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
    
<jsp:useBean id="cart" class="com.bc.mybatis.Cart" scope="session"/>
<%
	String p_num = request.getParameter("p_num");
	System.out.println("p_num : " + p_num);
	
	List<ShopVO> shopList =  cart.getList();
	System.out.println("shopList : " + shopList);
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 내역</title>

<style>
	table {
		width: 800px;
		margin: 30px auto 0 auto; /*상 우 하 좌 */
		border: 1px solid navy;
		border-collapse: collapse;
		font-size: 0.8em;
	}
	th, td { border: 1px solid navy; padding: 4px; }
	th { background-color: #dedede; }
	.red { color: red; }
	tfoot {height : 3em; text-align: center; }
	.title { width: 30%; }
</style>
</head>
<body>
<jsp:include page="shop.jsp"></jsp:include>

		<table border>
			<thead>
				<tr>
					<td colspan="6">장바구니 내용</td>
				</tr>		
			</thead>
			<tbody>
				<tr>
					<th>제품번호</th>
					<th>제품명</th>
					<th>단가</th>
					<th>수량</th>
					<th>금액</th>
					<th>삭제</th>
				</tr>
	<%--		
				<tr>
					<td>제품번호</td>
					<td>제품명</td>
					<td>단가
						<span class="red">
							세일가격 : 원
						</span>
					</td>
					<td>
						<input type="text">
						<input type="button" value="수정">
					</td>
					<td>금액</td>
					<td>
						<input type="button" value="삭제">
					</td>
				</tr>
	 --%>


<%
if (shopList == null || shopList.size() <1) {
	%>	
	<tr>
		<td>장바구니가 비었습니다</td>
	</tr>
<%	
	
	
	
} else {
		for (ShopVO vo : shopList) {
			
	%>
				
				<tr>
					<td><%=vo.getP_num() %></td>
					<td><%=vo.getP_name() %></td>
					<td>정가 : <%=vo.getP_price() %>
						<span class="red">
							세일가격 : <%=vo.getP_saleprice() %>원
						</span>
					</td>
					<td>
					<form action="editQuant.jsp" method="get">
						<input type="number" name="quant" value="<%=vo.getQuant() %>">
						<input type="submit" value="수정">
						<input type="hidden" name="p_num" 
					value="<%=vo.getP_num() %>">
					</form>
					</td>
					
					<td><%=vo.getTotalprice() %></td>
					<td>
						<input type="button" value="삭제" onclick="javascript:location.href='removeList.jsp?p_num=<%=vo.getP_num() %>'">
					</td>
					
				</tr>
<script>
//function changeQuant(frm){
		//var val = frm.quant.value;
		//location.href = "editQuant.jsp?p_num=<%=vo.getP_num() %>&quant=" + val;
	//}
	function removeList() {
		location.href = "removeList.jsp?p_num=<%=vo.getP_num() %>&quant=" + val;
		var p_num = <%=vo.getP_num() %>;
		console.log("p_num : " + p_num);
	}
</script>
			
	<%
	} // for close
} //else close
	%>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="6">총결재금액 : <%=cart.getTotal() %>원</td>
				</tr>
			</tfoot>
		</table>

</body>
</html>