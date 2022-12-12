<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="registerForm.css">

<script type="text/javascript" src="../js/myinfo.js"></script>
<title>회원가입 | 요기어때</title>
</head>
<body>
	<div id="wrap">
		<form action="registerService.jsp" method="post">
			<header></header>
			<h3 class="title">회원가입</h3>
	
	<h4 class="sub_title">이메일 아이디</h4>
	<div id="idbox">
		<input id="id_input" type="text" placeholder="이메일 주소를 입력해주세요"
			name="email" onkeyup="mail_keyup()" onBlur="mail_blur()">
	<label id="mail_alert"> 
	</label>
	</div>
	<h4 class="sub_title">비밀번호</h4>
	<div id="pwbox">
		<input id="pw_input" type="password" placeholder="비밀번호를 입력해 주세요"
			name="password" onkeyup="pw_keyup()">
	</div>
	<label id="pw_alert"> </label>
	 <h4 class="sub_title">비밀번호 확인</h4>
	<div id="conpwbox">
		<input id="conpw_input" type="password" placeholder="비밀번호를 입력해 주세요"
			name="conpassword" onkeyup="conpw_keyup()">
	</div>
	<label id="conpw_alert"> </label>
<h4 class="sub_title">닉네임</h4>
	<div id="nick_box">
		<input id="nick_input" type="text" name="nickname"
			onkeyup="conpw_keyup()" maxlength=10>
			<input type="button" id="nickrandom" value="딴거할래요" onclick="randomnick()" style="cursor:pointer;background-color: rgb(255, 0, 85);position: absolute;color:white;">
	</div>
	<label id="conpw_alert"> </label>



	<input type="submit" id="register_button" value="가입하기" onclick="sub()" style="cursor:pointer">
	
	</form>
</div>
</body>
</html>