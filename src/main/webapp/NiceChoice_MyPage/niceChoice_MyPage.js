function verify(nowPw) {
	if (document.getElementById("pw").value != nowPw) {
		alert("비밀번호가 틀렸습니다.");
		return;
	}
	
	location.href = "/project/NiceChoice_MyInfo/niceChoice_MyInfo.jsp";
}