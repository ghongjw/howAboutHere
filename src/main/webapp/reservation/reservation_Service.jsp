
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

String roomplan = request.getParameter("roomplan");

String LodgmentHostName = request.getParameter("LodgmentHostName");
String LodgmentName = request.getParameter("LodgmentName");
String datefilter = request.getParameter("datefilter");
String roomName = request.getParameter("roomName");
String roomType = request.getParameter("roomType");
String inTime = request.getParameter("inTime");
String outTime = request.getParameter("outTime");
String lentPrice = request.getParameter("lentPrice");
String onenightPrice = request.getParameter("onenightPrice");
String diff = request.getParameter("diff");

int intInTime = Integer.parseInt(outTime) + 2;
int intOutTime = Integer.parseInt(outTime) + 12-24;
String sleepIn = String.valueOf(intInTime);
String sleepOut = String.valueOf(intOutTime);

//cookie.setMaxAge(60*60*24*7);

if (roomplan == null || roomplan.isEmpty()) {
%><script>
		alert("잘못된 접근입니다.")
		history.back();
	</script>
<%
}
if (LodgmentHostName == null || LodgmentHostName.isEmpty()) {
%><script>
		alert("잘못된 접근입니다.")
		history.back();
	</script>
<%
}
if (datefilter == null || datefilter.isEmpty()) {
%><script>
		alert("잘못된 접근입니다.")
		history.back();
	</script>
<%
}
if (roomName == null || roomName.isEmpty()) {
%><script>
		alert("잘못된 접근입니다.")
		history.back();
	</script>
<%
}
if (roomType == null || roomType.isEmpty()) {
%><script>
		alert("잘못된 접근입니다.")
		history.back();
	</script>
<%
}
if (inTime == null || inTime.isEmpty()) {
%><script>
		alert("잘못된 접근입니다.")
		history.back();
	</script>
<%
}
if (outTime == null || outTime.isEmpty()) {
%><script>
		alert("잘못된 접근입니다.")
		history.back();
	</script>
<%
}
if (lentPrice == null || lentPrice.isEmpty()) {
%><script>
		alert("잘못된 접근입니다.")
		history.back();
	</script>
<%
}
if (diff == null || diff.isEmpty()) {
%><script>
		alert("잘못된 접근입니다.")
		history.back();
	</script>
<%
}
if (onenightPrice == null || onenightPrice.isEmpty()) {
%><script>
		alert("잘못된 접근입니다.")
		history.back();
	</script>
<%
}
if (roomplan.equals("대실예약")) {
	Cookie cookie0 = new Cookie("LodgmentHostName", LodgmentHostName);
	cookie0.setMaxAge(600);
	response.addCookie(cookie0);	
	
Cookie cookie1 = new Cookie("LodgmentName", LodgmentName);
cookie1.setMaxAge(600);
response.addCookie(cookie1);
Cookie cookie2 = new Cookie("datefilter", datefilter);
cookie2.setMaxAge(600);
response.addCookie(cookie2);
Cookie cookie3 = new Cookie("roomType", roomType);
cookie3.setMaxAge(600);
response.addCookie(cookie3);
Cookie cookie4 = new Cookie("inTime", inTime);
cookie4.setMaxAge(600);
response.addCookie(cookie4);
Cookie cookie5 = new Cookie("outTime", outTime);
cookie5.setMaxAge(600);
response.addCookie(cookie5);
Cookie cookie6 = new Cookie("price", lentPrice);
cookie6.setMaxAge(600);
response.addCookie(cookie6);
Cookie cookie7 = new Cookie("diff", diff);
cookie7.setMaxAge(600);
response.addCookie(cookie7);
Cookie cookie8 = new Cookie("roomName", roomName);
cookie8.setMaxAge(600);
response.addCookie(cookie8);
} else if (roomplan.equals("숙박예약")) {
	Cookie cookie0 = new Cookie("LodgmentHostName", LodgmentHostName);
	cookie0.setMaxAge(600);
	response.addCookie(cookie0);
Cookie cookie1 = new Cookie("LodgmentName", LodgmentName);
cookie1.setMaxAge(600);
response.addCookie(cookie1);
Cookie cookie2 = new Cookie("datefilter", datefilter);
cookie2.setMaxAge(600);
response.addCookie(cookie2);
Cookie cookie3 = new Cookie("roomType", roomType);
cookie3.setMaxAge(600);
response.addCookie(cookie3);
Cookie cookie4 = new Cookie("inTime", sleepIn);
cookie4.setMaxAge(600);
response.addCookie(cookie4);
Cookie cookie5 = new Cookie("outTime", sleepOut);
cookie5.setMaxAge(600);
response.addCookie(cookie5);
Cookie cookie6 = new Cookie("price", onenightPrice);
cookie6.setMaxAge(600);
response.addCookie(cookie6);
Cookie cookie7 = new Cookie("diff", diff);
cookie7.setMaxAge(600);
response.addCookie(cookie7);
Cookie cookie8 = new Cookie("roomName", roomName);
cookie8.setMaxAge(600);
response.addCookie(cookie8);
}
response.sendRedirect("reservation.jsp");

%>