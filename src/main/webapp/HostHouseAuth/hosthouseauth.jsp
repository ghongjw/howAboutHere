<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>요기어때 Host House</title>
	<link rel = "stylesheet" href = "hosthouseauth.css">
	<script src = "hosthouseauth.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script>
		$(function() {
			$(".logoArea").on("click", function() {
				location.href = "/project/HostHouseAuth/hosthouseauth.jsp";
			});
		});
	</script>
</head>
<body>
<%
	String remember = (String)session.getAttribute("rememberId");
	String email = "";
	if (remember != null)
		email = remember;
%>
	<div id = "wrap">
		<div class = "header"> <!-- White Space Area --> </div>
		
		<div class = "logoArea"></div>
		
		<div class = "centerArea">
			<div class = "loginArea">
				<h1 class = "loginText">호스트 하우스 로그인</h1>
				<form id = "loginForm" method = "POST">
					<span class = "emailText">이메일</span> 
					<br>
					<input type = "text" class = "inputEmail" name = "email" id = "email" placeholder = "이메일" title = "이메일 주소를 입력하세요" value = "<%= email %>"> 
					<br>
					
					<span class = "passwordText">비밀번호</span> <br>
					<input type = "password" class = "inputPw" name = "pw" id = "pw" placeholder = "영문, 숫자, 특수문자 혼합 8자 이상" title = "비밀번호" autocomplete = "off">
					<br>
					
					<%
						if (remember != null) {%>
							<input type = "checkbox" id = "rememberId" class = "rememberId" checked>
							<label class = "rememberIdText">아이디 저장</label>
						<%} else { %>
							<input type = "checkbox" id = "rememberId" class = "rememberId">
							<label class = "rememberIdText">아이디 저장</label>
						<%} %>
					<a href = "/project/FindPwService/findPwService.jsp?id=1" class = "findPw">* 비밀번호 찾기</a>
					<br>
					
					<button type = "button" class = "loginButton" onclick = "loginReq();">로그인</button>
					<br>
					
					<button type = "button" class = "registButton" onclick = "location.href = '/project/HostHouseRegist/hostHouseRegist.jsp'">회원가입</button>
				<br><br><br>
				</form>
				 
			</div>
				<p>Copyright 2조 COMPANY Corp. All rights Reserved</p>
		</div>
	</div>
</body>
</html>