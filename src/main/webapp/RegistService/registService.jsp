<%@page import="DTO.HostMemberDTO"%>
<%@page import="DAO.RegistDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	RegistDAO regDao = new RegistDAO();
	HostMemberDTO host = new HostMemberDTO();
	
	String hostEmail = request.getParameter("email"), pw = request.getParameter("pw");
	
	host.setEmail(hostEmail);
	host.setPw(pw);
	
	if (regDao.regist(host)) {
		out.print("<script>alert('회원가입을 축하합니다. 로그인 후 이용해주세요.'); location.href = '/project/HostHouseAuth/hosthouseauth.jsp'</script>");
		return;
	}%>
<script>
	alert("이미 사용중인 아이디입니다. 다른 아이디를 사용해주세요.");
	location.href = "/project/HostHouseRegist/hostHouseRegist.jsp";
</script>