<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String url = "camping_recommend.jsp?cityName=";

String regervation = request.getParameter("datefilter");
String min_price = request.getParameter("min_price");
String max_price = request.getParameter("max_price");
String sd = request.getParameter("sd");
String diff = request.getParameter("diff");

String camping_reservation[] = request.getParameterValues("camping_reservation");
String camping_type[] = request.getParameterValues("camping_type");
String camping_common[] = request.getParameterValues("camping_common");
String camping_facalty[] = request.getParameterValues("camping_facalty");
String camping_extra[] = request.getParameterValues("camping_extra");
String sort = request.getParameter("sort");

String check = "";
if (camping_reservation != null) {
	for (String m : camping_reservation) {
		check = check + "&camping_reservation=" + m;
	}
}
if (camping_type != null) {
	for (String m : camping_type) {
		check = check + "&camping_type=" + m;
	}
}
if (camping_common != null) {
	for (String m : camping_common) {
		check = check + "&camping_common=" + m;
	}
}
if (camping_facalty != null) {
	for (String m : camping_facalty) {
		check = check + "&camping_facalty=" + m;
	}
}
if (camping_extra != null) {
	for (String m : camping_reservation) {
		check = check + "&camping_extra=" + m;
	}
}
if (sort!= null) {
	if (sort.equals("Cam_recom")) {
		check =check + "&sort=Cam_recom";
	}
	if (sort.equals("Cam_distance")) {
		check =check + "&sort=Cam_distance";
	}
	if (sort.equals("Cam_lowprice")) {
		check =check + "&sort=Cam_lowprice";
	}
	if (sort.equals("Cam_highprice")) {
		check =check + "&sort=Cam_highprice";
	}
}
if (sd == null || sd.isEmpty()) {
	sd = ".1박";
}
if (diff == null || diff.isEmpty()) {
	diff = "1";
}
if (regervation == null || regervation.equals("")) {
	Calendar cal = Calendar.getInstance();
	String format = "MM.dd";
	SimpleDateFormat sdf = new SimpleDateFormat(format);
	String Startday = sdf.format(cal.getTime());
	cal.add(cal.DATE, +1); //날짜를 하루 더한다.
	String Endday = sdf.format(cal.getTime());
	regervation = Startday + "%C2%A0~%C2%A0" + Endday;
}

String filtering = "&datefilter=" + regervation + "&sd=" + sd+ "&diff=" + diff + check + "&min_price=" + min_price + "&max_price="
		+ max_price;
%>



<div class="area_list" id="area_list" onclick="listhold()">
	<div class="fix_title"></div>
	<ul class="city">
		<li id="city1" onmouseover="city1()"><a href="<%=url%>0<%=filtering %>">경기/인천권</a></li>
		<li id="city2" onmouseover="city2()"><a href="<%=url%>1<%=filtering %>">충청권</a></li>
		<li id="city3" onmouseover="city3()"><a href="<%=url%>2<%=filtering %>">경상/부산권</a></li>
		<li id="city4" onmouseover="city4()"><a href="<%=url%>3<%=filtering %>">전라/제주권</a></li>
		<li id="city5" onmouseover="city5()"><a href="<%=url%>4<%=filtering %>">강원권</a></li>
	</ul>

</div>

</body>
</html>