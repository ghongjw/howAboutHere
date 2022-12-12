<%@page import="guestHouse_pagelist.guestHouse_category"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../index/main_header.jsp"%>

<link rel="stylesheet" href="../css/guestHouse_search.css" />
<script type="text/javascript" src=../js/search.js></script>

<%
String city = request.getParameter("cityName");
	String cityChild= request.getParameter("cityChild");
	
	int intCity=0;
	int intCityChild=0;
	
	//지역 시티명과 시티자식들이 없을 경우 초기값설정
	if(city==null||city.isEmpty()){
		intCity=0;
	}else intCity = Integer.parseInt(city);

	//시티 값은 있으나 자식값이 없거나추천지역일때 아닐때는 그 값 지정하기
	if(cityChild==null||cityChild.isEmpty()){
		intCityChild=0;  
	}else intCityChild = Integer.parseInt(cityChild);
	
	//시티 값과자식 값 지정.
	String cityName = guestHouse_category.cityname(intCity);
	String cityChildName = guestHouse_category.cityChildname(intCity,intCityChild);
%>
	<div class="sub_topB" style="background-color: #f7323f">
		<div class="sub_top bg_kong_1">
		<h2>게스트하우스</h2>
		<div class="area">
			<div class="btn_area" >
				<span ><%=cityName%></span><%=cityChildName %>
	<label id="bu" onmouseover="listPop()"></label>
			</div>
		</div> 
	</div>
</div>
<%@ include file="/guestHouse_search/guestHouse_filter.jsp" %>
<%@ include file="/guestHouse_search/guestHouse_list.jsp"%>


</body>
</html>