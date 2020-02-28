<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	
	function sendData(){
		var firstForm = document.forms[0];
		console.log("firstForm : " + firstForm);
		console.log("firstForm.elements.length : " + firstForm.elements.length);
		for (var i=0; i < firstForm.elements.length; i++) {
			if(firstForm.elements[i].value.trim() == "") {
				if( i== 3) continue; //파일속성 제외
				alert(firstForm.elements[i].title + "입력하세요");
				firstForm.elements[i].focus();
				return;
			}
		}
		firstForm.submit();
	}
	
	function list_go(){
		location.href="list.jsp";
		
	}
</script>
</head>
<body>
	<div id="bbs">
	<form action="write_ok.jsp" method="post" enctype="multipart/form-data">
		<table>
			<caption>게시판 글쓰기</caption>
			<tbody>
				<tr>
					<th>제목</th>
					<th>
						<input type="text" name="subject" size="45" title="제목">
					</th>
				</tr>
				<tr>
					<th>이름</th>
					<th>
						<input type="text" name="writer" size="15" title="제목">
					</th>
				</tr>
				<tr>
					<th>내용</th>
					<th>
						<textarea name="content" rows="8" size="45" title="내용">
						</textarea>
					</th>
				</tr>
				<tr>
					<td>첨부파일</td>
					<td>
						<input type="file" name="file_name">
					</td>
				</tr>
				<tr>
					<td>패스워드</td>
					<td>
						<input type="password" name="pwd" size="12">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="button" value="저장" onclick="sendData()">
						<input type="reset" value="다시작성">
						<input type="button" value="목록" onclick="list_go()">
					</td>
				</tr>
			</tbody>
			<tfoot>
			</tfoot>
			
		</table>
	
	</form>
	</div>
</body>
</html>