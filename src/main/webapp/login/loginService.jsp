<%@page import="teamproject.MemberDTO"%>
<%@page import="teamproject.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	
	MemberDAO memberDao = new MemberDAO();
	MemberDTO member = memberDao.selectEmail(email);
	if(email.equals("admin") && password.equals("1234")){
		response.sendRedirect("../admin/adminForm.jsp");
	}
	if(member != null && member.getPw().equals(password)){
		session.setAttribute("email", email);
		response.sendRedirect("../index/main.jsp");
	}else{
		%><script>alert('이메일을 또는 비밀번호를 다시 입력해주세요');location.href="login.jsp";</script><%
	return;}
	memberDao.disconnection();
%>