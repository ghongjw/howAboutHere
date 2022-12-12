<%@page import="teamproject.MemberDTO"%>
<%@page import="teamproject.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="register.css">
<script type="text/javascript" src="register_agreement.js"></script>
</head>
<body>
<%	
	request.setCharacterEncoding("UTF-8");
	String agreement4 = (String)session.getAttribute("agreement4");
	String agreement5 = (String)session.getAttribute("agreement5");
	String agreement6 = (String)session.getAttribute("agreement6");
	String phoneNumber = (String)session.getAttribute("phoneNumber");
	
	String email=request.getParameter("email");
	String password=request.getParameter("password");
	String conpassword=request.getParameter("conpassword");
	String nickname=request.getParameter("nickname");
	//이메일 비밀번호 닉네임 전화번호 개인정보수집동의 마케팅알람동의 위치기반서비스동의
	//infoagree,marketingagree,positionagree
	if(email.isEmpty()){
		%><script>alert('이메일을 입력해 주세요.');location.href="register_form.jsp";</script><%
	return;}
	if(password.isEmpty()){
		%><script>alert('비밀번호를 입력해 주세요.');location.href="register_form.jsp";</script><%
	return;}
	if(nickname.isEmpty()){
		%><script>alert('닉네임을 입력해 주세요.');location.href="register_form.jsp";</script><%
	return;}
	if(!password.equals(conpassword)){
		%><script>alert('비밀번호를 다시 확인해 주세요.');location.href="register_form.jsp";</script><%
	return;}
	MemberDAO memberDao = new MemberDAO();
	MemberDTO member = new MemberDTO();
	member.setEmail(email);
	member.setPw(password);
	member.setNick(nickname);
	member.setMobile(phoneNumber);
	member.setInfoagree(agreement4);
	member.setMarketingagree(agreement5);
	member.setPositionagree(agreement6);
	member.setUsername("");
	member.setPoint(0);
	
	if(memberDao.selectEmail(email) == null && memberDao.selectNick(nickname) == null){
	memberDao.Insert(member);
	%><script>alert('회원가입 성공.');location.href="../login/login.jsp";</script><%
	}else{%>
		<script>alert('이미 등록된 이메일 또는 닉네임 입니다.');location.href="register_form.jsp";</script>
	<%return;}
	memberDao.disconnection();
	
%>
</body>
</html>