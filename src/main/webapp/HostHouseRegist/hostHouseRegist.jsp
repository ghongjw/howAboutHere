<%@page import="DAO.RegistDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
	<link rel = "stylesheet" href = "hostHouseRegist.css">
	<script src = "hostHouseRegist.js"></script>
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
	<div id = "wrap">
		<div class = "header"> <!-- White Space Area --> </div>
		
		
		<div class = "logoArea"></div>
		
		<div class = "centerArea">
			<div class = "registArea">
				<h1 class = "registText">호스트 하우스 회원가입</h1>
				<form id = "registForm" method = "POST">
					<span class = "emailText">이메일</span> 
					<br>
					<input type = "text" class = "inputEmail" name = "email" id = "email" placeholder = "이메일" title = "이메일 주소를 입력하세요"> 
					<br>
					
					<span class = "passwordText">비밀번호</span> <br>
					<input type = "password" class = "inputPw" name = "pw" id = "pw" placeholder = "영문, 숫자, 특수문자 혼합 8자 이상" title = "비밀번호" autocomplete = "off">
					<br>
					
					<span class = "confirmPwText">비밀번호 확인</span>
					<input type = "password" class = "inputConfirmPw" id = "confirmPw" placeholder = "비밀번호를 한번 더 입력하세요." autocomplete = "off">
					<br>
					
					<input type = "checkbox" id = "allAgreeBox" class = "allAgreeBox" value = "allAgree" onclick = "allCheck();"><label class = "allAgreeText">전체 동의</label> <br>
					
					<input type = "checkbox" id = "clauseBox1" class = "allAgreeBox" value = "clause_1">
					<label class = "clauseText">게스트하우스 업주 <strong>CMS 이용 약관</strong>에 동의합니다.(필수)</label> <br>
					
					<input type = "checkbox" id = "clauseBox2" class = "allAgreeBox" value = "clause_2">
					<label class = "clauseText">게스트하우스 업주 <strong>개인정보 수집</strong>에 동의합니다.(필수)</label> <br>
					
					<input type = "checkbox" id = "clauseBox3" class = "allAgreeBox" value = "clause_3">
					<label class = "clauseText">호스트 <strong>보장사항</strong>에 대한 내용에 동의합니다.(필수)</label> <br>
					
					<div>
						<button class = "registReqBtn" type = "button" onclick = "verify();">회원가입</button>
					</div>
				</form>
				 
			</div>
				<p>Copyright 2조 COMPANY Corp. All rights Reserved</p>
				
			<div class = "dimmed" id = "dimmed"></div>
			<div class = "auth" id = "auth">
				
				<div class = "authArea">
					<form action = "" method = "POST">
						<div class = "authText">휴대폰 본인 확인</div>
						<div class = "cancel" onclick = "location.href = '/project/HostHouseAuth/hosthouseauth.jsp'">x</div>
						<hr>
						
						<div class = "phoneNumberText">휴대폰 번호</div>
						
						<div>
							<input type = "text" name = "phone" id = "phone" placeholder = "휴대폰 번호를 입력해주세요." maxlength = "15" class = "phoneNumberInputArea" autocomplete = "off">
							<button type = "button" class = "authSendBtn" onclick = "verify_phone();">인증번호 전송</button>
						</div>
						<label id = "authNum" style = "color : red; display : none;"></label>
						
						<div class = "authNumberText">인증번호</div>
						
						<div>
							<input type = "text" name = "authNumberInputArea" id = "authNumberInputArea" placeholder = "4자리 숫자를 입력해주세요." maxlength = "4" class = "authNumberInputArea" autocomplete = "off">
							<button type = "button" class = "okBtn" onclick = "verifyAuthNumber();">확인</button>
						</div>
					</form>
				</div>
			</div>
			
		</div>
	</div>
</body>
</html>