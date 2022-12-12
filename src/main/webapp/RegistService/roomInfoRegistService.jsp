<%@page import="DAO.RoomInfoDAO"%>
<%@page import="DTO.RoomInfoDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if (session.getAttribute("hostEmail") == null) {%>
		<script>
			location.href = "/project/NiceChoice/niceChoice_Main.jsp";
		</script>
	<%	return;
	}%>
	
<%
	request.setCharacterEncoding("UTF-8");
	String roomName = request.getParameter("roomName");
	String roomType = request.getParameter("roomType");
	String roomCount = request.getParameter("roomCount");
	String capacity = request.getParameter("capacity");
	String roomIntro = request.getParameter("roomIntro");
	String convenienceFacility = request.getParameter("convenienceFacility");
	String lentPrice = request.getParameter("lentPrice");
	String onenightPrice = request.getParameter("onenightPrice");
	
	if (roomName == null || roomName.equals("") || roomType == null || roomType.equals("") || 
			roomCount == null || roomCount.equals("") || capacity == null || capacity.equals("") || 
			roomIntro == null || roomIntro.equals("") || convenienceFacility == null || convenienceFacility.equals("") || 
			lentPrice == null || lentPrice.equals("") || onenightPrice == null || onenightPrice.equals("")) {%>
		<script>
			alert("비정상적인 접근입니다.");
			location.href = "/project/NiceChoice/niceChoice_Main.jsp";
		</script>
	<%	return;
	}%>
	
<%
	RoomInfoDAO roomDao = new RoomInfoDAO();
	RoomInfoDTO room = new RoomInfoDTO();
	
	room.setRoomName(roomName);
	room.setRoomType(roomType);
	room.setRoomCount(roomCount);
	room.setCapacity(capacity);
	room.setRoomIntro(roomIntro);
	room.setConvenienceFacility(convenienceFacility);
	room.setLentPrice(lentPrice);
	room.setOnenightPrice(onenightPrice);
	
	roomDao.registRoomInfo(room, (String)session.getAttribute("hostEmail"));
%>
<script>
	alert("등록이 완료되었습니다.");
	location.href = "/project/NiceChoice/niceChoice_Main.jsp";
</script>