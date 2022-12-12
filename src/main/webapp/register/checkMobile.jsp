<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="register.css">
<script type="text/javascript" src="checkMobile.js"></script>
</head>
<body>

<form action="checkMobileService.jsp" method="post">
<h2>휴대폰 본인 확인</h2>
<div id="wrap">
원활한 서비스 제공을 위해, 휴대폰 번호를 입력해주세요.
<p>휴대폰 번호</p>
<div id="phonebox">
<input type="text" id="mobilePhone" name="mobilePhone" onkeyup="keyup()" maxlength=11 >
<input type="button" disabled id="phone_check" value="인증번호 전송" onclick="sendNum()">
</div>
<div id="confirmphonebox" >
<input type="text" id="confirmNumber" name="confirmNumber" onkeyup="conkeyup()" maxlength=4>
<input type="button" id="confirmNumberButton" disabled value="인증" onclick="connum1()">
</div>

<input type="submit" id="mobilebutton" value="회원가입" disabled  >

</div>
</form>
</body>
</html> 