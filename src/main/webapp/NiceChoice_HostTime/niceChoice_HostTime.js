function verify() {
	var inTime = document.getElementById("inTime").value;
	var outTime = document.getElementById("outTime").value;
	var deadlineTime = document.getElementById("deadlineTime").value;
	
	document.getElementById("lodgmentRegForm").action = "/project/RegistService/lodgmentRegistService_Time.jsp";
	document.getElementById("lodgmentRegForm").submit();
	//location.href = "/project/NiceChoice_RoomManage/niceChoice_RoomManage.jsp";
}