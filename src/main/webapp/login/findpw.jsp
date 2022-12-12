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
	<h2>비밀번호 찾기</h2>
	<form action="findpwService.jsp" method="post">
		<input id="id_input" type="text" placeholder="이메일" name="email" style="margin-bottom: 5px;">
		<input id="id_input" type="text" placeholder="전화번호('-'제외)" name="mobile" style="margin-bottom: 5px;">
		<input type="submit" id="set_email" value="확인" style="background: rgb(255, 0, 85);cursor:pointer;">
	</form>
	
</div>
</body>
</html>