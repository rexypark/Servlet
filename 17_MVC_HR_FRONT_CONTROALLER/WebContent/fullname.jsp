<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function name_search(frm) {
		//frm.action = "deptList.jsp"; jsp 예전방식
		//frm.action = "nameList";
		frm.action = "MyController?type=nameList";
		frm.submit();
		
	}
</script>
</head>
<body>

	<h2>이름 검색(fullName.jsp)</h2>
	<form method="post">
		<label>이름</label> : <input type="text" name="name">
		<input type="button" value="이름 검색" onclick="name_search(this.form)">
	</form>
<!-- action="loacation"<input type="submit" value="부서코드로 검색"> -->

</body>
</html>