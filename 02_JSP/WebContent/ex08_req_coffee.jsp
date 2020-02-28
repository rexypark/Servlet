<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커피주문</title>
<script>
	
	
	
	function cliked_button() {
		var vForm = document.frm;
		
		
		//커피 공백 처리
		if(vForm.coffee.value.trim() == "") {
			alert("커피 메뉴를 선택하지 않았습니다. \n다시 입력하세요.");
			vForm.coffee.focus();
			return false;
		}
		var selected_coffee = vForm.coffee.value;
		
		
		//수량 공백 처리
		if(vForm.su.value.trim() == "") {
			alert("수량을 선택하지 않았습니다. \n다시 입력하세요.");
			vForm.coffee.focus();
			return false;
		}
		var coffee_cnt = vForm.su.value;
		var coffee_tot = selected_coffee*coffee_cnt;
		
		
		//입금액 공백처리
		if(vForm.money.value.trim() == "") {
			alert("돈을 넣지 않았습니다. \n다시 넣어 주세요.");
			vForm.coffee.focus();
			return false;
		}
		var inputMoney = vForm.su.value;
		
		
		//합계금액에 대한 입금액 유효성처리
		if(coffee_tot > inputmoney) {
			alert("금액이 부족합니다. \다시 돈을 넣어주세요");
			vForm.su.value = "";
			vForm.su.value.focus();
		}
		vForm.action = "ex08_resp.jsp";
		vForm.submit();
		
		
	}
	
	
	
	
	
</script>
</head>
<body>
	<h1>커피주문</h1>
	<form action="ex08_resp.jsp" name="frm">
		<input type="radio" name="coffee" value="1"> 아메리카노 [3000원]<br>
		<input type="radio" name="coffee" value="2"> 카페모카 [3500원]<br>
		<input type="radio" name="coffee" value="3"> 에스프레소 [2500원]<br>
		<input type="radio" name="coffee" value="4"> 카페라떼 [4000원]<br>
		
		수량 : <input type="number" name="su" size="3"><br>
	        입금액 : <input type="number" name="money" size="10">
	    
	    <input type="button" value="주문처리" onclick="cliked_button()">		
	</form>
</body>
</html>