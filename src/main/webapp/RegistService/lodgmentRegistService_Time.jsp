<%@page import="DAO.LodgmentRegistDAO"%>
<%@page import="DTO.LodgmentDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if (session.getAttribute("hostEmail") == null) {%>
		<script>
			location.href = "/project/NiceChoice/niceChoice_Main.jsp";
		</script>
	<%	return;
	} %>

<%
	request.setCharacterEncoding("UTF-8");
	String inTime = request.getParameter("inTime");
	String outTime = request.getParameter("outTime");
	String deadlineTime = request.getParameter("deadlineTime");
	
	System.out.print("intime : " + inTime + "\nouttime : " + outTime + "\ndeadline : " + deadlineTime);
	
	LodgmentRegistDAO lodgmentDao = new LodgmentRegistDAO();
	LodgmentDTO lodgment = new LodgmentDTO();
	
	lodgment.setInTime(inTime);
	lodgment.setOutTime(outTime);
	lodgment.setDeadlineTime(deadlineTime);
	
	lodgmentDao.updatelodgmentTime(lodgment, (String)session.getAttribute("hostEmail"));
%>
<script>
	location.href = "/project/NiceChoice_RoomManage/niceChoice_RoomManage.jsp";
</script>