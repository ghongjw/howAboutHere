<%@page import="camping_pagelist.camping_category"%>
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

String camping_reservation1[] = request.getParameterValues("camping_reservation");
String camping_type1[] = request.getParameterValues("camping_type");
String camping_common1[] = request.getParameterValues("camping_common");
String camping_facalty1[] = request.getParameterValues("camping_facalty");
String camping_extra1[] = request.getParameterValues("camping_extra");
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
String[] locations = camping_category.cityname(Integer.parseInt(city1)).split("/");
LodgmentLookupDAO lodgmentDao = new LodgmentLookupDAO();
ArrayList<MotelSearchDTO> lodgments = lodgmentDao.showLodgment_7(locations);
System.out.print(lodgments);


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

String check_Cam_available = "";

String check_Cam_type1 = "";
String check_Cam_type2 = "";
String check_Cam_type3 = "";

String check_Cam_c1 = "";
String check_Cam_c2 = "";
String check_Cam_c3 = "";
String check_Cam_c4 = "";
String check_Cam_c5 = "";
String check_Cam_c6 = "";
String check_Cam_c7 = "";
String check_Cam_c8 = "";
String check_Cam_c9 = "";
String check_Cam_c10 = "";
String check_Cam_c11 = "";
String check_Cam_c12 = "";
String check_Cam_c13 = "";
String check_Cam_c14 = "";
String check_Cam_c15 = "";
String check_Cam_c16 = "";
String check_Cam_c17 = "";
String check_Cam_c18 = "";
String check_Cam_c19 = "";
String check_Cam_c20 = "";

String check_Cam_fac1 = "";
String check_Cam_fac2 = "";
String check_Cam_fac3 = "";
String check_Cam_fac4 = "";
String check_Cam_fac5 = "";
String check_Cam_fac6 = "";
String check_Cam_fac7 = "";
String check_Cam_fac8 = "";
String check_Cam_fac9 = "";
String check_Cam_fac10 = "";
String check_Cam_fac11 = "";
String check_Cam_fac12 = "";
String check_Cam_fac13 = "";

String check_Cam_ex1 = "";
String check_Cam_ex2 = "";
String check_Cam_ex3 = "";
String check_Cam_ex4 = "";
String check_Cam_ex5 = "";
String check_Cam_ex6 = "";
String check_Cam_ex7 = "";
String check_Cam_ex8 = "";
String check_Cam_ex9 = "";
String check_Cam_ex10 = "";
String check_Cam_ex11 = "";

String check_recom = "";
String check_distance = "";
String check_lowprice = "";
String check_highprice = "";

if (camping_reservation1 != null) {
	for (String h : camping_reservation1) {
		if (h.equals("이용가능")) {
	check_Cam_available = "checked";
		}
	}
}
if (camping_type1 != null) {
	for (String h : camping_type1) {
		if (h.equals("오토캠핑")) {
	check_Cam_type1 = "checked";
		}
		if (h.equals("글램핑")) {
	check_Cam_type2 = "checked";
		}
		if (h.equals("카라반")) {
	check_Cam_type3 = "checked";
		}
	}
}
if (camping_common1 != null) {
	for (String h : camping_common1) {
		if (h.equals("전기사용가능")) {
	check_Cam_c1 = "checked";
		}
		if (h.equals("BBQ")) {
	check_Cam_c2 = "checked";
		}
		if (h.equals("개수대")) {
	check_Cam_c3 = "checked";
		}
		if (h.equals("공용샤워실")) {
	check_Cam_c4 = "checked";
		}
		if (h.equals("인터넷")) {
	check_Cam_c5 = "checked";
		}
		if (h.equals("매점")) {
	check_Cam_c6 = "checked";
		}
		if (h.equals("공용화장실")) {
	check_Cam_c7 = "checked";
		}
		if (h.equals("물놀이시설")) {
	check_Cam_c8 = "checked";
		}
		if (h.equals("카페")) {
	check_Cam_c9 = "checked";
		}
		if (h.equals("편의점")) {
	check_Cam_c10 = "checked";
		}
		if (h.equals("노래방")) {
	check_Cam_c11 = "checked";
		}
		if (h.equals("주방/식당")) {
	check_Cam_c12 = "checked";
		}
		if (h.equals("세탁기")) {
	check_Cam_c13 = "checked";
		}
		if (h.equals("건조기")) {
	check_Cam_c14 = "checked";
		}
		if (h.equals("탈수기")) {
	check_Cam_c15 = "checked";
		}
		if (h.equals("공용PC")) {
	check_Cam_c16 = "checked";
		}
		if (h.equals("주차장")) {
	check_Cam_c17 = "checked";
		}
		if (h.equals("라운지")) {
	check_Cam_c18 = "checked";
		}
		if (h.equals("전자레인지")) {
	check_Cam_c19 = "checked";
		}
		if (h.equals("취사기능")) {
	check_Cam_c20 = "checked";
		}
	}
}
if (camping_facalty1 != null) {
	for (String h : camping_facalty1) {

		if (h.equals("객실내샤워실")) {
	check_Cam_fac1 = "checked";
		}
		if (h.equals("드라이기")) {
	check_Cam_fac2 = "checked";
		}
		if (h.equals("와이파이")) {
	check_Cam_fac3 = "checked";
		}
		if (h.equals("TV")) {
	check_Cam_fac4 = "checked";
		}
		if (h.equals("욕실용품")) {
	check_Cam_fac5 = "checked";
		}
		if (h.equals("미니바")) {
	check_Cam_fac6 = "checked";
		}
		if (h.equals("에어컨")) {
	check_Cam_fac7 = "checked";
		}
		if (h.equals("냉장고")) {
	check_Cam_fac8 = "checked";
		}
		if (h.equals("욕조")) {
	check_Cam_fac9 = "checked";
		}
		if (h.equals("다리미")) {
	check_Cam_fac10 = "checked";
		}
		if (h.equals("전기밥솥")) {
	check_Cam_fac11 = "checked";
		}
		if (h.equals("객실스파")) {
	check_Cam_fac12 = "checked";
		}
		if (h.equals("세면도구")) {
	check_Cam_fac13 = "checked";
		}
	}
}if (camping_extra1 != null) {
	for (String h : camping_extra1) {
		if (h.equals("장비대여")) {
	check_Cam_ex1 = "checked";
		}
		if (h.equals("사이트주차")) {
	check_Cam_ex2 = "checked";
		}
		if (h.equals("카드결제")) {
	check_Cam_ex3 = "checked";
		}
		if (h.equals("조식포함")) {
	check_Cam_ex4 = "checked";
		}
		if (h.equals("객실내흡연")) {
	check_Cam_ex5 = "checked";
		}
		if (h.equals("발렛파킹")) {
	check_Cam_ex6 = "checked";
		}
		if (h.equals("반려견동반")) {
	check_Cam_ex7 = "checked";
		}
		if (h.equals("객실내취사")) {
	check_Cam_ex8 = "checked";
		}
		if (h.equals("픽업가능")) {
	check_Cam_ex9 = "checked";
		}
		if (h.equals("캠프파이어")) {
	check_Cam_ex10 = "checked";
		}
		if (h.equals("금연")) {
	check_Cam_ex11 = "checked";
		}

	}
}

if (sort1 != null) {
	if (sort1.equals("recom")) {
		check_recom = "checked";
	}
	if (sort1.equals("distance")) {
		check_distance = "checked";
	}
	if (sort1.equals("lowprice")) {
		check_lowprice = "checked";
	}
	if (sort1.equals("highprice")) {
		check_highprice = "checked";
	}
} else {
	check_recom = "checked";
}
int intCity1 = 0;

//지역 시티명과 시티자식들이 없을 경우 초기값설정
if (city1 == null || city1.isEmpty()) {
	intCity1 = 0;
} else
	intCity1 = Integer.parseInt(city1);

String reurl = "../camping_search/camping_recommend.jsp?cityName=" + city1;
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
			<input type="button" id="reset" onclick="all_reset_cf()" value="초기화">
			<input type="submit" value="적용">

			<div id="reserve">
				<ul>
					<li><input type="checkbox" id="Cam_available"
						name="camping_reservation" <%=check_Cam_available%>
						value="예약가능"><label for="Cam_available">예약
							가능</label></li>
				</ul>
			</div>

			<div id="type">

				<strong>캠핑 유형</strong>
				<ul>
					<li><input type="checkbox" id="Cam_type1" value="오토캠핑"
						name="camping_type" <%=check_Cam_type1%>><label
						for="Cam_type1">오토캠핑</label></li>
					<li><input type="checkbox" id="Cam_type2" value="글램핑"
						name="camping_type" <%=check_Cam_type2%>><label
						for="Cam_type2">글램핑</label></li>
					<li><input type="checkbox" id="Cam_type3" value="카라반"
						name="camping_type" <%=check_Cam_type3%>><label
						for="Cam_type3">카라반</label></li>

				</ul>
			</div>

			<div id="persons">
				<strong>인원</strong> <input type='button' id="pm"
					onclick='count("plus")' value='+' /> <span id='result'><%=persons1%></span>
				<input type='button' onclick='count("minus")' id="pm" value='-' />
				<input type=hidden id='resultid' name="persons"
					value="<%=persons1%>">
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


			<div id="common">
				<strong>공용시설</strong>
				<ul>
					<li><input type="checkbox" id="Cam_c1" value="전기사용가능"
						name="camping_common" <%=check_Cam_c1%>><label
						for="Cam_c1">전기사용가능</label></li>
					<li><input type="checkbox" id="Cam_c2" value="BBQ"
						name="camping_common" <%=check_Cam_c2%>><label
						for="Cam_c2">BBQ</label></li>
					<li><input type="checkbox" id="Cam_c3" value="개수대"
						name="camping_common" <%=check_Cam_c3%>><label
						for="Cam_c3">개수대</label></li>
					<li><input type="checkbox" id="Cam_c4" value="공용샤워실"
						name="camping_common" <%=check_Cam_c4%>><label
						for="Cam_c4">공용샤워실</label></li>
					<li><input type="checkbox" id="Cam_c5" value="인터넷"
						name="camping_common" <%=check_Cam_c5%>><label
						for="Cam_c5">인터넷</label></li>
					<li><input type="checkbox" id="Cam_c6" value="매점"
						name="camping_common" <%=check_Cam_c6%>><label
						for="Cam_c6">매점</label></li>
					<li><input type="checkbox" id="Cam_c7" value="공용화장실"
						name="camping_common" <%=check_Cam_c7%>><label
						for="Cam_c7">공용화장실</label></li>
					<li><input type="checkbox" id="Cam_c8" value="물놀이시설"
						name="camping_common" <%=check_Cam_c8%>><label
						for="Cam_c8">물놀이시설</label></li>
					<li><input type="checkbox" id="Cam_c9" value="카페"
						name="camping_common" <%=check_Cam_c9%>><label
						for="Cam_c9">카페</label></li>
					<li><input type="checkbox" id="Cam_c10" value="편의점"
						name="camping_common" <%=check_Cam_c10%>><label
						for="Cam_c10">편의점</label></li>
					<li><input type="checkbox" id="Cam_c11" value="노래방"
						name="camping_common" <%=check_Cam_c11%>><label
						for="Cam_c11">노래방</label></li>
					<li><input type="checkbox" id="Cam_c12" value="주방/식당"
						name="camping_common" <%=check_Cam_c12%>><label
						for="Cam_c12">주방/식당</label></li>
					<li><input type="checkbox" id="Cam_c13" value="세탁기"
						name="camping_common" <%=check_Cam_c13%>><label
						for="Cam_c13">세탁기</label></li>
					<li><input type="checkbox" id="Cam_c14" value="건조기"
						name="camping_common" <%=check_Cam_c14%>><label
						for="Cam_c14">건조기</label></li>
					<li><input type="checkbox" id="Cam_c15" value="건조기"
						name="camping_common" <%=check_Cam_c15%>><label
						for="Cam_c15">건조기</label></li>
					<li><input type="checkbox" id="Cam_c16" value="공용PC"
						name="camping_common" <%=check_Cam_c16%>><label
						for="Cam_c16">공용PC</label></li>
					<li><input type="checkbox" id="Cam_c17" value="주차장"
						name="camping_common" <%=check_Cam_c17%>><label
						for="Cam_c17">주차장</label></li>
					<li><input type="checkbox" id="Cam_c18" value="라운지"
						name="camping_common" <%=check_Cam_c18%>><label
						for="Cam_c18">라운지</label></li>
					<li><input type="checkbox" id="Cam_c19" value="전자레인지"
						name="camping_common" <%=check_Cam_c19%>><label
						for="Cam_c19">전자레인지 </label></li>
					<li><input type="checkbox" id="Cam_c20" value="취사기능"
						name="camping_common" <%=check_Cam_c20%>><label
						for="Cam_c20">취사기능</label></li>


				</ul>
			</div>
			<div id="facalty">
				<strong>객실 내 시설</strong>
				<ul>
					<li><input type="checkbox" id="Cam_fac1" value="객실내샤워실"
						name="camping_facalty" <%=check_Cam_fac1%>><label
						for="Cam_fac1">객실내샤워실</label></li>
					<li><input type="checkbox" id="Cam_fac2" value="드라이기"
						name="camping_facalty" <%=check_Cam_fac2%>><label
						for="Cam_fac2">드라이기</label></li>
					<li><input type="checkbox" id="Cam_fac3" value="와이파이"
						name="camping_facalty" <%=check_Cam_fac3%>><label
						for="Cam_fac3">와이파이</label></li>
					<li><input type="checkbox" id="Cam_fac4" value="TV"
						name="camping_facalty" <%=check_Cam_fac4%>><label
						for="Cam_fac4">TV</label></li>
					<li><input type="checkbox" id="Cam_fac5" value="욕실용품"
						name="camping_facalty" <%=check_Cam_fac5%>><label
						for="Cam_fac5">욕실용품</label></li>
					<li><input type="checkbox" id="Cam_fac6" value="미니바"
						name="camping_facalty" <%=check_Cam_fac6%>><label
						for="Cam_fac6">미니바</label></li>
					<li><input type="checkbox" id="Cam_fac7" value="에어컨"
						name="camping_facalty" <%=check_Cam_fac7%>><label
						for="Cam_fac7">에어컨</label></li>
					<li><input type="checkbox" id="Cam_fac8" value="냉장고"
						name="camping_facalty" <%=check_Cam_fac8%>><label
						for="Cam_fac8">냉장고</label></li>
					<li><input type="checkbox" id="Cam_fac9" value="욕조"
						name="camping_facalty" <%=check_Cam_fac9%>><label
						for="Cam_fac9">욕조</label></li>
					<li><input type="checkbox" id="Cam_fac10" value="다리미"
						name="camping_facalty" <%=check_Cam_fac10%>><label
						for="Cam_fac10">다리미</label></li>
					<li><input type="checkbox" id="Cam_fac11" value="전기밥솥"
						name="camping_facalty" <%=check_Cam_fac11%>><label
						for="Cam_fac11">전기밥솥</label></li>
					<li><input type="checkbox" id="Cam_fac12" value="객실스파"
						name="camping_facalty" <%=check_Cam_fac12%>><label
						for="Cam_fac12">객실스파</label></li>
					<li><input type="checkbox" id="Cam_fac13" value="세면도구"
						name="camping_facalty" <%=check_Cam_fac13%>><label
						for="Cam_fac13">세면도구</label></li>

				</ul>
			</div>
			<div id="extra">
				<strong>기타</strong>
				<ul>
					<li><input type="checkbox" id="Cam_ex1" value="장비대여"
						name="camping_extra" <%=check_Cam_ex1%>><label
						for="Cam_ex1">장비대여</label></li>
					<li><input type="checkbox" id="Cam_ex2" value="사이트주차"
						name="camping_extra" <%=check_Cam_ex2%>><label
						for="Cam_ex2">사이트주차</label></li>
					<li><input type="checkbox" id="Cam_ex3" value="카드결제"
						name="camping_extra" <%=check_Cam_ex3%>><label
						for="Cam_ex3">카드결제</label></li>
					<li><input type="checkbox" id="Cam_ex4" value="조식포함"
						name="camping_extra" <%=check_Cam_ex4%>><label
						for="Cam_ex4">조식포함</label></li>
					<li><input type="checkbox" id="Cam_ex5" value="객실내흠연"
						name="camping_extra" <%=check_Cam_ex5%>><label
						for="Cam_ex5">객실내흠연</label></li>
					<li><input type="checkbox" id="Cam_ex6" value="발렛파킹"
						name="camping_extra" <%=check_Cam_ex6%>><label
						for="Cam_ex6">발렛파킹</label></li>
					<li><input type="checkbox" id="Cam_ex7" value="반려견동반"
						name="camping_extra" <%=check_Cam_ex7%>><label
						for="Cam_ex7">반려견동반</label></li>
					<li><input type="checkbox" id="Cam_ex8" value="객실내취사"
						name="camping_extra" <%=check_Cam_ex8%>><label
						for="Cam_ex8">객실내취사</label></li>
					<li><input type="checkbox" id="Cam_ex9" value="픽업가능"
						name="camping_extra" <%=check_Cam_ex9%>><label
						for="Cam_ex9">픽업가능</label></li>
					<li><input type="checkbox" id="Cam_ex10" value="캠프파이어"
						name="camping_extra" <%=check_Cam_ex10%>><label
						for="Cam_ex10">캠프파이어</label></li>
					<li><input type="checkbox" id="Cam_ex11" value="금연"
						name="camping_extra" <%=check_Cam_ex11%>><label
						for="Cam_ex11">금연</label></li>
				</ul>
			</div>
		</div>
	</div>
	<div id="camping_filter_wrap">
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
	<div id="motelLists" style="background: url('/project/lodgmentImage/<%= md.getHostId() %>/lodgment/<%= md.getHostId() %>_1.jpg'); background-size:100%">
		<div id="left">
			<p id="LodgementName"><%=md.getLodgmentName()%></p>

			<p id="LodgementRecommend"></p>
			<p id="LodgementCome"><%=md.getWayToCome()%></p>
		</div>
		<div id="right">
			<p id="LodgemoentStayPrice"><label>대실</label><%=md.getLentPrice()%></p>
			<p id="LodgemoentSleepPrice"><label style="padding-left:0;">숙박</label><%=md.getOneNightPrice()%></p>
		</div>
		<form id="frm" action="../reservation/hotelInfoForm.jsp?datefilter=<%=regervation1%>" method="post">
<!-- 			<div id="motelLists_shadow"></div> -->
			<input type="button" id="hotelinfo" value="" onclick="submit()">
			<input type="hidden" name="LodgementHostName"value="<%=md.getHostId()%>">
			<input type="hidden" name="sd"value="<%=sd1%>">
			<input type="hidden" name="diff"value="<%=diff1%>">
		</form>
	</div>

	<%
	}
	%>
