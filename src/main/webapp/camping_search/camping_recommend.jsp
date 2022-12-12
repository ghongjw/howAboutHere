<%@page import="camping_pagelist.camping_category"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../index/main_header.jsp"%>

<link rel="stylesheet" href="../css/camping_search.css" />
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

	
	//시티 값과자식 값 지정.
	String cityName = camping_category.cityname(intCity);
	%>
	<div class="sub_topB" style="background-color: #f7323f">
		<div class="sub_top bg_kong_1">
		<h2>캠핑/글램핑</h2>
		<div class="area">
			<div class="btn_area" >
				<span ><%=cityName%></span>전체
	<label id="bu" onmouseover="listPop()"></label>
	
			</div>
		</div> 
	</div>
</div>
<%@ include file="/camping_search/camping_filter.jsp" %>
<%@ include file="/camping_search/camping_list.jsp"%>


</body>
</html>