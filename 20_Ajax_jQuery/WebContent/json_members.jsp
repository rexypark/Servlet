<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ajax JSON</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	$(function(){
		$("#getDataBtn").click(function(){
			console.log("clicked");
			getJsonMembers();
		});
	});
	

	function getJsonMembers() {
		$.ajax("getJsonMembers", {
			type : "get",
			dataType : "json",
			success : function(data){
				//응답데이터 : {"list" : []} 
				alert("응답데이터 : " + data);
				alert("응답데이터(문자열로) : " 
						+ JSON.stringify(data));
				
				//데이터를 HTML 태그에 삽입
				var alist = data.list;
				
				//배열의 인덱스값, 현재 처리하는 객체 데이터
				$.each(alist, function(index, member) {
					//this 객체 : 배열에 저장 된 객체 중 지금 처리되는 객체
					//자바스크립트  객체 속성 사용 방식 2가지
					//1. 객체.속성명
					//2. 객체["속성명"]
					tbody +="<tr>"
					tbody +="<td>" + this.idx + "</td>"
					tbody +="<td>" + this.name + "</td>"
					tbody +="<td>" + this["age"] + "</td>"
					tbody +="<td>" + this["addr"] + "</td>"
					tbody +="<td>" + this["regdate"] + "</td>"
					
					tbody +="<tr>"
				});
				
				$("#tbody").html(tbody);
				
			},
			error : function(jqXHR, textStatus, errorThrown){
				alert("Ajax 처리 실패 : \n"
					+ "jqXHR.readyState : " + jqXHR.readyState +"\n"
					+ "textStatus : " + textStatus +"\n"
					+ "errorThrown : " + errorThrown);
			}
		});
	}
</script>
</head>
<body>
	<h1>Ajax JSON 데이터 요청 처리</h1>
	<button id="getDataBtn">JSON 데이터 가져오기</button>
	<hr>
	<table border>
		<thead>
			<th>번호</th>
			<th>이름</th>
			<th>나이</th>
			<th>주소</th>
			<th>날짜</th>
		</thead>
		<tbody id="tbody">
			<td>1</td>
			<td>rexy</td>
			<td>28</td>
			<td>gyungsangnam-do</td>
			<td>2020.1.6</td>
		</tbody>
	</table>
	
</body>
</html>