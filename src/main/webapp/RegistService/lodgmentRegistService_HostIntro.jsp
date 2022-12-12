<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.io.File"%>
<%@page import="DAO.LodgmentRegistDAO"%>
<%@page import="DTO.LodgmentDTO"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
	
	String[] facilities = request.getParameterValues("facilities");
	String convenienceFacilities = "";
	String introByHost = request.getParameter("introByHost");
	String wayToCome = request.getParameter("wayToCome");
	String nearbyFacility = request.getParameter("nearbyFacility");
	String lodgmentRule = request.getParameter("lodgmentRule");
	String dynamicCharge = request.getParameter("dynamicCharge");
	String parkingInfo = request.getParameter("parkingInfo");
	String checklist = request.getParameter("checklist");
	
	LodgmentRegistDAO lodgmentDao = new LodgmentRegistDAO();
	LodgmentDTO lodgment = new LodgmentDTO();
	for (String f : facilities) {
		convenienceFacilities += f + " ";
	}
	lodgment.setConvenienceFacility(convenienceFacilities);
	lodgment.setIntroByHost(introByHost);
	lodgment.setWayToCome(wayToCome);
	lodgment.setNearByFacility(nearbyFacility);
	lodgment.setLodgmentRule(lodgmentRule);
	lodgment.setDynamicCharge(dynamicCharge);
	lodgment.setParkingInfo(parkingInfo);
	lodgment.setChecklist(checklist);
	
// 	String title = multi.getParameter("title"), content = multi.getParameter("content");
	
	lodgmentDao.updateLodgmentHostIntro(lodgment, (String)session.getAttribute("hostEmail"));
// 	System.out.print(facilities + "\n" + introByHost + "\n" + wayToCome + "\n" + nearbyFacility + "\n" + 
// 	lodgmentRule + "\n" + dynamicCharge + "\n" + parkingInfo + "\n" + checklist);
%>
<script>
	location.href = "/project/NiceChoice_HostTime/niceChoice_HostTime.jsp";
</script>