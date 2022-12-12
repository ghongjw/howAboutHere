<%@page import="hotel_pagelist.hotel_category"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="../css/hotel_search.css" />
<%
String url="hotel_recommend.jsp?cityName=";

String regervation = request.getParameter("datefilter");
String min_price = request.getParameter("min_price");
String max_price = request.getParameter("max_price");
String sd = request.getParameter("sd");
String hotel_reservation[] = request.getParameterValues("hotel_reservation");
String hotel_type[] = request.getParameterValues("hotel_type");
String hotel_bed[] = request.getParameterValues("hotel_bed");
String hotel_common[] = request.getParameterValues("hotel_common");
String hotel_facalty[] = request.getParameterValues("hotel_facalty");
String hotel_extra[] = request.getParameterValues("hotel_extra");
String sort = request.getParameter("sort");
String diff = request.getParameter("diff");
String check = "";
if(hotel_reservation!=null){
	for(String m :hotel_reservation){
	check =check + "&hotel_reservation="+m;
	}
}
if(hotel_type!=null){
	for(String m :hotel_type){
	check =check + "&hotel_type="+m;
	}
}
if(hotel_bed!=null){
	for(String m :hotel_bed){
	check =check + "&hotel_bed="+m;
	}
}
if(hotel_common!=null){
	for(String m :hotel_common){
	check =check + "&hotel_common="+m;
	}
}
if(hotel_facalty!=null){
	for(String m :hotel_facalty){
	check =check + "&hotel_facalty="+m;
	}
}
if(hotel_extra!=null){
	for(String m :hotel_extra){
	check =check + "&hotel_extra="+m;
	}
}
if (sd == null || sd.isEmpty()) {
	sd = ".1박";
}
if (diff == null || diff.isEmpty()) {
	diff = "1";
}
if (sort!= null) {
	if (sort.equals("recom")) {
		check =check + "&sort=recom";
	}
	if (sort.equals("distance")) {
		check =check + "&sort=distance";
	}
	if (sort.equals("lowprice")) {
		check =check + "&sort=lowprice";
	}
	if (sort.equals("highprice")) {
		check =check + "&sort=highprice";
	}
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

String filtering="&datefilter="+regervation+"&sd="+sd+"&diff="+diff+check;
%>



<div class="area_list" id="area_list" onclick="listhold()"  >
	<div class="fix_title"></div>
	<ul class="city">
		<li id="city1" onmouseover="city1()"><a href="<%=url%>0">서울</a></li>
		<li id="city2" onmouseover="city2()"><a href="<%=url%>1">부산</a></li>
		<li id="city3" onmouseover="city3()"><a href="<%=url%>2">제주</a></li>
		<li id="city4" onmouseover="city4()"><a href="<%=url%>3">강원</a></li>
		<li id="city5" onmouseover="city5()"><a href="<%=url%>4">경기</a></li>
		<li id="city6" onmouseover="city6()"><a href="<%=url%>5">인천</a></li>
		<li id="city7" onmouseover="city7()"><a href="<%=url%>6">경상</a></li>
		<li id="city8" onmouseover="city8()"><a href="<%=url%>7">전라</a></li>
		<li id="city9" onmouseover="city9()"><a href="<%=url%>8">충청</a></li>
	</ul>

	<div id="isscroll_02">

		<ul class="city_child" id="city_child1" style = "margin-top : 101px;">
			<li><a href="<%=hotel_category.urldefine(0,0)%><%=filtering%>">강남/역삼/삼성/신사/청담</a></li>
			<li><a href="<%=hotel_category.urldefine(0,1)%><%=filtering%>">서초/교대</a></li>
			<li><a href="<%=hotel_category.urldefine(0,2)%><%=filtering%>">잠실/송파/왕십리/강동</a></li>
			<li><a href="<%=hotel_category.urldefine(0,3)%><%=filtering%>">을지로/시청/명동</a></li>
			<li><a href="<%=hotel_category.urldefine(0,4)%><%=filtering%>">종로/이낫동/동대문/강북</a></li>
			<li><a href="<%=hotel_category.urldefine(0,5)%><%=filtering%>">서울역/이태원/용산</a></li>
			<li><a href="<%=hotel_category.urldefine(0,6)%><%=filtering%>">마포/홍대/신촌/서대문</a></li>
			<li><a href="<%=hotel_category.urldefine(0,7)%><%=filtering%>">영등포/여의도/김포공항</a></li>
			<li><a href="<%=hotel_category.urldefine(0,8)%><%=filtering%>">구로/금천/관악/동작</a></li>
		</ul>
		<ul class="city_child" id="city_child2">
			<li><a href="<%=hotel_category.urldefine(1,0)%><%=filtering%>">해운대(센텀,송정,달맞이)</a></li>
			<li><a href="<%=hotel_category.urldefine(1,1)%><%=filtering%>">광안리</a></li>
			<li><a href="<%=hotel_category.urldefine(1,2)%><%=filtering%>">부산역/남포/자갈치</a></li>
			<li><a href="<%=hotel_category.urldefine(1,3)%><%=filtering%>">서면/동래/연제/남구</a></li>
			<li><a href="<%=hotel_category.urldefine(1,4)%><%=filtering%>">기장/김해공항/기타(그외지역)</a></li>
			<li><a href="<%=hotel_category.urldefine(1,5)%><%=filtering%>">영도/송도해수욕장</a></li>
		</ul>
		<ul class="city_child" id="city_child3">
			<li><a href="<%=hotel_category.urldefine(2,0)%><%=filtering%>">제주시/제주국제공항</a></li>
			<li><a href="<%=hotel_category.urldefine(2,1)%><%=filtering%>">애월/협재/김녕</a></li>
			<li><a href="<%=hotel_category.urldefine(2,2)%><%=filtering%>">서귀포시</a></li>
			<li><a href="<%=hotel_category.urldefine(2,3)%><%=filtering%>">중문</a></li>
			<li><a href="<%=hotel_category.urldefine(2,4)%><%=filtering%>">성산/표선</a></li>
		</ul>
		<ul class="city_child" id="city_child4">
			<li><a href="<%=hotel_category.urldefine(3,0)%><%=filtering%>">강릉/동해/삼척</a></li>
			<li><a href="<%=hotel_category.urldefine(3,1)%><%=filtering%>">속초/고성</a></li>
			<li><a href="<%=hotel_category.urldefine(3,2)%><%=filtering%>">양양/홍천/인제/철원</a></li>
			<li><a href="<%=hotel_category.urldefine(3,3)%><%=filtering%>">평창/정선/횡성</a></li>
			<li><a href="<%=hotel_category.urldefine(3,4)%><%=filtering%>">춘천/원주/영월/태백</a></li>
		</ul>
		<ul class="city_child" id="city_child5">
			<li><a href="<%=hotel_category.urldefine(4,0)%><%=filtering%>">수원/성남/판교</a></li>
			<li><a href="<%=hotel_category.urldefine(4,1)%><%=filtering%>">가평/양평/포천</a></li>
			<li><a href="<%=hotel_category.urldefine(4,2)%><%=filtering%>">용인/평택/여주/이천</a></li>
			<li><a href="<%=hotel_category.urldefine(4,3)%><%=filtering%>">화성/동탄/안산/부천/안양</a></li>
			<li><a href="<%=hotel_category.urldefine(4,4)%><%=filtering%>">고양/의정부/파주/김포</a></li>
			<li><a href="<%=hotel_category.urldefine(4,5)%><%=filtering%>">시흥/군포/광명</a></li>
			<li><a href="<%=hotel_category.urldefine(4,6)%><%=filtering%>">남양주시/구리/하남</a></li>
		</ul>
		<ul class="city_child" id="city_child6">
			<li><a href="<%=hotel_category.urldefine(5,0)%><%=filtering%>">송도/남동구/옹진군</a></li>
			<li><a href="<%=hotel_category.urldefine(5,1)%><%=filtering%>">인천국제공항(중구)</a></li>
			<li><a href="<%=hotel_category.urldefine(5,2)%><%=filtering%>">부평/계양/서구/미추홀구/강화</a></li>
		</ul>
		<ul class="city_child" id="city_child7">
			<li><a href="<%=hotel_category.urldefine(6,0)%><%=filtering%>">경주</a></li>
			<li><a href="<%=hotel_category.urldefine(6,1)%><%=filtering%>">거제/고성</a></li>
			<li><a href="<%=hotel_category.urldefine(6,2)%><%=filtering%>">포항/청송/영덕/울진</a></li>
			<li><a href="<%=hotel_category.urldefine(6,3)%><%=filtering%>">통영/창녕</a></li>
			<li><a href="<%=hotel_category.urldefine(6,4)%><%=filtering%>">대구/구미/문경</a></li>
			<li><a href="<%=hotel_category.urldefine(6,5)%><%=filtering%>">울산/안동</a></li>
			<li><a href="<%=hotel_category.urldefine(6,6)%><%=filtering%>">창원/양산/김해</a></li>
			<li><a href="<%=hotel_category.urldefine(6,7)%><%=filtering%>">사천/남해/진주/하동</a></li>
		</ul>
		<ul class="city_child" id="city_child8">
			<li><a href="<%=hotel_category.urldefine(7,0)%><%=filtering%>">여수</a></li>
			<li><a href="<%=hotel_category.urldefine(7,1)%><%=filtering%>">진주</a></li>
			<li><a href="<%=hotel_category.urldefine(7,2)%><%=filtering%>">광주</a></li>
			<li><a href="<%=hotel_category.urldefine(7,3)%><%=filtering%>">순천/광양</a></li>
			<li><a href="<%=hotel_category.urldefine(7,4)%><%=filtering%>">군산/익산/부안/진안/무주</a></li>
			<li><a href="<%=hotel_category.urldefine(7,5)%><%=filtering%>">화순/남원/구례</a></li>
			<li><a href="<%=hotel_category.urldefine(7,6)%><%=filtering%>">목포/나주/완도/해남/영암</a></li>
		</ul>
		<ul class="city_child" id="city_child9">
			<li><a href="<%=hotel_category.urldefine(8,0)%><%=filtering%>">대전</a></li>
			<li><a href="<%=hotel_category.urldefine(8,1)%><%=filtering%>">천안/아산/예산/당진</a></li>
			<li><a href="<%=hotel_category.urldefine(8,2)%><%=filtering%>">보령(대천)/태안(안면도)/서산/부여</a></li>
			<li><a href="<%=hotel_category.urldefine(8,3)%><%=filtering%>">충주/제천/단양</a></li>
			<li><a href="<%=hotel_category.urldefine(8,4)%><%=filtering%>">청주/세종</a></li>
		
		</ul>
	
	</div>
</div>

</body>
</html>