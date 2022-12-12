function verify() {
	const VERIFY_ROOMCOUNT = /^[0-9]{1,}$/;
	const VERIFY_CAPACITY = /^[0-9]{1,}$/;
	const VERIFY_CHARGE = /^[0-9]{5,}$/;
	var roomName = document.getElementById("roomName").value;
	var roomType = document.getElementById("roomType").value;
	var roomCount = document.getElementById("roomCount").value;
	var capacity = document.getElementById("capacity").value;
	var roomIntro = document.getElementById("roomIntro").value;
	var convenienceFacility = document.getElementById("convenienceFacility").value;
	var lentPrice = document.getElementById("lentPrice").value;
	var onenightPrice = document.getElementById("onenightPrice").value;
	
	if (roomName == "") {
		alert("객실명을 입력하세요.");
		return;
	} else if (roomType == "") {
		alert("객실 유형을 입력하세요.");
		return;
	} else if (roomCount == "") {
		alert("객실 개수를 입력하세요.");
		return;
	} else if (!VERIFY_ROOMCOUNT.test(roomCount)) {
		alert("(객실 개수)잘못된 입력입니다. 다시 입력하세요.");
		return;
	} else if (capacity == "") {
		alert("인원을 입력하세요.");
		return;
	} else if (!VERIFY_CAPACITY.test(capacity)) {
		alert("(인원)잘못된 입력입니다. 다시 입력하세요.");
		return;
	} else if (roomIntro == "") {
		alert("객실 소개글을 입력하세요.");
		return;
	} else if (convenienceFacility == "") {
		alert("편의시설을 입력하세요.");
		return;
	} else if (lentPrice == "") {
		alert("(대실 가격)요금을 입력하세요.");
		return;
	} else if (onenightPrice == "") {
		alert("(숙박 가격) 요금을 입력하세요.");
		return;
	} else if (!VERIFY_CHARGE.test(lentPrice)) {
		alert("(대실 가격)잘못된 입력입니다. 다시 입력하세요.");
		return;
	} else if (!VERIFY_CHARGE.test(onenightPrice)) {
		alert("(숙박 가격)잘못된 입력입니다. 다시 입력하세요.");
		return;
	}
	
	document.getElementById("roomInfoRegForm").action = "/project/RegistService/roomInfoRegistService.jsp";
	document.getElementById("roomInfoRegForm").submit();
}