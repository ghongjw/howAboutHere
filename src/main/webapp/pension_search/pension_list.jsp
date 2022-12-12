<%@page import="pension_pagelist.pension_category"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String url="pension_recommend.jsp?cityName=";

String regervation = request.getParameter("datefilter");
String min_price = request.getParameter("min_price");
String max_price = request.getParameter("max_price");
String sd = request.getParameter("sd");
String diff = request.getParameter("diff");
String pension_reservation[] = request.getParameterValues("pension_reservation");
String pension_type[] = request.getParameterValues("pension_type");
String pension_common[] = request.getParameterValues("pension_common");
String pension_facalty[] = request.getParameterValues("pension_facalty");
String pension_extra[] = request.getParameterValues("pension_extra");
String sort = request.getParameter("sort");

String check = "";
if(pension_reservation!=null){
	for(String m :pension_reservation){
	check =check + "&pension_reservation="+m;
	}
}
if(pension_type!=null){
	for(String m :pension_type){
	check =check + "&pension_type="+m;
	}
}
if(pension_common!=null){
	for(String m :pension_common){
	check =check + "&pension_common="+m;
	}
}
if(pension_facalty!=null){
	for(String m :pension_facalty){
	check =check + "&pension_facalty="+m;
	}
}
if(pension_extra!=null){
	for(String m :pension_extra){
	check =check + "&pension_extra="+m;
	}
}
if (sort!= null) {
	if (sort.equals("Pen_recom")) {
		check =check + "&sort=Pen_recom";
	}
	if (sort.equals("Pen_distance")) {
		check =check + "&sort=Pen_distance";
	}
	if (sort.equals("Pen_lowprice")) {
		check =check + "&sort=Pen_lowprice";
	}
	if (sort.equals("Pen_highprice")) {
		check =check + "&sort=Pen_highprice";
	}
}
if (sd == null || sd.isEmpty()) {
	sd = ".1박";
}
if (diff == null || diff.isEmpty()) {
	diff = ".1박";
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

String filtering="&datefilter="+regervation+"&sd="+sd+"&diff="+diff+check+"&min_price="+min_price+"&max_price="+max_price;

%>



<div class="area_list" id="area_list" onclick="listhold()"  >
	<div class="fix_title"></div>
	<ul class="city">
		<li id="city1" onmouseover="city1()"><a href="<%=url%>0">경기/인천</a></li>
		<li id="city2" onmouseover="city2()"><a href="<%=url%>1">강원</a></li>
		<li id="city3" onmouseover="city3()"><a href="<%=url%>2">가평</a></li>
		<li id="city4" onmouseover="city4()"><a href="<%=url%>3">경북</a></li>
		<li id="city5" onmouseover="city5()"><a href="<%=url%>4">충청</a></li>
		<li id="city6" onmouseover="city6()"><a href="<%=url%>5">경남</a></li>
		<li id="city7" onmouseover="city7()"><a href="<%=url%>6">전라</a></li>
		<li id="city8" onmouseover="city8()"><a href="<%=url%>7">부산</a></li>
		<li id="city9" onmouseover="city9()"><a href="<%=url%>8">제주</a></li>
	</ul>


	<div id="isscroll_02">

		<ul class="city_child" id="city_child1">
			<li><a href="<%=pension_category.urldefine(0,0)%><%=filtering%>">양평/용문</a></li>
			<li><a href="<%=pension_category.urldefine(0,1)%><%=filtering%>">포천/남양주</a></li>
			<li><a href="<%=pension_category.urldefine(0,2)%><%=filtering%>">대부도/영흥도/선제도</a></li>
			<li><a href="<%=pension_category.urldefine(0,3)%><%=filtering%>">강화</a></li>
			<li><a href="<%=pension_category.urldefine(0,4)%><%=filtering%>">영종도/을왕리/기타도서</a></li>
			<li><a href="<%=pension_category.urldefine(0,5)%><%=filtering%>">파주/양주/연천</a></li>
			<li><a href="<%=pension_category.urldefine(0,6)%><%=filtering%>">화성/제부도/안성</a></li>
			<li><a href="<%=pension_category.urldefine(0,7)%><%=filtering%>">용인/여주/이천</a></li>
		</ul>
		<ul class="city_child" id="city_child2">
			<li><a href="<%=pension_category.urldefine(1,0)%><%=filtering%>">강릉/경포</a></li>
			<li><a href="<%=pension_category.urldefine(1,1)%><%=filtering%>">속초/고성</a></li>
			<li><a href="<%=pension_category.urldefine(1,2)%><%=filtering%>">양양</a></li>
			<li><a href="<%=pension_category.urldefine(1,3)%><%=filtering%>">춘천(남이섬/)강촌</a></li>
			<li><a href="<%=pension_category.urldefine(1,4)%><%=filtering%>">홍천/인제/철원/화천</a></li>
			<li><a href="<%=pension_category.urldefine(1,5)%><%=filtering%>">동해/삼척</a></li>
			<li><a href="<%=pension_category.urldefine(1,6)%><%=filtering%>">평창/횡성/원주</a></li>
			<li><a href="<%=pension_category.urldefine(1,7)%><%=filtering%>">정선/영월</a></li>
		</ul>
		<ul class="city_child" id="city_child3">
			<li><a href="<%=pension_category.urldefine(2,0)%><%=filtering%>">남이섬/가평읍</a></li>
			<li><a href="<%=pension_category.urldefine(2,1)%><%=filtering%>">아침고요수목원/상면</a></li>
			<li><a href="<%=pension_category.urldefine(2,2)%><%=filtering%>">청평/설악/쁘띠프랑스</a></li>
			<li><a href="<%=pension_category.urldefine(2,3)%><%=filtering%>">자라섬/북면</a></li>
		</ul>
		<ul class="city_child" id="city_child4">
			<li><a href="<%=pension_category.urldefine(3,0)%><%=filtering%>">경주</a></li>
			<li><a href="<%=pension_category.urldefine(3,1)%><%=filtering%>">포항</a></li>
			<li><a href="<%=pension_category.urldefine(3,2)%><%=filtering%>">영덕/울진/울릉도</a></li>
			<li><a href="<%=pension_category.urldefine(3,3)%><%=filtering%>">문경/상주/안동/영주</a></li>
			<li><a href="<%=pension_category.urldefine(3,4)%><%=filtering%>">청도/성주/경산</a></li>
		</ul>
		<ul class="city_child" id="city_child5">
		<li><a href="<%=pension_category.urldefine(4,0)%><%=filtering%>">태안/만리포/청포대</a></li>
			<li><a href="<%=pension_category.urldefine(4,1)%><%=filtering%>">꽃지/안면도</a></li>
			<li><a href="<%=pension_category.urldefine(4,2)%><%=filtering%>">대천/보령</a></li>
			<li><a href="<%=pension_category.urldefine(4,3)%><%=filtering%>">단양/충주/제천/괴산</a></li>
			<li><a href="<%=pension_category.urldefine(4,4)%><%=filtering%>">서산/예산/아산/서천</a></li>
			<li><a href="<%=pension_category.urldefine(4,5)%><%=filtering%>">공주/청주/보은</a></li>
		</ul>
		<ul class="city_child" id="city_child6">
			<li><a href="<%=pension_category.urldefine(5,0)%><%=filtering%>">거제</a></li>
			<li><a href="<%=pension_category.urldefine(5,1)%><%=filtering%>">통영/고성</a></li>
			<li><a href="<%=pension_category.urldefine(5,2)%><%=filtering%>">남해/사천</a></li>
			<li><a href="<%=pension_category.urldefine(5,3)%><%=filtering%>">산청/하동/합천/거창</a></li>
			<li><a href="<%=pension_category.urldefine(5,4)%><%=filtering%>">밀양/양산/김해/창원</a></li>
			<li><a href="<%=pension_category.urldefine(5,5)%><%=filtering%>">울산</a></li>
		</ul>
		<ul class="city_child" id="city_child7">
			<li><a href="<%=pension_category.urldefine(6,0)%><%=filtering%>">여수</a></li>
			<li><a href="<%=pension_category.urldefine(6,1)%><%=filtering%>">변산반도/부안</a></li>
			<li><a href="<%=pension_category.urldefine(6,2)%><%=filtering%>">순천/광양/구례/담양</a></li>
			<li><a href="<%=pension_category.urldefine(6,3)%><%=filtering%>">전주/무주</a></li>
			<li><a href="<%=pension_category.urldefine(6,4)%><%=filtering%>">대구/구미/문경</a></li>
			<li><a href="<%=pension_category.urldefine(6,5)%><%=filtering%>">영광/목포/고흥</a></li>
		</ul>
		<ul class="city_child" id="city_child8">
			<li><a href="<%=pension_category.urldefine(7,0)%><%=filtering%>">해운대/광안리/송정</a></li>
			<li><a href="<%=pension_category.urldefine(7,1)%><%=filtering%>">기장</a></li>
			<li><a href="<%=pension_category.urldefine(7,2)%><%=filtering%>">강서/진구/서구</a></li>
		</ul>
		<ul class="city_child" id="city_child9">
			<li><a href="<%=pension_category.urldefine(8,0)%><%=filtering%>">제주/애월</a></li>
			<li><a href="<%=pension_category.urldefine(8,1)%><%=filtering%>">함덕/월정/구좌/하도</a></li>
			<li><a href="<%=pension_category.urldefine(8,2)%><%=filtering%>">협재/한림</a></li>
			<li><a href="<%=pension_category.urldefine(8,3)%><%=filtering%>">서귀포/성산/표선</a></li>
			<li><a href="<%=pension_category.urldefine(8,4)%><%=filtering%>">중문/산방산/모솔포</a></li>
		
		</ul>
	
	</div>
</div>

</body>
</html>