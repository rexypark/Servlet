<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main page</title>
<style>
	table { border-collapse: collapse; width: 800px; }
	
	th, td { border 1px solid black; }
	
	p#center { width: 80%; margin: auto; }
	
	h1, h2 { text-align: center; }
	
	
</style>
</head>
<body>

	<table border>
		<tr>
			<th><a href="main.jsp"><img src="../imgs/bitcamp_logo.png"></a></th>
			<th width="100px"><a href="stuList.jsp">조회</a></th>
			<th width="100px"><a href="stuForm.jsp">학생등록</a></th>
			<th width="100px"><a href="stuAdd.jsp">성적입력</a></th>
			<th width="100px"><a href="stuDelForm.jsp">데이터 삭제</a></th>
		</tr>
		<tr>
			<td colspan="5" height="400px">
				<p id="center">
					<img src="../imgs/bitcamp_2017_main.png">
				</p>
			</td>
		</tr>
	</table>
	
</body>
</html>