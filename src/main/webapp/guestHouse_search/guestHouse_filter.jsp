<%@page import="guestHouse_pagelist.guestHouse_category"%>
<%@page import="Lodgement.MotelSearchDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.LodgmentLookupDAO"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://www.goodchoice.kr/js/library/iscroll.js"></script>
<script
	src="https://www.goodchoice.kr/js/service/datepick.js?rand=1664413250"></script>
<script
	src=https://www.goodchoice.kr/js/service/common.js?rand=1664413250></script>
<link rel="stylesheet" href="../css/randui.css">
<link rel="stylesheet" href="../css/common.css">
<script src="../motel_search/datePicker.js"></script>
<script src="../js/search.js"></script>
<%@page import="java.util.Locale"%>
<%@page import="java.util.concurrent.TimeUnit"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<!--  데이트 피커 jsql -->
<meta name='viewport' content='width=device-width, initial-scale=1'>
<meta charset="UTF-8">
<%
String regervation1 = request.getParameter("datefilter");
String Startday1 = "";
String Endday1 = "";
String Bday1 = "";

//getParameter
String city1 = request.getParameter("cityName");
String cityChild1 = request.getParameter("cityChild");
String persons1 = request.getParameter("persons");
String min_price1 = request.getParameter("min_price");
String max_price1 = request.getParameter("max_price");

String Gu_reservation1[] = request.getParameterValues("Gu_reservation");
String Gu_bed1[] = request.getParameterValues("Gu_bed");
String Gu_common1[] = request.getParameterValues("Gu_common");
String Gu_facalty1[] = request.getParameterValues("Gu_facalty");
String Gu_extra1[] = request.getParameterValues("Gu_extra");
String sort1 = request.getParameter("sort");
String sd1 = request.getParameter("sd");
String diff1 = request.getParameter("diff");

if (regervation1 == null || regervation1.equals("")) {
	Calendar cal = Calendar.getInstance();
	String format = "MM.dd";
	SimpleDateFormat sdf = new SimpleDateFormat(format);
	String Startday = sdf.format(cal.getTime());
	cal.add(cal.DATE, +1); //날짜를 하루 더한다.
	String Endday = sdf.format(cal.getTime());
	regervation1 = Startday + " ~ " + Endday;
}

if (persons1 == null || persons1.isEmpty()) {
	persons1 = "2";
}

//DB다녀와
LodgmentLookupDAO lodgmentDao = new LodgmentLookupDAO();
ArrayList<MotelSearchDTO> lodgments = null;

String[] locations = null;
if (cityChild1 != null) {
	locations = guestHouse_category.cityChildname(Integer.parseInt(city1), Integer.parseInt(cityChild1)).split("/");
	lodgments = lodgmentDao.showLodgment_6(locations);
} else if (city1 != null) {
	lodgments = lodgmentDao.showLodgment_5(city1);
}

System.out.print(lodgments + "\n");
lodgmentDao.disconnection();

//몇박인지 초기값설정
if (sd1 == null || sd1.isEmpty()) {
	sd1 = ".1박";
}
if (diff1 == null || diff1.isEmpty()) {
	diff1= "1";
}
if (min_price1 == null || min_price1.isEmpty()) {
	min_price1 = "10000";
}
if (max_price1 == null || max_price1.isEmpty()) {
	max_price1 = "300000";
}

String check_Gu_available = "";
String check_Gu_promotion = "";

String check_Gu_bed1 = "";
String check_Gu_bed2 = "";
String check_Gu_bed3 = "";
String check_Gu_bed4 = "";

String check_Gu_c1 = "";
String check_Gu_c2 = "";
String check_Gu_c3 = "";
String check_Gu_c4 = "";
String check_Gu_c5 = "";
String check_Gu_c6 = "";
String check_Gu_c7 = "";
String check_Gu_c8 = "";
String check_Gu_c9 = "";
String check_Gu_c10 = "";
String check_Gu_c11 = "";
String check_Gu_c12 = "";

String check_Gu_fac1 = "";
String check_Gu_fac2 = "";
String check_Gu_fac3 = "";
String check_Gu_fac4 = "";
String check_Gu_fac5 = "";
String check_Gu_fac6 = "";
String check_Gu_fac7 = "";
String check_Gu_fac8 = "";
String check_Gu_fac9 = "";
String check_Gu_fac10 = "";

String check_Gu_ex1 = "";
String check_Gu_ex2 = "";
String check_Gu_ex3 = "";
String check_Gu_ex4 = "";
String check_Gu_ex5 = "";
String check_Gu_ex6 = "";
String check_Gu_ex7 = "";
String check_Gu_ex8 = "";

String check_recom = "";
String check_distance = "";
String check_lowprice = "";
String check_highprice = "";

if (Gu_reservation1 != null) {
	for (String h : Gu_reservation1) {
		if (h.equals("예약가능")) {
	check_Gu_available = "checked";
		}
		if (h.equals("프로모션")) {
	check_Gu_promotion = "checked";
		}
	}
}if (Gu_bed1 != null) {
	for (String h : Gu_bed1) {
		if (h.equals("싱글")) {
	check_Gu_bed1 = "checked";
		}
		if (h.equals("더블")) {
	check_Gu_bed2 = "checked";
		}
		if (h.equals("트윈")) {
	check_Gu_bed3 = "checked";
		}
		if (h.equals("온돌")) {
	check_Gu_bed4 = "checked";
		}
	}
}if (Gu_common1 != null) {
	for (String h : Gu_common1) {
		if (h.equals("세탁기")) {
	check_Gu_c1 = "checked";
		}
		if (h.equals("라운지")) {
	check_Gu_c2 = "checked";
		}
		if (h.equals("주방/식당")) {
	check_Gu_c3 = "checked";
		}
		if (h.equals("건조기")) {
	check_Gu_c4 = "checked";
		}
		if (h.equals("탈수기")) {
	check_Gu_c5 = "checked";
		}
		if (h.equals("엘레베이터")) {
	check_Gu_c6 = "checked";
		}
		if (h.equals("주차장")) {
	check_Gu_c7 = "checked";
		}
		if (h.equals("공용PC")) {
	check_Gu_c8 = "checked";
		}
		if (h.equals("BBQ")) {
	check_Gu_c9 = "checked";
		}
		if (h.equals("카페")) {
	check_Gu_c10 = "checked";
		}
		if (h.equals("전자레인지")) {
	check_Gu_c11 = "checked";
		}
		if (h.equals("취사가능")) {
	check_Gu_c12 = "checked";
		}
	}
}if (Gu_facalty1 != null) {
	for (String h : Gu_facalty1) {
		if (h.equals("와이파이")) {
	check_Gu_fac1 = "checked";
		}
		if (h.equals("개인콘센트")) {
	check_Gu_fac2 = "checked";
		}
		if (h.equals("욕실용품")) {
	check_Gu_fac3 = "checked";
		}
		if (h.equals("에어컨")) {
	check_Gu_fac4 = "checked";
		}
		if (h.equals("냉장고")) {
	check_Gu_fac5 = "checked";
		}
		if (h.equals("객싦샤워실")) {
	check_Gu_fac6 = "checked";
		}
		if (h.equals("욕조")) {
	check_Gu_fac7 = "checked";
		}
		if (h.equals("드라이기")) {
	check_Gu_fac8 = "checked";
		}
		if (h.equals("다리미")) {
	check_Gu_fac9 = "checked";
		}
		if (h.equals("TV")) {
	check_Gu_fac10 = "checked";
		}
	}
}if (Gu_extra1 != null) {
	for (String h : Gu_extra1) {
		if (h.equals("조식포함")) {
	check_Gu_ex1 = "checked";
		}
		if (h.equals("개인사물함")) {
	check_Gu_ex2 = "checked";
		}
		if (h.equals("객실내흡연")) {
	check_Gu_ex3 = "checked";
		}
		if (h.equals("반려견동반")) {
	check_Gu_ex4 = "checked";
		}
		if (h.equals("짐보관기능")) {
	check_Gu_ex5 = "checked";
		}
		if (h.equals("프린터사용")) {
	check_Gu_ex6 = "checked";
		}
		if (h.equals("무료주차")) {
	check_Gu_ex7 = "checked";
		}
		if (h.equals("카드결제")) {
	check_Gu_ex8 = "checked";
		}
	}
}

if (sort1 != null) {
	if (sort1.equals("Gecom")) {
		check_recom = "checked";
	}
	if (sort1.equals("distance")) {
		check_distance = "checked";
	}
	if (sort1.equals("lowprice")) {
		check_lowprice = "checked";
	}	if (sort1.equals("highprice")) {
		check_highprice = "checked";
	}
} else {
	check_recom = "checked";
}
int intCity1 = 0;
int intCityChild1 = 0;

//지역 시티명과 시티자식들이 없을 경우 초기값설정
if (city1 == null || city1.isEmpty()) {
	intCity1 = 0;
} else
	intCity1 = Integer.parseInt(city1);

//시티 값은 있으나 자식값이 없거나추천지역일때 아닐때는 그 값 지정하기
if (cityChild1 == null || cityChild1.isEmpty()) {
	intCityChild1 = 0;
} else
	intCityChild1 = Integer.parseInt(cityChild1);

String reurl = "../guestHouse_search/guestHouse_recommend.jsp?cityName=" + city1 + "&cityChild=" + cityChild1;
%>
<form action="<%=reurl%>" method="get">
	<div id="filter_wrap">
		<div id="date_box">
			<h3>날짜</h3>
			<div id="Revday_box">
				<button disabled></button>
				<input type="text" id="regervation" name="datefilter"
					value="<%=regervation1%>" readonly> <input type="text"
					id="displayregervation" name="sd" value=<%=sd1%> readonly>
				<input type="hidden" name="cityName" value="<%=city1%>" readonly>
				<input type="hidden" name="cityChild" value="<%=cityChild1%>"
					readonly>
					<input type="hidden" id="diff" name="diff" value="<%=diff1%>" readonly>
					
				<%@include file="../motel_search/Datepicker.jsp"%>
			</div>
		</div>
		<div id="detail_box">

			<h3>상세조건</h3>
			<input type="button" id="reset" onclick="all_reset_gf()" value="초기화">
			<input type="submit" value="적용">

			<div id="reserve">
				<ul>
					<li><input type="checkbox" id="Gu_available" name="Gu_reservation"
						<%=check_Gu_available%> value="예약가능"><label
						for="Gu_available">예약가능</label></li>
					<li><input type="checkbox" id="Gu_promotion" name="Gu_reservation"
						<%=check_Gu_promotion%> value="프로모션"><label
						for="Gu_promotion">프로모션</label></li>
				</ul>
			</div>



			<div id="persons">
				<strong>인원</strong> <input type='button' id="pm"
					onclick='count("plus")' value='+' />
				<div id='result'><%=persons1%></div>
				<input type='button' onclick='count("minus")' id="pm" value='-' />
				<input type=hidden id='result' name="persons" value="<%=persons1%>">
				<%
				%>
			</div>

			<div id="price">
				<strong>가격</strong> <span><label for="amount"></label><input
					type="text" id="amount" class="price_val" readonly> <input
					type="hidden" id="min_price" name="min_price"
					value="<%=min_price1%>"> <input type="hidden"
					id="max_price" name="max_price" value="<%=max_price1%>"></span>
				<section>
					<div class="slider_wrap">
						<div id="slider" data-min="1" data-max="30">
							<span tabindex="0"
								class="ui-slider-handle ui-corner-all ui-state-default"
								style="left: 0%;"> </span> <span tabindex="0"
								class="ui-slider-handle ui-corner-all ui-state-default"
								style="left: 100%;"> </span>
						</div>
					</div>
				</section>
				<label id="minwon">1만원</label><label class="maxwon">30만원</label>
			</div>
			<script>
				$(function() {
					function xReturnNumber(str) {
						var num_check = /^[0-9]*$/;

						if (num_check.test(str)) {
							if (str.length == 0)
								return 0;
							return parseInt(str);
						} else {
							return 0;
						}
					}

					var min_price = xReturnNumber($("#min_price").val());
					var max_price = xReturnNumber($("#max_price").val());

					if (min_price == 0)
						min_price = xReturnNumber($("#slider").data('min')) * 10000;
					if (max_price == 0)
						max_price = xReturnNumber($("#slider").data('max')) * 10000;

					var min_title = min_price / 10000;
					var max_title = max_price / 10000;
					amount_title = min_title + '만원 이상';

					/* 슬라이더 */
					$("#slider")
							.slider(
									{

										range : true,
										min : xReturnNumber($("#slider").data(
												'min')) * 10000,
										max : xReturnNumber($("#slider").data(
												'max')) * 10000,
										step : 10000,
										values : [ min_price, max_price ],
										slide : function(event, ui) {
											if ((ui.values[0] + 10000) >= ui.values[1]) {
												return false;
											}

											$("#min_price").val(ui.values[0]);
											$("#max_price").val(ui.values[1]);

											min_title = xReturnNumber(ui.values[0]) / 10000;
											max_title = xReturnNumber(ui.values[1]) / 10000;

											amount_title = min_title + '만원 이상';

											if (max_title < xReturnNumber($(
													"#slider").data('max'))) {
												amount_title = min_title
														+ '만원 ~ ' + max_title
														+ '만원';
											}

											$("#amount").val(amount_title);
										}
									});

					if (max_title < xReturnNumber($("#slider").data('max'))) {
						amount_title = min_title + '만원 ~ ' + max_title + '만원';
					}

					$("#amount").val(amount_title);
				});
			</script>
			<div id="bed_type">
				<strong>베드타입</strong>
				<ul>
					<li><input type="checkbox" id="Gu_bed1" value="싱글"
						name="Gu_bed" <%=check_Gu_bed1%>><label for="Gu_bed1">싱글</label></li>
					<li><input type="checkbox" id="Gu_bed2" value="더블"
						name="Gu_bed" <%=check_Gu_bed2%>><label for="Gu_bed2">더블</label></li>
					<li><input type="checkbox" id="Gu_bed3" value="트윈"
						name="Gu_bed" <%=check_Gu_bed3%>><label for="Gu_bed3">트윈</label></li>
					<li><input type="checkbox" id="Gu_bed4" value="온돌"
						name="Gu_bed" <%=check_Gu_bed4%>><label for="Gu_bed4">온돌</label></li>
				</ul>
			</div>

			<div id="common">
				<strong>공용시설</strong>
				<ul>
					<li><input type="checkbox" id="Gu_c1" value="세탁기"
						name="Gu_common" <%=check_Gu_c1%>><label for="Gu_c1">세탁기</label></li>
					<li><input type="checkbox" id="Gu_c2" value="라운지"
						name="Gu_common" <%=check_Gu_c2%>><label for="Gu_c2">라운지</label></li>
					<li><input type="checkbox" id="Gu_c3" value="주방/식당"
						name="Gu_common" <%=check_Gu_c3%>><label for="Gu_c3">주방/식당</label></li>
					<li><input type="checkbox" id="Gu_c4" value="건조기"
						name="Gu_common" <%=check_Gu_c4%>><label for="Gu_c4">건조기</label></li>
					<li><input type="checkbox" id="Gu_c5" value="탈수기"
						name="Gu_common" <%=check_Gu_c5%>><label for="Gu_c5">탈수기</label></li>
					<li><input type="checkbox" id="Gu_c6" value="엘레베이터"
						name="Gu_common" <%=check_Gu_c6%>><label for="Gu_c6">엘레베이터</label></li>
					<li><input type="checkbox" id="Gu_c7" value="주차장"
						name="Gu_common" <%=check_Gu_c7%>><label for="Gu_c7">주차장</label></li>
					<li><input type="checkbox" id="Gu_c8" value="공용PC"
						name="Gu_common" <%=check_Gu_c8%>><label for="Gu_c8">공용PC</label></li>
					<li><input type="checkbox" id="Gu_c9" value="BBQ"
						name="Gu_common" <%=check_Gu_c9%>><label for="Gu_c9">BBQ</label></li>
					<li><input type="checkbox" id="Gu_c10" value="카페"
						name="Gu_common" <%=check_Gu_c10%>><label for="Gu_c10">카페</label></li>
					<li><input type="checkbox" id="Gu_c11" value="전자레인지"
						name="Gu_common" <%=check_Gu_c11%>><label for="Gu_c11">전자레인지</label></li>
					<li><input type="checkbox" id="Gu_c12" value="취사가능"
						name="Gu_common" <%=check_Gu_c12%>><label for="Gu_c12">취사가능</label></li>
				</ul>
			</div>
			<div id="facalty">
				<strong>객실 내 시설</strong>
				<ul>
					<li><input type="checkbox" id="Gu_fac1" value="와이파이"
						name="Gu_facalty" <%=check_Gu_fac1%>><label for="Gu_fac1">와이파이</label></li>
					<li><input type="checkbox" id="Gu_fac2" value="개인콘센트"
						name="Gu_facalty" <%=check_Gu_fac2%>><label for="Gu_fac2">개인콘센트</label></li>
					<li><input type="checkbox" id="Gu_fac3" value="욕실용품"
						name="Gu_facalty" <%=check_Gu_fac3%>><label for="Gu_fac3">욕실용품</label></li>
					<li><input type="checkbox" id="Gu_fac4" value="에어컨"
						name="Gu_facalty" <%=check_Gu_fac4%>><label for="Gu_fac4">에어컨</label></li>
					<li><input type="checkbox" id="Gu_fac5" value="냉장고"
						name="Gu_facalty" <%=check_Gu_fac5%>><label for="Gu_fac5">냉장고</label></li>
					<li><input type="checkbox" id="Gu_fac6" value="객싦샤워실"
						name="Gu_facalty" <%=check_Gu_fac6%>><label for="Gu_fac6">객싦샤워실</label></li>
					<li><input type="checkbox" id="Gu_fac7" value="욕조"
						name="Gu_facalty" <%=check_Gu_fac7%>><label for="Gu_fac7">욕조</label></li>
					<li><input type="checkbox" id="Gu_fac8" value="드라이기"
						name="Gu_facalty" <%=check_Gu_fac8%>><label for="Gu_fac8">드라이기</label></li>
					<li><input type="checkbox" id="Gu_fac9" value="다리미"
						name="Gu_facalty" <%=check_Gu_fac9%>><label for="Gu_fac9">다리미</label></li>
					<li><input type="checkbox" id="Gu_fac10" value="TV"
						name="Gu_facalty" <%=check_Gu_fac10%>><label for="Gu_fac10">TV</label></li>


				</ul>
			</div>
			<div id="extra">
				<strong>기타</strong>
				<ul>
					<li><input type="checkbox" id="Gu_ex1" value="조식포함"
						name="Gu_extra" <%=check_Gu_ex1%>><label for="Gu_ex1">조식포함</label></li>
					<li><input type="checkbox" id="Gu_ex2" value="개인사물함"
						name="Gu_extra" <%=check_Gu_ex2%>><label for="Gu_ex2">개인사물함</label></li>
					<li><input type="checkbox" id="Gu_ex3" value="객실내흡연"
						name="Gu_extra" <%=check_Gu_ex3%>><label for="Gu_ex3">객실내흡연</label></li>
					<li><input type="checkbox" id="Gu_ex4" value="반려견동반"
						name="Gu_extra" <%=check_Gu_ex4%>><label for="Gu_ex4">반려견동반</label></li>
					<li><input type="checkbox" id="Gu_ex5" value="짐보관기능"
						name="Gu_extra" <%=check_Gu_ex5%>><label for="Gu_ex5">짐보관기능</label></li>
					<li><input type="checkbox" id="Gu_ex6" value="프린터사용"
						name="Gu_extra" <%=check_Gu_ex6%>><label for="Gu_ex6">프린터사용</label></li>
					<li><input type="checkbox" id="Gu_ex7" value="무료주차"
						name="Gu_extra" <%=check_Gu_ex7%>><label for="Gu_ex7">무료주차</label></li>
					<li><input type="checkbox" id="Gu_ex8" value="카드결제"
						name="Gu_extra" <%=check_Gu_ex8%>><label for="Gu_ex8">카드결제</label></li>
				</ul>
			</div>
		</div>
	</div>
	<div id="Gu_filter_wrap">
		<div class="top_sort">
			<div class="btn_wrap width_3">
				<input type="radio" id="recom" value="recom" name="sort"
					<%=check_recom%>> <label for="recom">추천순</label> <input
					type="radio" id="distance" value="distance" name="sort"
					<%=check_distance%>> <label for="distance">거리
					순</label> <input type="radio" id="lowprice" value="lowprice"
					name="sort" <%=check_lowprice%>> <label
					for="lowprice">낮은 가격 순</label> <input type="radio"
					id="highprice" value="highprice" name="sort"
					<%=check_highprice%>> <label for="highprice">높은
					가격 순</label>
			</div>
		</div>
		<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

	</div>
</form>
<%
	for (MotelSearchDTO md : lodgments) {
	%>
	<div id="guestHouseLists" style="background: url('/project/lodgmentImage/<%= md.getHostId() %>/lodgment/<%= md.getHostId() %>_1.jpg'); background-size:100%">
		<div id="left">
			<p id="LodgementName_guestHouse"><%=md.getLodgmentName()%></p>

			<p id="LodgementRecommend_guestHouse"></p>
			<p id="LodgementCome_guestHouse"><%=md.getWayToCome()%></p>
		</div>
		<div id="right">
			<p id="LodgemoentStayPrice_guestHouse"><label>대실</label><%=md.getLentPrice()%></p>
			<p id="LodgemoentSleepPrice_guestHouse"><label style="padding-left:0;">숙박</label><%=md.getOneNightPrice()%></p>
		</div>
		<form id="frm" action="../reservation/hotelInfoForm.jsp?datefilter=<%=regervation1%>" method="post">
<!-- 			<div id="guestHouseLists_shadow"></div> -->
			<input type="button" id="hotelinfo_guestHouse" value="" onclick="submit()">
			<input type="hidden" name="LodgementHostName"value="<%=md.getHostId()%>">
			<input type="hidden" name="sd"value="<%=sd1%>">
			<input type="hidden" name="diff"value="<%=diff1%>">
		</form>
	</div>

	<%
	}
	%>