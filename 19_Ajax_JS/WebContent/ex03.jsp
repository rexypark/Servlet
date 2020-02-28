<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Java Ajax</title>
</head>
<body>
	<h1>JavaScript Ajax</h1>
	
<script>
	//JavaScript의 Ajax는 XMLHttpRequest 객체사용
	//1. XMLHttpRequest 객체 생성
	var request = new XMLHttpRequest();
	
	request.onreadystatechange = function() {
		if (request.readyState == 4
				 && request.status == 200) {
			document.body.innerHTML += request.responseText;
			
		}
		
	};
	
	//2. open(전송방식, 요청정보, 비동기여부)
	request.open("GET", "data2.html", false);
	
	//3. send : 실행
	request.send();
	
	
	
</script>
</body>
</html>