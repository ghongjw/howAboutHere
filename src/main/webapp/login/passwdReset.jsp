<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String email = request.getParameter("email");
    %>
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
	<form action="passwdResetService.jsp?email=<%=email%>" method="post">
		<input id="id_input" type="text" placeholder="변경전 비밀번호" name="oldpw" style="margin-bottom: 5px;">
		<input id="id_input" type="text" placeholder="변경할 비밀번호" name="newpw" style="margin-bottom: 5px;">
		<input id="id_input" type="text" placeholder="비밀번호 확인" name="conpw">
		<input type="submit" id="set_email" value="확인" style="background: rgb(255, 0, 85);cursor:pointer;">
	</form>
	<p>비밀번호를 잊으셧나요?</p><a href="findpw.jsp">비밀번호 찾기</a>
</div>
</body>
</html>