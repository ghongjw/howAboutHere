<%@page import="teamproject.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String email = request.getParameter("email");
	String mopoint = request.getParameter("mopoint");
	String mobile = request.getParameter("momobile");
	String nick = request.getParameter("monick");
	int point = Integer.parseInt(mopoint);
	
	MemberDAO memberDao = new MemberDAO();
	memberDao.modify(email, point, nick, mobile);
	memberDao.disconnection();
	
	%><script>alert('수정완료');location.href="boardForm.jsp";</script><%
	
	
%>