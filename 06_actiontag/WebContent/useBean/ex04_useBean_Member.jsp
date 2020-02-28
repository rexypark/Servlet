<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<h1>회원가입(데이터 전달)</h1>
	<form action="ex04_useBeanDisp.jsp">
		이름 : <input type="text" name="name"><br>
		나이 : <input type="number" name="age"><br>
		비밀번호 : <input type="password" name="pwd"><br>
		<p>
			<input type="radio" name="gender" value="남">남<br>
			<input type="radio" name="gender" value="여">여<br>
		</p>
		<p>
			<input type="checkbox" name="hobby" value="운동">운동
			<input type="checkbox" name="hobby" value="음악">음악
			<input type="checkbox" name="hobby" value="영화">영화
			<input type="checkbox" name="hobby" value="독서">독서
		</p>
		<p>
			<input type="submit" value="정보 입력">
		</p>
	</form>
</body>
</html>