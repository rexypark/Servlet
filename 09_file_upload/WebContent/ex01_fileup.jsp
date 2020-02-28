<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일업로드</title>
</head>
<body>
<!-- 
	파일업로드 : cos.jar(http://www.servlets.com/cos)	
	0. 사용 할 라이브러리 파일 cos.jar 등록
	   (WebContent > WEB-INF > lib 폴더에 등록)
	1. form태그 : enctype="multipart/form-data"설정
	2. form태그 : method="post"설정 (post만 가능)
	3. input태그 : <input type="file" ..>
	   (input 태그의 type 속성 값으로 "file" 지정)
-->
	<form method="post" enctype="multipart/form-data" action="ex01_result.jsp">
		<p>올린사람 : <input type="text" name="name"></p>
		<p>파일제목 : <input type="text" name="title"></p>
		<p>파일 : <input type="file" name="f_name"></p>
		<input type="submit" value="파일업로드">	
	</form>
</body>
</html>