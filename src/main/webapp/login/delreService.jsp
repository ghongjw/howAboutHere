<%@page import="teamproject.UnloginReservationDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String remobile = request.getParameter("mobile");
	String checkmobile = request.getParameter("mobilePhone");
	UnloginReservationDAO unloginReservationDao = new UnloginReservationDAO();
	if(remobile.equals(checkmobile)){
		unloginReservationDao.deleteRe(remobile);
		%><script>alert('예약이 취소되었습니다');location.href="../index/main.jsp"</script><%
	}else{
		%><script>alert('예약하신 연락처와 맞지않습니다.다시 확인해주세요.');location.href="reserveForm.jsp?mobile=<%=remobile%>"</script><%
	}
%>