<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체직원목록</title>
</head>
<body>
	<h2>동적검색(${title })(searchList.jsp)</h2>
	<ul>
		<li>사번, 성명, 직종, 부서코드</li>
		<c:forEach var="vo" items="${searchList }">
		<li>${vo.employee_id}, ${vo.first_name}, ${vo.job_id}, ${vo.department_id}</li>
		</c:forEach>
	</ul>
</body>
</html>