<%@page import="hotel_pagelist.hotel_category"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../index/main_header.jsp"%>

<link rel="stylesheet" href="../css/hotel_search.css" />
<script type="text/javascript" src=../js/serch.js></script>

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
	String cityName = hotel_category.cityname(intCity);
	String cityChildName = hotel_category.cityChildname(intCity,intCityChild);
	%>
	<div class="sub_topB" style="background-color: #f7323f">
		<div class="sub_top bg_kong_1">
		<h2>호텔·리조트</h2>
		<div class="area">
			<div class="btn_area" >
				<span ><%=cityName%></span><%=cityChildName %>
	<label id="bu" onmouseover="listPop()"></label>
	
			</div>
		</div> 
	</div>
</div>
<%@ include file="/hotel_search/hotel_filter.jsp" %>
<%@ include file="/hotel_search/hotel_list.jsp" %>


</body>
</html>