<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오류 처리 페이지</title>
<script>
	function go() {
		alert("[예외발생] 이전페이지로 이동합니다.");
		history.back(); //history.go(-1); 과 동일
	}
</script>
</head>
<body onload="go()">

</body>
</html>