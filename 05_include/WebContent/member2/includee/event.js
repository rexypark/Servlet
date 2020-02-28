	function sel_all(frm) {
		frm.action = "selectAll.jsp"; //전체검색
		frm.submit(); 
	}
	
	function sel_one(frm) {
		frm.action = "selectOneID.jsp"; //ID값으로 검색
		frm.submit();
	}
	
	function add_go(frm) {//데이터 입력
		if (frm.id.value.trim() == "") {
			alert("아이디(ID)는 필수 입력항목입니다.\n입력하세요");
			frm.id.value = "";
			frm.id.focus();
			return false
		}
		frm.action = "insertMember.jsp";
		frm.submit();
	}
	
	function del_go(frm) {
		if (frm.id.value.trim() == "") {
			alert("삭제할 아이디(ID) 입력하세요");
			frm.id.value = "";
			frm.id.focus();
			return false
		}
		frm.action = "deleteMember.jsp";
		frm.submit();
	}