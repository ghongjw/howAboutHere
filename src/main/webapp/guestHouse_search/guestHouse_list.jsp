<%@page import="guestHouse_pagelist.guestHouse_category"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String url = "gusetHouse_recommend.jsp?cityName=";

String regervation = request.getParameter("datefilter");
String min_price = request.getParameter("min_price");
String max_price = request.getParameter("max_price");
String sd = request.getParameter("sd");
String Gu_reservation[] = request.getParameterValues("Gu_reservation");
String Gu_bed[] = request.getParameterValues("Gu_bed");
String Gu_common[] = request.getParameterValues("Gu_common");
String Gu_facalty[] = request.getParameterValues("Gu_facalty");
String Gu_extra[] = request.getParameterValues("Gu_extra");
String sort = request.getParameter("sort");
String diff = request.getParameter("diff");

String check = "";
if (Gu_reservation != null) {
	for (String m : Gu_reservation) {
		check = check + "&Gu_reservation=" + m;
	}
}
if (Gu_bed != null) {
	for (String m : Gu_bed) {
		check = check + "&Gu_bed=" + m;
	}
}
if (Gu_common != null) {
	for (String m : Gu_common) {
		check = check + "&Gu_common=" + m;
	}
}
if (Gu_facalty != null) {
	for (String m : Gu_facalty) {
		check = check + "&Gu_facalty=" + m;
	}
}
if (Gu_extra != null) {
	for (String m : Gu_extra) {
		check = check + "&Gu_extra=" + m;
	}
}
if (sort!= null) {
	if (sort.equals("Gu_recom")) {
		check =check + "&sort=Gu_recom";
	}
	if (sort.equals("Gu_distance")) {
		check =check + "&sort=Gu_distance";
	}
	if (sort.equals("Gu_lowprice")) {
		check =check + "&sort=Gu_lowprice";
	}
	if (sort.equals("Gu_highprice")) {
		check =check + "&sort=Gu_highprice";
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
		+ max_price;%>



<div class="area_list" id="area_list" onclick="listhold()">
	<div class="fix_title"></div>
	<ul class="city">
		<li id="city1" onmouseover="city1()"><a href="<%=url%>0">서울</a></li>
		<li id="city2" onmouseover="city2()"><a href="<%=url%>1">경기/인천</a></li>
		<li id="city3" onmouseover="city3()"><a href="<%=url%>2">강원</a></li>
		<li id="city4" onmouseover="city4()"><a href="<%=url%>3">부산</a></li>
		<li id="city5" onmouseover="city5()"><a href="<%=url%>4">경상</a></li>
		<li id="city6" onmouseover="city6()"><a href="<%=url%>5">전라</a></li>
		<li id="city7" onmouseover="city7()"><a href="<%=url%>6">충청/대전</a></li>
		<li id="city8" onmouseover="city8()"><a href="<%=url%>7">제주</a></li>
	</ul>
	<div id="isscroll_02">
		<ul class="city_child" id="city_child1">
			<li><a href="<%=guestHouse_category.urldefine(0, 0)%><%=filtering%>">홍대/신촌/마포</a></li>
			<li><a href="<%=guestHouse_category.urldefine(0, 1)%><%=filtering%>">북촌/인사동/종로/동대문</a></li>
			<li><a href="<%=guestHouse_category.urldefine(0, 2)%><%=filtering%>">명동/남산/중구</a></li>
			<li><a href="<%=guestHouse_category.urldefine(0, 3)%><%=filtering%>">강남/잠실/삼성/서초</a></li>
			<li><a href="<%=guestHouse_category.urldefine(0, 4)%><%=filtering%>">이태원/서울역/용산</a></li>
			<li><a href="<%=guestHouse_category.urldefine(0, 5)%><%=filtering%>">영등포/신림/김포공항</a></li>
		</ul>
		<ul class="city_child" id="city_child2">
			<li><a href="<%=guestHouse_category.urldefine(1, 0)%><%=filtering%>">경기</a></li>
			<li><a href="<%=guestHouse_category.urldefine(1, 1)%><%=filtering%>">인천</a></li>
			<li><a href="<%=guestHouse_category.urldefine(1, 2)%><%=filtering%>">인천공항/중구</a></li>
		</ul>
		<ul class="city_child" id="city_child3">
			<li><a href="<%=guestHouse_category.urldefine(2, 0)%><%=filtering%>">강릉/동해/삼척</a></li>
			<li><a href="<%=guestHouse_category.urldefine(2, 1)%><%=filtering%>">속초/양양/고성</a></li>
			<li><a href="<%=guestHouse_category.urldefine(2, 2)%><%=filtering%>">춘천/영월</a></li>
		</ul>
		<ul class="city_child" id="city_child4">
			<li><a href="<%=guestHouse_category.urldefine(3, 0)%><%=filtering%>">해운대/기장</a></li>
			<li><a href="<%=guestHouse_category.urldefine(3, 1)%><%=filtering%>">남포동/자갈치/송도/감천마을</a></li>
			<li><a href="<%=guestHouse_category.urldefine(3, 2)%><%=filtering%>">부산역/서면</a></li>
			<li><a href="<%=guestHouse_category.urldefine(3, 3)%><%=filtering%>">광안리</a></li>
		</ul>
		<ul class="city_child" id="city_child5">
			<li><a href="<%=guestHouse_category.urldefine(4, 0)%><%=filtering%>">경주</a></li>
			<li><a href="<%=guestHouse_category.urldefine(4, 1)%><%=filtering%>">대구</a></li>
			<li><a href="<%=guestHouse_category.urldefine(4, 2)%><%=filtering%>">안동/포항</a></li>
			<li><a href="<%=guestHouse_category.urldefine(4, 3)%><%=filtering%>">통영</a></li>
			<li><a href="<%=guestHouse_category.urldefine(4, 4)%><%=filtering%>">거제/남해/울산</a></li>
		</ul>
		<ul class="city_child" id="city_child6">
			<li><a href="<%=guestHouse_category.urldefine(5, 0)%><%=filtering%>">전주/한옥마을</a></li>
			<li><a href="<%=guestHouse_category.urldefine(5, 1)%><%=filtering%>">군산/남원/익산</a></li>
			<li><a href="<%=guestHouse_category.urldefine(5, 2)%><%=filtering%>">여수</a></li>
			<li><a href="<%=guestHouse_category.urldefine(5, 3)%><%=filtering%>">순천/목포/함평</a></li>
			<li><a href="<%=guestHouse_category.urldefine(5, 4)%><%=filtering%>">광주</a></li>
		</ul>
		<ul class="city_child" id="city_child7">

			<li><a href="<%=guestHouse_category.urldefine(6, 0)%><%=filtering%>">충청</a></li>
			<li><a href="<%=guestHouse_category.urldefine(6, 1)%><%=filtering%>">대전</a></li>
		</ul>
		<ul class="city_child" id="city_child8">
			<li><a href="<%=guestHouse_category.urldefine(7, 0)%><%=filtering%>">제주공항</a></li>
			<li><a href="<%=guestHouse_category.urldefine(7, 1)%><%=filtering%>">애월/협재</a></li>
			<li><a href="<%=guestHouse_category.urldefine(7, 2)%><%=filtering%>">조천/함덕</a></li>
			<li><a href="<%=guestHouse_category.urldefine(7, 3)%><%=filtering%>">구좌/월정</a></li>
			<li><a href="<%=guestHouse_category.urldefine(7, 4)%><%=filtering%>">조천/함덕</a></li>
			<li><a href="<%=guestHouse_category.urldefine(7, 5)%><%=filtering%>">구좌/월정</a></li>
			<li><a href="<%=guestHouse_category.urldefine(7, 6)%><%=filtering%>">성산/우도</a></li>
			<li><a href="<%=guestHouse_category.urldefine(7, 7)%><%=filtering%>">남원/표선</a></li>
			<li><a href="<%=guestHouse_category.urldefine(7, 8)%><%=filtering%>">서귀포/중문</a></li>
			<li><a href="<%=guestHouse_category.urldefine(7, 9)%><%=filtering%>">대정/안덕</a></li>
		</ul>


	</div>
</div>

</body>
</html>