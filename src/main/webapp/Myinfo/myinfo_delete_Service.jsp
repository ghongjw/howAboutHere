<%@page import="teamproject.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String email = (String)session.getAttribute("email");
	MemberDAO memberDao = new MemberDAO();
	memberDao.delete(email);
	session.invalidate();
	memberDao.disconnection();
	response.sendRedirect("../index/main.jsp");
%>