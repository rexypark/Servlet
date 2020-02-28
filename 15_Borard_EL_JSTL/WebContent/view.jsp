<%@page import="com.bc.mybatis.DAO"%>
<%@page import="com.bc.mybatis.VO"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%
	request.setCharacterEncoding("utf-8");
    String seq = request.getParameter("seq");
    String cPage = request.getParameter("cPage");
    VO vo = DAO.getOneList(seq); 
    pageContext.setAttribute("vo", vo);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table { width: 700px; }
	tr {
	    text-align:center;
	    padding:4px 10px;
	    background-color: #F6F6F6;
	}
	th {
		width:120px;
	    text-align:center;
	    padding:4px 10px;
	    background-color: #B2CCFF;
	}
	td { text-align: left; }
</style>
<script>
	function re_go(f,g,s,l) {
		f.action="rewrite.jsp?groups="+g+"&step="+s+"&lev="+l;
		f.submit();
	}
</script>
</head>
<body>
   <h2> BBS 리스트 내용 보기 </h2>
	<form method="post">
	<table>
	<tbody>
	<tr>
		<th>작성자</th>
		<td>${vo.writer}</td>
	</tr>
	
	<tr>
		<th>제목</th>
		<td>${vo.title}</td>
	</tr>
	<tr>
		<th>첨부파일</th>
		 <c:choose>
		 	<c:when test="${empty vo.filename} }">
		 		<td>첨부파일없음</td>
		 	</c:when>
		 	<c:otherwise>
		 		<td>${vo.filename}</td>
		 	</c:otherwise>
		 </c:choose>
	</tr>
	<tr>
		<th>날짜</th>
		<%-- <td>${vo.regdate.substring(0,10)}</td> --%>
		<td><fmt:formatDate value="${vo.regdate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
	</tr>
	<tr>
		<th>내용</th>
		<td><pre>${vo.content}</pre></td>
	</tr>
	</tbody>
	<tfoot>
	<tr>
     <td colspan="2">
        <input type="button" value="목록" onclick="javascript:location.href='list.jsp?cPage=<%=cPage%>'" />
        <input type="button" value="답글" onclick="re_go(this.form,${vo.groups},${vo.step},${vo.lev})" />
        <input type="button" value="수정" onclick="" />
        <input type="button" value="삭제" onclick="" />
        <input type="hidden" name="seq" value="" />
	    <input type="hidden" name="pwd" />
     </td>
	</tr>
	</tfoot>
	</table>
	</form>
</body>
</html>