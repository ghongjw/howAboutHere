<%@page import="teamproject.MemberDTO"%>
<%@page import="teamproject.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String email = request.getParameter("email");
	String oldpw = request.getParameter("oldpw");
	String newpw = request.getParameter("newpw");
	String conpw = request.getParameter("conpw");
	MemberDAO memberDao = new MemberDAO();
	MemberDTO member = memberDao.selectEmail(email);
	if(oldpw.isEmpty() || newpw.isEmpty() || conpw.isEmpty()){
		%><script>alert('비밀번호를 정확히 입력해주세요.');location.href="passwdReset.jsp"</script><%
	}
	else if(!newpw.equals(conpw)){
		%><script>alert('비밀번호확인이 맞지않습니다.');location.href="passwdReset.jsp"</script><%
	}
	else if(!oldpw.equals(member.getPw())){
		%><script>alert('이전 비밀번호가 맞지않습니다.');location.href="passwdReset.jsp"</script><%
	}
	else{
		memberDao.updatePw(newpw, email);
		%><script>alert('비밀번호가 변경되었습니다.');location.href="../login/login.jsp"</script><%
	}
%>