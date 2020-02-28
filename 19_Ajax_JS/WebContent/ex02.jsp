<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>XMLHttpRequest 진행상태 확인</h1>
<script>
	//JavaScript의 Ajax는 XMLHttpRequest 객체사용
	//1. XMLHttpRequest 객체 생성
	var request = new XMLHttpRequest();
	/* XMLHttpRequest.readyState : 데이터 전달 결과 상태를 표시
	0 : 객체생성, open 안한 상태
	1 : open상태, send 안한 상태
	2 : send 진행한 상태, 데이터가 발견되지 않은 상태
	3 : 일부 데이터만 닫은 상태(데이터를 받는 중)
	4 : 데이터를 전부 응답 받은 경우
	
	XMLHttpRequest.status : 응답 결과 값
	200(성공), 4xx(클라이언트 오류), 5xx(서버오류 - 개발자 실수)
	
	*/
	var cnt = 1;
	
	
	
	request.onreadystatechange = function() {

		alert("onreadystatechange 실행 횟수 : " + cnt++
				 + "\n readyState : " + request.readyState
				 + "\n status : " + request.status);
	};
	
	alert("open()실행 전 : " + cnt++
			 + "\n readyState : " + request.readyState
			 + "\n status : " + request.status);
	
	
	//2. open("전송방식", "요청정보", "비동기여부")
	request.open("GET", "data.html",false);
	alert("open()실행 후, send()실행 전 : " + cnt++
			 + "\n readyState : " + request.readyState
			 + "\n status : " + request.status);
	
	//3. send() : 실행
	request.send();
	alert("send() 실행 후 : " + cnt++
			 + "\n readyState : " + request.readyState
			 + "\n status : " + request.status);
	
	
	
	//4. 응답데이터 처리(서버로 부터 전달받은 데이터)
	alert("reqeust.responseText : \n" + request.responseText);
	//body에 해당 태그 추가
	document.body.innerHTML += request.responseText;
	
	
</script>
</body>
</html>