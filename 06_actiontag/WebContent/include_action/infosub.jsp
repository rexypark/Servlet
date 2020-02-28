<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String type = request.getParameter("type");
%>
<table border="1" width="500">
	<tr>
		<th>제품타입</th>
		<td><%=type %></td>
	</tr>
	<tr>
		<th>제품특징</th>
		<td>
<%
	if("A".equalsIgnoreCase(type)) {
		out.print("튼튼하고 단단한 재질");
	} else if ("B".equalsIgnoreCase(type)) {
		out.print("세련된 디자인과 색상~~~~");
	}
%>		
		</td>
	</tr>
</table>