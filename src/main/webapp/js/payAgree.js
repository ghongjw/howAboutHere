/**
 * 
 */

function checked() {
	checkall = document.getElementById('checkAll');
	checkagree1 = document.getElementById('checkagree1');
	checkagree2 = document.getElementById('checkagree2');
	checkagree3 = document.getElementById('checkagree3');
	checkagree4 = document.getElementById('checkagree4');
	if (checkall.checked) {
		checkall.checked = false;
		checkagree1.checked = false;
		checkagree2.checked = false;
		checkagree3.checked = false;
		checkagree4.checked = false;

	} else {
		checkall.checked = true;
		checkagree1.checked = true;
		checkagree2.checked = true;
		checkagree3.checked = true;
		checkagree4.checked = true;
	}
}
var checkset = false;

var confirm = false;

function checked() {
	checkall = document.getElementById('checkAll');
	checkagree1 = document.getElementById('checkagree1');
	checkagree2 = document.getElementById('checkagree2');
	checkagree3 = document.getElementById('checkagree3');
	checkagree4 = document.getElementById('checkagree4');
	if (checkall.checked) {
		checkall.checked = false;
		checkagree1.checked = false;
		checkagree2.checked = false;
		checkagree3.checked = false;
		checkagree4.checked = false;

	} else {
		checkall.checked = true;
		checkagree1.checked = true;
		checkagree2.checked = true;
		checkagree3.checked = true;
		checkagree4.checked = true;
	}
	if (checkagree1.checked && checkagree2.checked && checkagree3.checked && checkagree4.checked) {
		checkset = true;
	} else checkset = false;
}
function checked1() {
	checkall = document.getElementById('checkAll');
	checkagree1 = document.getElementById('checkagree1');
	checkagree2 = document.getElementById('checkagree2');
	checkagree3 = document.getElementById('checkagree3');
	checkagree4 = document.getElementById('checkagree4');

	if (checkagree1.checked) {
		checkagree1.checked = false;
		checkall.checked = false;
	} else {
		checkagree1.checked = true;
		if (checkagree2.checked && checkagree3.checked && checkagree4.checked) {
			checkall.checked = true;
		} else {
			console.log("eho");
			checkall.checked = false;
		}
	}
	if (checkagree1.checked && checkagree2.checked && checkagree3.checked && checkagree4.checked) {
		checkset = true;
	} else checkset = false;


}
function checked2() {
	checkall = document.getElementById('checkAll');
	checkagree1 = document.getElementById('checkagree1');
	checkagree2 = document.getElementById('checkagree2');
	checkagree3 = document.getElementById('checkagree3');
	checkagree4 = document.getElementById('checkagree4');
	if (checkagree2.checked) {
		checkagree2.checked = false;
		checkall.checked = false;
	} else {
		checkagree2.checked = true;
		if (checkagree1.checked && checkagree3.checked && checkagree4.checked) {
			checkall.checked = true;
		} else {
			checkall.checked = false;
		}
	}
	if (checkagree1.checked && checkagree2.checked && checkagree3.checked && checkagree4.checked) {
		checkset = true;
	} else checkset = false;

}
function checked3() {
	checkall = document.getElementById('checkAll');
	checkagree1 = document.getElementById('checkagree1');
	checkagree2 = document.getElementById('checkagree2');
	checkagree3 = document.getElementById('checkagree3');
	checkagree4 = document.getElementById('checkagree4');

	if (checkagree3.checked) {
		checkagree3.checked = false;
		checkall.checked = false;
	} else {
		checkagree3.checked = true;
		if (checkagree1.checked && checkagree2.checked && checkagree4.checked) {
			checkall.checked = true;
		} else {
			checkall.checked = false;
		}
	}
	if (checkagree1.checked && checkagree2.checked && checkagree3.checked && checkagree4.checked) {
		checkset = true;
	} else checkset = false;
}

function checked4() {
	checkall = document.getElementById('checkAll');
	checkagree1 = document.getElementById('checkagree1');
	checkagree2 = document.getElementById('checkagree2');
	checkagree3 = document.getElementById('checkagree3');
	checkagree4 = document.getElementById('checkagree4');
	if (checkagree4.checked) {
		checkagree4.checked = false;
		checkall.checked = false;
	} else {
		checkagree4.checked = true;
		if (checkagree1.checked && checkagree2.checked && checkagree4.checked) {
			checkall.checked = true;
		} else {
			checkall.checked = false;
		}
	}
	if (checkagree1.checked && checkagree2.checked && checkagree3.checked && checkagree4.checked) {
		checkset = true;
	} else checkset = false;

}
function keyup() {
	mobileNumber = document.getElementById('mobilePhone');
	phone_check = document.getElementById('phone_check');
	mobileNumber.value = mobileNumber.value.replace(/[^0-9]/g, '');
	var regExp = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/
	if (regExp.test(mobileNumber.value) && mobileNumber.value.length == 11) {
		phone_check.disabled = false;
	} else phone_check.disabled = true;
	confirm = false;

}

function sendNum() {
	phone_check = document.getElementById('phone_check');
	confirmNumber = document.getElementById('confirmNumber');
	confirmNumberButton = document.getElementById('confirmNumberButton');
	confirmphonebox = document.getElementById('confirmphonebox');
	if (confirm == false) {
		confirm = true;
		phone_check.value = "재전송";
		confirmphonebox.style.display = "block";

	}
}
connum_check = false;

function conkeyup() {
	connum = false;
	confirmNumber = document.getElementById('confirmNumber');
	confirmNumberButton = document.getElementById('confirmNumberButton');
	confirmNumber.value = confirmNumber.value.replace(/[^0-9]/g, '');
	var regExp = /^[0-9]{4}$/
	if (regExp.test(confirmNumber.value) && confirmNumber.value.length == 4) {
		confirmNumberButton.disabled = false;

	} else confirmNumberButton.disabled = true;
}
function connum1() {
	confirmNumber = document.getElementById('confirmNumber');
	confirmNumberButton = document.getElementById('confirmNumberButton');
	mobilebutton = document.getElementById('mobilebutton');

	if (confirmNumber.value == "1234") {
		connum_check = true;

	} else {
		alert("인증번호가 틀렸습니다");
	}
	if (confirm == true && connum_check == true) {
		alert("인증되었습니다");
		return;
	}
}
function nameCheck() {
	nameInput = document.getElementById('nameInput');
	var reg = /^[가-힣a-zA-Z]+$/;
	if (!reg.test(nameInput.value)) {
		alert("이름을다시 입력해주세요");
		nameInput.value = "";
	}
}

function sub() {
	nameInput = document.getElementById('nameInput');
	form = document.getElementById('form');
	mobilePhone = document.getElementById('mobilePhone');
	checkagree1 = document.getElementById('checkagree1');
	checkagree2 = document.getElementById('checkagree2');
	checkagree3 = document.getElementById('checkagree3');
	checkagree4 = document.getElementById('checkagree4');
	confirmPay = document.getElementById('confirmPay');

	if (nameInput.value == "") {
		alert("이름을 입력해주세요");
		return;
	}
	if (mobilePhone.value == "") {
		alert("전화번호를 입력해주세요");
		return;
	}
	if (mobilePhone.value == "") {
		alert("전화번호를 입력해주세요");
		return;
	}
	if (confirm != true || connum_check != true) {
		alert("휴대폰 인증을 해주세요!");
	}
	if (checkagree1.checked == false || checkagree2.checked == false
		|| checkagree3.checked == false || checkagree4.checked == false) {
		alert("약관동의를 해주세요");
		return;
	} if (confirm == true && connum_check == true && checkset == true) {
		form.action = "./success_Service.jsp";
		form.submit();

	}
}
function agreePop1() {
	popup = document.getElementById('popup');
	agree1 = document.getElementById('agree1');
	popup.style.display = "block";
	agree1.style.display = "block";
}
function agreePop2() {
	popup = document.getElementById('popup');
	agree2 = document.getElementById('agree2');
	popup.style.display = "block";
	agree2.style.display = "block";
}
function agreePop3() {
	popup = document.getElementById('popup');
	agree3 = document.getElementById('agree3');
	popup.style.display = "block";
	agree3.style.display = "block";
}
function agreePop4() {
	popup = document.getElementById('popup');
	agree4 = document.getElementById('agree4');
	popup.style.display = "block";
	agree4.style.display = "block";
}

function popclose() {
	popup = document.getElementById('popup');
	agree1 = document.getElementById('agree1');
	agree2 = document.getElementById('agree2');
	agree3 = document.getElementById('agree3');
	agree4 = document.getElementById('agree4');

	popup.style.display = "none";
	agree1.style.display = "none";
	agree2.style.display = "none";
	agree3.style.display = "none";
	agree4.style.display = "none";

}
function usePoint() {
	point = document.getElementById('point');
	inputpoint = document.getElementById('inputpoint');
	defalt = point.value;
	if (inputpoint.value == 0) {
		inputpoint.value = 0;
		point.val = defalt;
	} else {
		inputpoint.value = 0;
		point.val = defalt;
	}
}
function checkpointtext() {
	inputpoint = document.getElementById('inputpoint');
	inputpoint.value = inputpoint.value.replace(/[^0-9]/g, '');
}

