<%@page import="main_dateset.datecitiset"%>
<%@page import="motel_pageList.motel_category"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<%@ include file="../index/main_header.jsp"%>
				<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

<link rel="stylesheet" href="../css/motel_search.css" />
<script type="text/javascript" src=../js/search.js></script>
<%
String city = request.getParameter("cityName");
String cityChild = request.getParameter("cityChild");

int intCity = 0;
int intCityChild = 0;

//지역 시티명과 시티자식들이 없을 경우 초기값설정
if (city == null || city.isEmpty()) {
	intCity = 0;
} else
	intCity = Integer.parseInt(city);

//시티 값은 있으나 자식값이 없거나추천지역일때 아닐때는 그 값 지정하기
if (cityChild == null || cityChild.isEmpty()) {
	intCityChild = 0;
} else
	intCityChild = Integer.parseInt(cityChild);

String cityName = motel_category.cityname(intCity);
String cityChildName = motel_category.cityChildname(intCity, intCityChild);

String primaryCity = "모텔";

if (intCityChild == 0) {
	primaryCity = cityName + "지역편";

}
if (intCityChild == 0) {
%>
<div class="sub_topA"  onmouseover="listnone()">
	<div class="test"></div>
	<%
	
	
	} else if (intCityChild != 0) {
	%>
	<div class="sub_topB" style="background-color: #f7323f">
		<%
		;
		}
		%>
		<div class="sub_top bg_kong_1">
			<h2><%=primaryCity%></h2>
			<div class="area">
				<div class="btn_area">
					<span><%=cityName%></span><%=cityChildName%>
					<label id="bu" onmouseover="listPop()"></label>


				</div>
			</div>
		</div>
	</div>
	<%
	if (intCityChild != 0) {
	%>
	<%@ include file="/motel_search/filter_motel.jsp"%>

	<%
	}else if(intCityChild == 0) {
		//시티 값과자식 값 지정.

		MotelSearchDAO motelDao = new MotelSearchDAO();
		List<MotelSearchDTO> motelRecommends;
		motelRecommends = motelDao.list(cityName);
	%>
	<div id="wrap_commertial"> 
			<span>지역추천</span><input type="button" id="cf" value="광고"
				onclick="cf_pop()">
			<div id="cfPopup" style="display: none">
				<span>지역추천 상품 광고입니다.</span>

			</div> 
		</div>
	<%
	for (MotelSearchDTO md : motelRecommends) {
	%>
	<div id="motelLists" style="background: url('/project/lodgmentImage/<%=md.getHostId()%>/lodgment/<%=md.getHostId()%>_1.jpg') no-repeat 0 0; background-size:100%;">
		<div id="left">
		<p id="LodgementName"><%=md.getLodgmentName()%></p>
		<p id="LodgementRecommend"></p>
		<p id="LodgementCome"><%=md.getWayToCome()%></p>
		</div>
		<div id="right">
		<p id="LodgemoentStayPrice"><label>대실 </label><%=md.getLentPrice()%></p>
		<p id="LodgemoentSleepPrice"><label>숙박 </label><%=md.getOneNightPrice()%></p>
		</div>
		<form id="frm" action="../reservation/hotelInfoForm.jsp?datefilter=<%=datecitiset.dateset() %>" method="post">
		<div id="motelLists_shadow"></div>
		<input type="submit" id="hotelinfo" value="">
		<input type="hidden" name="datefilter" value="<%=datecitiset.dateset()%>">
		<input type="hidden" name="LodgementHostName" value="<%=md.getHostId()%>">

		</form>
	</div>
	
	<% }
	}
	%>
	<%@ include file="/motel_search/motel_list.jsp"%>
</div>



</div>
</body>
</html>