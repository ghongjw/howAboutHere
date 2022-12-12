<%@page import="DAO.LoginDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String hostEmail = request.getParameter("email"), pw = request.getParameter("pw");
	LoginDAO logDao = new LoginDAO();
	
	if (logDao.verifyAccount(hostEmail, pw)) {
		try {
			if (request.getParameter("rememberId").equals("y")){
				session.setAttribute("rememberId", hostEmail);
			}	
		} catch (Exception e) {			
			session.removeAttribute("rememberId");
		}
		
		session.setAttribute("hostEmail", hostEmail);
		session.setAttribute("pw", pw);
		session.setMaxInactiveInterval(-1);
		%>
		<script>
			location.href = "/project/NiceChoice/niceChoice_Main.jsp";
		</script>
	<%	return;
	} %>
<script>
	alert("이메일 혹은 비밀번호가 틀렸습니다.");
	location.href = "/project/HostHouseAuth/hosthouseauth.jsp";
</script>
