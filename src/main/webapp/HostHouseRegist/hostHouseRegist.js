function setDisplay() {
	var dimmed = document.getElementById("dimmed");
	var auth = document.getElementById("auth");
	
	dimmed.style.display = "none";
	auth.style.display = "none"; 
}

function getAuthNum() {
	var authNum = document.getElementById("authNum");
	var auth = Math.floor(Math.random() * 8999) + 1000;
	authNum.innerText = auth; 
	
	alert("인증번호 : " + auth);
	
	return auth;
}

function verifyAuthNumber() {
	var authNum = document.getElementById("authNum").textContent;
	var authArea = document.getElementById("authNumberInputArea").value;
	
	if (authArea == "" || authArea != authNum) {
		alert("인증번호 확인 후 입력해주세요.");
		return;
	}
	
	alert("인증되었습니다.");
	setDisplay();
}

function verify_phone() {
	const VERIFY_PHONENUMBER = /^01[?:(0|1|6|7|8|9)+]-*(?:\d{3,4})-*(?:\d{4})$/;
	var phoneNumber = document.getElementById("phone").value;
	
	if (phoneNumber == "") {
		alert("전화번호를 입력하세요.");
		return;
	} else if (!VERIFY_PHONENUMBER.test(phoneNumber)) {
		alert("없는 전화번호 입니다.");
		return;
	} 
	
	getAuthNum();
}

function allCheck() {
	var clauseBox1 = document.getElementById("clauseBox1"), clauseBox2= document.getElementById("clauseBox2"), clauseBox3 = document.getElementById("clauseBox3");
	var allAgreeBox = document.getElementById("allAgreeBox");
	
	if (allAgreeBox.checked) {
		clauseBox1.checked = true;
		clauseBox2.checked = true;
		clauseBox3.checked = true;
		return;
	}
	
		clauseBox1.checked = false;
		clauseBox2.checked = false;
		clauseBox3.checked = false;
}

function verify() {
	const VERIFY_EMAIL = /^[0-9a-zA-Z]([-_]?[0-9a-zA-Z])+@[0-9a-zA-Z]([-_]?[0-9a-zA-Z])+\.[a-zA-Z]{3}$/i;
	const VERIFY_PW = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/
	
	var email = document.getElementById("email").value, pw = document.getElementById("pw").value, confirmPw = document.getElementById("confirmPw").value;
	var registForm = document.getElementById("registForm");
	var clauseBox1 = document.getElementById("clauseBox1"), clauseBox2 = document.getElementById("clauseBox2"), clauseBox3 = document.getElementById("clauseBox3");
	
	
	if (pw != confirmPw) {
		alert("입력하신 두 비밀번호가 다릅니다.");
		return;
	} else if (email == "") {
		alert("등록하실 이메일을 입력하세요.");
		return;
	} else if (pw == "") {
		alert("등록하실 비밀번호를 입력하세요.");
		return;
	} else if (!clauseBox1.checked || !clauseBox2.checked || !clauseBox3.checked) {
		console.log(clauseBox1.checked + "\n" + clauseBox2.checked + "\n" + clauseBox3.checked);
		alert("이용 약관 동의는 필수입니다.");
		return;
	}
	
	if (!VERIFY_EMAIL.test(email)) {
		alert("잘못된 이메일 형식입니다. 다시 입력하세요.");
		return;
	} else if (!VERIFY_PW.test(pw)) {
		alert("잘못된 비밀번호 형식입니다. 다시 입력하세요.(8 ~ 16자 영문자, 숫자, 특수기호 포함)");
		return;
	}
	
	
	registForm.action = "/project/RegistService/registService.jsp";
	registForm.submit();
}
