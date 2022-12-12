<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="login1.css">
</head>
<body>
<div id="wrap">
	<h2>비밀번호 재설정</h2>
	<p>회원가입 시 등록한 이메일 주소를 입력해 주세요.</p>
	<form action="passwdResetStartService.jsp" method="post">
		<input id="id_input" type="text" placeholder="이메일 주소" name="email">
		<input type="submit" id="set_email" value="확인" style="background: rgb(255, 0, 85);cursor:pointer;">
	</form>
</div>
</body>
</html>