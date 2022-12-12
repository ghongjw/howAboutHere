<%@page import="DTO.HostMemberDTO"%>
<%@page import="DAO.FindPwDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script src = "/project/FindPwService/findPwService.js"></script>
<%
	FindPwDAO fd = new FindPwDAO();

	if (request.getParameter("email") != null) {
			HostMemberDTO host = fd.findPw(request.getParameter("email"));
		
		
			if (host != null) {
				session.setAttribute("findPw", host.getPw());%>
			<script>
				location.href = "/project/FindPwService/findPwService.jsp";
			</script>
		<%	return;
		}
		%>
			<script>
				alert("존재하지 않는 이메일입니다.");
				location.href = "/project/FindPwService/findPwService.jsp?id=1";
			</script>		
		<%	return;
		} %>
	
	
<%
	if (request.getParameter("returnPw").equals("y")) {%>
		<script>
			alert("비밀번호는 : " + "<%= session.getAttribute("findPw") %>" + "입니다.");
			location.href = "/project/HostHouseAuth/hosthouseauth.jsp"
		</script>
<%} %>
	