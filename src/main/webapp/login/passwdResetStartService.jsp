<%@page import="teamproject.MemberDTO"%>
<%@page import="teamproject.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String email = request.getParameter("email");
	MemberDAO memberDao = new MemberDAO();
	MemberDTO member = memberDao.selectEmail(email);
	if(member == null){
		%><script>alert('가입된 이메일이 아닙니다.');location.href="passwdResetStart.jsp";</script><%
	}else{
		response.sendRedirect("passwdReset.jsp?email="+member.getEmail());
	}memberDao.disconnection();
%>