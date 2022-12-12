function verifyEmail() {
	var VERIFY_EMAIL = /^[0-9a-zA-Z]([-_]?[0-9a-zA-Z])+@[0-9a-zA-Z]([-_]?[0-9a-zA-Z])+\.[a-zA-Z]{3}$/i
	var email = document.getElementById("email").value;
	
	if (!VERIFY_EMAIL.test(email)) {
		alert("잘못된 이메일입니다. 다시 입력하세요.");
		return;
	}
	
	location.href = "verifyEmail.jsp?email=" + document.getElementById("email").value;
}

function getAuth() {
	var authBuff = document.getElementById("authBuff");
	var auth = Math.floor(Math.random() * 8999) + 1000;

	authBuff.innerText = auth;
	alert("인증번호 : " + auth);	
}

function verifyAuth() {
	var authBuff = document.getElementById("authBuff").outerText;
	var authNum = document.getElementById("authNum").value;
	
	console.log(authBuff);
	console.log(authNum);
	
	if (authBuff != authNum) {
		alert("잘못된 인증번호 입니다. 인증번호를 다시 받으신 후 재시도 하세요.");
		location.href = "/project/FindPwService/findPwService.jsp?num=1";
		return;
	}
	location.href = "verifyEmail.jsp?returnPw=y";
}