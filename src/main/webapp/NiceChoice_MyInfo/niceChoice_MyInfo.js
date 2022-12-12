function getElement(id) {
	return document.getElementById(id);
}

function verify() {
	const VERIFY_ACCOUNTHOLDER = /^[가-힣]{2,5}$/;
	const VERIFY_LODGMENTHOSTNAME = /^[가-힣]{2,5}$/;
	
	var phoneNumber = document.getElementById("frontPhoneNumber").value +
		document.getElementById("middlePhoneNumber").value + document.getElementById("lastPhoneNumber").value;
	var mainNumber = document.getElementById("frontMainNumber").value + 
		document.getElementById("middleMainNumber").value + document.getElementById("lastMainNumber").value;
	var bank = document.getElementById("bank").value;
	var accountHolder = document.getElementById("accountHolder").value;
	var accountNumber = document.getElementById("accountNumber").value;
	var lodgmentName = document.getElementById("lodgmentName").value;
	var lodgmentHostName = document.getElementById("hostName").value;
	var lodgmentType_1 = "";
	var lodgmentType_2 = document.getElementById("lodgmentType_2").value;
	var lodgmentNumber = document.getElementById("lodgmentNumber").value;
	var lodgmentAddress = document.getElementById("lodgmentAddress").value;
	var category;
	
	if (document.getElementById("middlePhoneNumber").value == "" || document.getElementById("lastPhoneNumber").value == "") {
		alert("휴대폰 번호를 입력하세요.");
		return;
	} else if (document.getElementById("middleMainNumber").value == "" || document.getElementById("lastMainNumber").value == "") {
		alert("대표번호를 입력하세요.");
		return;
	} else if (accountHolder == "") {
		alert("예금주명을 입력하세요.");
		return; 
	} else if (!VERIFY_ACCOUNTHOLDER.test(accountHolder)) {
		alert("(예금주명)잘못된 형식입니다. 다시 입력하세요.");
		return;
	} else if (accountNumber == "") {
		alert("계좌번호를 입력하세요.");
		return;
	} else if (lodgmentName == "") {
		alert("상호명(법인명)을 입력하세요.");
		return;
	} else if (lodgmentHostName == "") {
		alert("등록증상 대표명을 입력하세요.");
		return;
	} else if (!VERIFY_LODGMENTHOSTNAME.test(lodgmentHostName)) {
		alert("(대표명)잘못된 형식입니다. 다시 입력하세요.");
		return;
	} else if (lodgmentNumber == "") {
		alert("사업자 등록번호를 입력하세요.");
		return;
	} else if (lodgmentAddress == "") {
		alert("업체 주소를 입력하세요");
		return;
	}
	
	var cmp = 0;
	for (var cnt = 0; cnt < document.getElementsByName("lodgmentType_1").length; cnt++)
		if (document.getElementsByName("lodgmentType_1")[cnt].checked)
			cmp++;

	if (cmp == 0) {
		alert("업태를 1개 이상 선택하세요.");
		return;
	}
	
	cmp = 0;
	for (var cnt = 0; cnt < document.getElementsByName("lodgmentType_2").length; cnt++) {
		if (document.getElementsByName("lodgmentType_2")[cnt].checked) {
			category = document.getElementsByName("lodgmentType_2")[cnt].value;
			cmp++;
		}
	}
	
	if (cmp == 0) {
		alert("업종을 선택하세요.");
		return;
	}
	
	document.getElementById("lodgmentRegForm").action = "/project/RegistService/lodgmentRegistService.jsp?category=" + category;
	document.getElementById("lodgmentRegForm").submit();
}