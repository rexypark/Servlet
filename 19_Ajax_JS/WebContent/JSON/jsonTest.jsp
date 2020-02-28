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
			//alert("request.responseText : " + request.responseText);
			//document.body.innerHTML += request.responseText;
			//JSON.parse() 사용 : 문자열  -> JS객체화
			var json = JSON.parse(request.responseText);
			alert("json : " + json);
			//alert("json.length : " + json.length);
			//alert("json[0] : " + json[0]["name"] + " "+json[0]["price"]);
			
			//JSON 객체에서 데이터 추출
			var output = "";
			/*for(let i=0; i<json.length; i++) {
				output += "<h2>";
				output += json[i].name + " : "+ json[i].price;
				output += "</h2>";
			}*/
			
			//개선된 for문으로 key값도 차례로 출력 가능
			for(let i in json) {
				output += "<h2>";
				//
				for (let key in json[i]) {
					output += json[i][key] + "&nbsp;&nbsp;";
				}
				output += "</h2>";
			}
			
			document.body.innerHTML += output;
		}
	};
	
	//2. open(전송방식, 요청정보, 비동기여부)
	request.open("GET", "data.json", false);
	
	
	
	//3. send : 실행
	request.send();
	
</script>
</body>
</html>