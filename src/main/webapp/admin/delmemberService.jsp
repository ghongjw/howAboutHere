<%@page import="teamproject.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String email = request.getParameter("email");
	MemberDAO memberDao = new MemberDAO();
	memberDao.delete(email);
	memberDao.disconnection();
%>
	<script>alert('회원 탈퇴 완료');location.href="boardForm.jsp"</script>