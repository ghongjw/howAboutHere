<%@page import="teamproject.MemberDTO"%>
<%@page import="teamproject.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String uname = request.getParameter("uname");
	String email = (String)session.getAttribute("email");
	MemberDAO memberDao = new MemberDAO();
	memberDao.updateName(uname, email);
	%><script>alert('이름 수정 완료.');location.href="myinfo.jsp";</script><%
	memberDao.disconnection();
%>
