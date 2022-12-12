<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel = "stylesheet" href = "findPwService.css">
	
	<script src = "findPwService.js?ver=2"></script>
	
<%
	int id;
	try {
		id = Integer.parseInt(request.getParameter("id"));		
	} catch (Exception e) {
		id = 0;
	}
	
	if (id != 1) {%>
	<script>
		window.onload = function() {
			getAuth();
		}
	</script>
<%} %>
</head>
<body>
	<div>
		<div class = "whiteSpace"><!-- white Space Area --></div>
		
		<div class = "logoArea">
			<img src = "/project/Img/logoImg.png" class = "logo">
		</div>
		
		<div>
			<div class = "findPwArea">
				<form method = "GET">
					<div>
						<span class = "findPwText_1">비밀번호 찾기</span>
					</div>
					
					<div>
						<span class = "findPwText_2">*등록하신 이메일 주소를 입력하세요.</span>
					</div>
					
					<div>
						<% if (id == 1) {%>
							<label class = "emailText">이메일</label> <br>
							<input type = "email" id = "email" class = "emailInputArea" placeholder = "이메일 주소를 입력하세요.">
						<% } else { %>
							<label class = "authText">인증번호</label> <br>
							<input type = "text" id = "authNum" class = "authNumberInputArea" placeholder = "인증번호를 입력하세요.">
						<%} %>
					</div>
					
					<div>
						<%if (id == 1) {%>
							<button type = "button" class = "sendEmailBtn" onclick = "verifyEmail();">이메일 전송</button>
						<%} else {%>
							<button type = "button" class = "sendAuthBtn" onclick = "verifyAuth();">인증확인</button>
						<%} %>
					</div>
				</form>
						<label id = "authBuff" style = "display : none;"></label>
			</div>
		</div>
		
		<div>
			<!-- textArea -->
		</div>
	</div>
</body>
</html>