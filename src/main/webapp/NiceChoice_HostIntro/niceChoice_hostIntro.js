function verify() {
	var facilities = "";
	var introByHost = document.getElementById("introByHost").value;
	var wayToCome = document.getElementById("wayToCome").value;
	var nearbyFacility = document.getElementById("nearbyFacility").value;
	var lodgmentRule = document.getElementById("lodgmentRule").value;
	var dynamicCharge = document.getElementById("dynamicCharge").value;
	var parkingInfo = document.getElementById("parkingInfo").value;
	var checklist = document.getElementById("checklist").value;
	
	if (introByHost == "") {
		alert("사장님 한마디를 작성하세요");
		return;
	} else if (wayToCome == "") {
		alert("오시는길을 작성하세요");
		return;
	} else if (nearbyFacility == "") {
		alert("주변 정보를 입력하세요");
		return;
	} else if (lodgmentRule == "") {
		alert("숙소 이용규칙을 입력하세요")
		return;
	} else if (dynamicCharge == "") {
		alert("현장요금 추가정보를 입력하세요.");
		return;
	} else if (parkingInfo == "") {
		alert("주차장 정보를 입력하세요.");
		return;
	} else if (checklist == "") {
		alert("확인사항 및 기타 항목을 입력하세요.");
		return;
	}
	
	var cmp = 0;
	for (var cnt = 0; cnt < document.getElementsByName("facilities").length; cnt++) {
		if (document.getElementsByName("facilities")[cnt].checked) {
			facilities += document.getElementsByName("facilities").value;
			cmp++;
		}
	}
	
	if (cmp == 0) {
		alert("편의시설/서비스 안내를 최소 1개 이상 체크해주세요.");
		return;
	}
	
	document.getElementById("lodgmentRegForm").action = "/project/RegistService/lodgmentRegistService_HostIntro.jsp";
	document.getElementById("lodgmentRegForm").submit();
}
