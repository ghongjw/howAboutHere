<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.removeAttribute("hostEmail");
	session.removeAttribute("pw");
%>
<script>
	location.href = "/project/HostHouseAuth/hosthouseauth.jsp";
</script>