<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function dept_search(frm) {
		//frm.action = "deptList.jsp"; jsp 예전방식
		frm.action = "deptList";
		frm.submit();
		
	}
</script>
</head>
<body>

	<h2>부서코드로 검색(dept.jsp)</h2>
	<form method="post">
		<label>부서코드</label> : <input type="text" name="deptno">
		<input type="button" value="부서코드로 검색" onclick="dept_search(this.form)">
	</form>
<!-- action="loacation"<input type="submit" value="부서코드로 검색"> -->

</body>
</html>