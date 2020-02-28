<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
	//JavaScript의 Ajax는 XMLHttpRequest 객체사용
	//1. XMLHttpRequest 객체 생성
	var request = new XMLHttpRequest();
	
	request.onreadystatechange = function() {
		if (request.readyState == 4
				 && request.status == 200) {
			var xml = request.responseXML;
			alert("xml : " + xml);
			
			//XML에서 데이터 추출
			var names = xml.getElementsByTagName("name");
			var prices = xml.getElementsByTagName("price");
			
			//추출데이터 사용
			for(let i=0; i<names.length; i++) {
				let name = names[i].childNodes[0].nodeValue;
				let price = prices[i].childNodes[0].nodeValue;
				
				//HTML 태그 작성
				document.body.innerHTML
					+= "<h2>"+ name + ":" + price + "</h2>";
					
			}
		}
	};
	
	//2. open(전송방식, 요청정보, 비동기여부)
	request.open("GET", "data.xml", true);
	
	
	
	//3. send : 실행
	request.send();
	
</script>
</body>
</html>