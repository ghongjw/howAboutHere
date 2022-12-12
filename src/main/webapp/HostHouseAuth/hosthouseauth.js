function verify_blank() {
	var email = document.getElementById("email").value, pw = document.getElementById("pw").value;
	
	if (email == "" && pw == "") {
		alert("등록하신 이메일을 입력하세요.");
		return;
	} else if (pw == "") {
		alert("비밀번호를 입력하세요.");
		return;
	}

}

function login() {
	document.getElementById("loginForm").action = "/project/NiceChoice/nicechoice.jsp";
	document.getElementById("loginForm").submit();
}

function loginReq() {
	var id = document.getElementById("email").value, pw = document.getElementById("pw").value;
	var form = document.getElementById("loginForm");
	var rememberId = document.getElementById("rememberId");
	
	if (email == "" || pw == "") {
		alert("아이디와 비밀번호를 입력해주세요.");
		return;
	}
	
	if (rememberId.checked) {
		form.action = "/project/LoginService/loginService.jsp?rememberId=y";
		form.submit();
		return;
	}
	
	form.action = "/project/LoginService/loginService.jsp";
	form.submit();
}

function checked() {
	var rememberId = document.getElementById("rememberId");
	rememberId.checked = true;
}
