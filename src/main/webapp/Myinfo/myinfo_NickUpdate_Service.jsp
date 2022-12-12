<%@page import="teamproject.MemberDTO"%>
<%@page import="teamproject.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String email = (String)session.getAttribute("email");
	MemberDAO memberDao = new MemberDAO();
	MemberDTO member = memberDao.selectEmail(email);
	String nick = member.getNick();
	String chnick = request.getParameter("changenick");
	if(memberDao.selectNick(chnick)==null){
	memberDao.updateNick(chnick, nick);
	%><script>alert('닉네임 수정 완료.');location.href="myinfo.jsp";</script><%
	}else{
		%><script>alert('이미 사용중인 닉네임 입니다.');location.href="myinfo.jsp";</script><%
	return;}
	memberDao.disconnection();
	
%>