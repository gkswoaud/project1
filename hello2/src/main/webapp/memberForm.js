function insertCheck() {
	if ( document.memberForm.id.value==null ) {
		alert("id를 입력해 주세요.");
		document.memberForm.id.focus();
		return;
	}
	if ( document.memberForm.passwd.value=="" ) {
		alert("암호를 입력해 주세요.");
		document.memberForm.passwd.focus();
		return;
	}
	if ( document.memberForm.name.value=="" ) {
		alert("이름을 입력해 주세요.");
		document.memberForm.name.focus();
		return;
	}
	if ( document.memberForm.jnum.value=="" ) {
		alert("주민번호를 입력해 주세요.");
		document.boardForm.jnum.focus();
		return;
	}
	if ( document.memberForm.cnum.value=="" ) {
		alert("전화번호를 입력해 주세요.");
		document.boardForm.cnum.focus();
		return;
	}
	if ( document.memberForm.anum.value=="" ) {
		alert("주소를 입력해주세요..");
		document.memberForm.focus();
		return;
	}
	
	document.memberForm.submit();
}

