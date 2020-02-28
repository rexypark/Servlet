<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="get">
		<p>이름 : <input type="text" name="name"></p>
		<p>나이 : <input type="text" name="age"></p>
		<p>성별 : 
			<input type="radio" name="gender" value="남">남
			<input type="radio" name="gender" value="여">여
		</p>
		<p>취미 : 
			<input type="checkbox" name="hobby" value="운동">운동
			<input type="checkbox" name="hobby" value="음악">음악
			<input type="checkbox" name="hobby" value="영화">영화
			<input type="checkbox" name="hobby" value="독서">독서
		</p>
		<p>
			<input type="button" value="전달1(표현식)" onclick="send_go1(this.form)">
			<input type="button" value="전달2(표현식)" onclick="send_go2(this.form)">
			<input type="button" value="전달3(표현식)" onclick="send_go3(this.form)">
		</p>
	</form>
	<script>
		function send_go1(frm) {
			frm.action = "el03_result01_expression.jsp";
			frm.submit();
		}
		function send_go2(frm) {
			frm.action = "el03_result02_bean.jsp";
			frm.submit();
		}
		function send_go3(frm) {
			frm.action = "el03_result03_param.jsp";
			frm.submit();
		}
	</script>
</body>
</html>