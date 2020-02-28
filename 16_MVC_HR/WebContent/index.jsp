<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	//frm.action = "list.jsp"예정방식 list.jsp직접 호출
	function all_search(frm) {
		frm.action="list";//list 요청
		frm.submit();
	}
	function dept_search(frm) {
		frm.action="dept";//dept 요청(dept 입력 페이지로 이동)
		frm.submit();
	}
	function fullname_search(frm) {
		frm.action="fullName";//dept 요청(dept 입력 페이지로 이동)
		frm.submit();
	}
	function fullname_search_go(frm) {
		frm.action="searchBar";
		frm.submit();
	}
</script>
</head>
<body>
	<h1>작업선택(index.jsp)</h1>
	<form method="post">
		<input type="button" value="전체보기"
			   onclick="all_search(this.form)">
		<input type="button" value="부서코드 검색"
			   onclick="dept_search(this.form)"> 
		<input type="button" value="성명 검색(성,이름 포함)"
			   onclick="fullname_search(this.form)"> 
		<!-- 하나의 요청명(search)으로 분기 처리 -->
		<input type="button" value="동적 검색"
			   onclick="fullname_search_go(this.form)"> 
	</form>
</body>
</html>