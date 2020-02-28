<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ajax XML</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	$(function(){
		$("#getDataBtn").click(function(){
			console.log("clicked");
			getXMLMembers();
		});
	});
	
	function getXMLMembers(){
		$.ajax({
			url : "getXMLMembers",	
			type : "get",	
			dataType : "xml",	
			//data = "name="+name+"&age=27" //서버로 전달 할 데이터 작성
			//data : $("inputForm").serialize(), //form 데이터 파라미터 전달
				
			success : function(data){
				alert("data : " + data)
				var tbody="";
				//전달 받은 xml데이터 처리
				$(data).find("member").each(function(){
					tbody += "<tr>";
					//현재 데이터에서 idx를 찾아라
					tbody += "<td>" + $(this).find("idx").text() + "</td>";
					tbody += "<td>" + $(this).find("name").text() + "</td>";
					tbody += "<td>" + $(this).find("age").text() + "</td>";
					tbody += "<td>" + $(this).find("addr").text() + "</td>";
					tbody += "<td>" + $(this).find("regdate").text() + "</td>";
					tbody += "</tr>";
				});
				alert("tbody : " + tbody);
				//tbody태그에 문자열(태그) 추가 
				$("tbody").html(tbody);
			},	
			error : function(jqXHR, textStatus, errorThrown){
				alert("Ajax 처리 실패 : \n"
					+ "jqXHR.readyState : " + jqXHR.readyState +"\n"
					+ "textStatus : " + textStatus +"\n"
					+ "errorThrown : " + errorThrown);
			}
			
			
		
		})
	}

</script>
</head>
<body>
	<h1>Ajax XML 데이터 요청 처리</h1>
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