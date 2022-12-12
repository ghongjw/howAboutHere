<%@page import="java.util.ArrayList"%>
<%@page import="teamproject.UnloginReservationDTO"%>
<%@page import="teamproject.UnloginReservationDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String mobile = request.getParameter("uphone");
	String renum = request.getParameter("do_no");
	
	UnloginReservationDAO unloginReservationDao = new UnloginReservationDAO();
	UnloginReservationDTO UnloginReservation = unloginReservationDao.selectMobile(mobile);
	ArrayList<UnloginReservationDTO> UnloginReservations = unloginReservationDao.renumList(mobile);
	
	if(UnloginReservation == null){
		%><script>alert('예약정보가 없습니다');location.href="../index/main.jsp"</script><%
		/* UnloginReservationDTO UnloginReservations = new UnloginReservationDTO();
		UnloginReservations.setMobile(mobile);
		UnloginReservations.setReservationNum(reservationNum);
		UnloginReservations.setHotelName("호텔이름");
		UnloginReservations.setReservationDate("2022-10-07");
		UnloginReservations.setUserName("홍길동");
		unloginReservationDao.insert(UnloginReservations); */
	}for(UnloginReservationDTO m : UnloginReservations){
		if(m.getReservationNum().equals(renum)){
			response.sendRedirect("reserveForm.jsp?mobile="+UnloginReservation.getMobile());
		}
		else{
			%><script>alert('예약번호가 잘못되었습니다');location.href="searchUnknown.jsp"</script><%
		}
	}
	unloginReservationDao.disconnection();
%>