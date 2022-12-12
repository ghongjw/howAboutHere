<%@page import="motel_pageList.motel_category"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String regervation = request.getParameter("datefilter");

//getParameter
String city = request.getParameter("cityName");
String cityChild = request.getParameter("cityChild");
String min_price = request.getParameter("min_price");
String max_price = request.getParameter("max_price");

String motel_reservation[] = request.getParameterValues("motel_reservation");
String motel_theme[] = request.getParameterValues("motel_theme");
String motel_spa[] = request.getParameterValues("motel_spa");
String motel_play[] = request.getParameterValues("motel_play");
String motel_benefit[] = request.getParameterValues("motel_benefit");
String diff = request.getParameter("diff");
String sd = request.getParameter("sd");
String sort = request.getParameter("sort");

int intCity=0;
int intCityChild=0;

if(city==null||city.isEmpty()){
	intCity=0;
}else intCity = Integer.parseInt(city);

//시티 값은 있으나 자식값이 없거나추천지역일때 아닐때는 그 값 지정하기
if(cityChild==null||cityChild.isEmpty()){
	intCityChild=0;  
}else intCityChild = Integer.parseInt(cityChild);

//시티 값과자식 값 지정.
String cityName = motel_category.cityname(intCity);
String cityChildName = motel_category.cityChildname(intCity,intCityChild);

%>


<input type=hidden name="city" value="<%=city%>">
<input type=hidden name="cityChild" value="<%=cityChild%>">
<input type=hidden name="min_price" value="<%=min_price%>">
<input type=hidden name="max_price" value="<%=max_price%>">
<input type=hidden name="diff" value="<%=diff%>">
<input type=hidden name="sd" value="<%=sd%>">
<%for(String t:motel_reservation){%>
	<input type=hidden name="motel_reservation" value="<%=t%>">
	<%}
for(String t:motel_theme){%>
<input type=hidden name="motel_theme" value="<%=t%>">
<%}
for(String t:motel_spa){%>
<input type=hidden name="motel_theme" value="<%=t%>">
<%}
for(String t:motel_play){%>
<input type=hidden name="motel_theme" value="<%=t%>">
<%}
for(String t:motel_benefit){%>
<input type=hidden name="motel_theme" value="<%=t%>">
<%}

