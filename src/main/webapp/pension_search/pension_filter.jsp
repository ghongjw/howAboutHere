<%@page import="pension_pagelist.pension_category"%>
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

String pension_reservation1[] = request.getParameterValues("pension_reservation");
String pension_type1[] = request.getParameterValues("pension_type");
String pension_common1[] = request.getParameterValues("pension_common");
String pension_facalty1[] = request.getParameterValues("pension_facalty");
String pension_extra1[] = request.getParameterValues("pension_extra");
String sd1 = request.getParameter("sd");
String diff1 = request.getParameter("diff");
String sort1 = request.getParameter("sort");

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


// DB다녀와
LodgmentLookupDAO lodgmentDao = new LodgmentLookupDAO();
ArrayList<MotelSearchDTO> lodgments = null;

String[] locations = null;
if (cityChild1 != null) {
	locations = pension_category.cityChildname(Integer.parseInt(city1), Integer.parseInt(cityChild1)).split("/");
	lodgments = lodgmentDao.showLodgment_4(locations);
} else if (city1 != null) {
	lodgments = lodgmentDao.showLodgment_3(city1);
}

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

String check_Pen_available = "";
String check_Pen_type1 = "";
String check_Pen_type2 = "";
String check_Pen_type3 = "";

String check_Pen_c1 = "";
String check_Pen_c2 = "";
String check_Pen_c3 = "";
String check_Pen_c4 = "";
String check_Pen_c5 = "";
String check_Pen_c6 = "";
String check_Pen_c7 = "";
String check_Pen_c8 = "";
String check_Pen_c9 = "";
String check_Pen_c10 = "";
String check_Pen_c11 = "";
String check_Pen_c12 = "";
String check_Pen_c13 = "";
String check_Pen_c14 = "";
String check_Pen_c15 = "";
String check_Pen_c16 = "";
String check_Pen_c17 = "";
String check_Pen_c18 = "";
String check_Pen_c19 = "";
String check_Pen_c20 = "";
String check_Pen_c21 = "";
String check_Pen_c22 = "";
String check_Pen_c23 = "";
String check_Pen_c24 = "";

String check_Pen_fac1 = "";
String check_Pen_fac2 = "";
String check_Pen_fac3 = "";
String check_Pen_fac4 = "";
String check_Pen_fac5 = "";
String check_Pen_fac6 = "";
String check_Pen_fac7 = "";
String check_Pen_fac8 = "";
String check_Pen_fac9 = "";
String check_Pen_fac10 = "";
String check_Pen_fac11 = "";
String check_Pen_fac12 = "";
String check_Pen_fac13 = "";

String check_Pen_ex1 = "";
String check_Pen_ex2 = "";
String check_Pen_ex3 = "";
String check_Pen_ex4 = "";
String check_Pen_ex5 = "";
String check_Pen_ex6 = "";
String check_Pen_ex7 = "";
String check_Pen_ex8 = "";
String check_Pen_ex9 = "";
String check_Pen_ex10 = "";
String check_Pen_ex11 = "";
String check_Pen_ex12 = "";
String check_Pen_ex13 = "";
String check_Pen_ex14 = "";

String check_recom = "";
String check_distance = "";
String check_lowprice = "";
String check_highprice = "";

if (pension_reservation1 != null) {
	for (String h : pension_reservation1) {
		if (h.equals("예약가능")) {
	check_Pen_available = "checked";
		}
	}
}
if (pension_type1 != null) {
	for (String h : pension_type1) {
		if (h.equals("펜션")) {
	check_Pen_type1 = "checked";
		}
		if (h.equals("풀빌라")) {
	check_Pen_type2 = "checked";
		}
		if (h.equals("럭셔리")) {
	check_Pen_type3 = "checked";
		}
	}
}
if (pension_common1 != null) {
	for (String h : pension_common1) {
		if (h.equals("수영장")) {
	check_Pen_c1 = "checked";
		}
		if (h.equals("BBQ")) {
	check_Pen_c2 = "checked";
		}
		if (h.equals("족구장")) {
	check_Pen_c3 = "checked";
		}
		if (h.equals("세미나실")) {
	check_Pen_c4 = "checked";
		}
		if (h.equals("노래방")) {
	check_Pen_c5 = "checked";
		}
		if (h.equals("공용스파")) {
	check_Pen_c6 = "checked";
		}
		if (h.equals("라운지")) {
	check_Pen_c7 = "checked";
		}
		if (h.equals("공용pc")) {
	check_Pen_c8 = "checked";
		}
		if (h.equals("카페")) {
	check_Pen_c9 = "checked";
		}
		if (h.equals("피트니스")) {
	check_Pen_c10 = "checked";
		}
		if (h.equals("사우나")) {
	check_Pen_c11 = "checked";
		}
		if (h.equals("골프장")) {
	check_Pen_c12 = "checked";
		}
		if (h.equals("레스토랑")) {
	check_Pen_c13 = "checked";
		}
		if (h.equals("편의점")) {
	check_Pen_c14 = "checked";
		}
		if (h.equals("주방식당")) {
	check_Pen_c15 = "checked";
		}
		if (h.equals("놀이방")) {
	check_Pen_c16 = "checked";
		}
		if (h.equals("세탁기")) {
	check_Pen_c17 = "checked";
		}
		if (h.equals("건조기")) {
	check_Pen_c18 = "checked";
		}
		if (h.equals("탈수기")) {
	check_Pen_c19 = "checked";
		}
		if (h.equals("주차장")) {
	check_Pen_c20 = "checked";
		}
		if (h.equals("취사기능")) {
	check_Pen_c21 = "checked";
		}
		if (h.equals("스키장")) {
	check_Pen_c22 = "checked";
		}
		if (h.equals("전자레인지")) {
	check_Pen_c23 = "checked";
		}
		if (h.equals("엘레베이터")) {
	check_Pen_c24 = "checked";
		}
	}
}
if (pension_facalty1 != null) {
	for (String h : pension_facalty1) {
		if (h.equals("와이파이")) {
	check_Pen_fac1 = "checked";
		}
		if (h.equals("객실스파")) {
	check_Pen_fac2 = "checked";
		}
		if (h.equals("전기밥솥")) {
	check_Pen_fac3 = "checked";
		}
		if (h.equals("TV")) {
	check_Pen_fac4 = "checked";
		}
		if (h.equals("욕실용품")) {
	check_Pen_fac5 = "checked";
		}
		if (h.equals("세면도구")) {
	check_Pen_fac6 = "checked";
		}
		if (h.equals("미니바")) {
	check_Pen_fac7 = "checked";
		}
		if (h.equals("에어컨")) {
	check_Pen_fac8 = "checked";
		}
		if (h.equals("냉장고")) {
	check_Pen_fac9 = "checked";
		}
		if (h.equals("객실샤워실")) {
	check_Pen_fac10 = "checked";
		}
		if (h.equals("욕조")) {
	check_Pen_fac11 = "checked";
		}
		if (h.equals("드라이기")) {
	check_Pen_fac12 = "checked";
		}
		if (h.equals("다리미")) {
	check_Pen_fac13 = "checked";
		}
	}
}
if (pension_extra1 != null) {
	for (String h : pension_extra1) {
		if (h.equals("픽업가능")) {
	check_Pen_ex1 = "checked";
		}
		if (h.equals("객실내취사")) {
	check_Pen_ex2 = "checked";
		}
		if (h.equals("프린터사용")) {
	check_Pen_ex3 = "checked";
		}
		if (h.equals("짐보관가능")) {
	check_Pen_ex4 = "checked";
		}
		if (h.equals("개인사물함")) {
	check_Pen_ex5 = "checked";
		}
		if (h.equals("무료주차")) {
	check_Pen_ex6 = "checked";
		}
		if (h.equals("조식포함")) {
	check_Pen_ex7 = "checked";
		}
		if (h.equals("객실내흡연")) {
	check_Pen_ex8 = "checked";
		}
		if (h.equals("발렛파킹")) {
	check_Pen_ex9 = "checked";
		}
		if (h.equals("금연")) {
	check_Pen_ex10 = "checked";
		}
		if (h.equals("반려견동반")) {
	check_Pen_ex11 = "checked";
		}
		if (h.equals("카드결제")) {
	check_Pen_ex12 = "checked";
		}
		if (h.equals("캠프파이어")) {
	check_Pen_ex13 = "checked";
		}
		if (h.equals("장애인 편의시설")) {
	check_Pen_ex14 = "checked";
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



String reurl = "../pension_search/pension_recommend.jsp?cityName=" + city1 + "&cityChild=" + cityChild1;
%>
<script>
	$(function() {
		$(document).ready(function() {
			<% for (int cnt = 0; cnt < lodgments.size(); cnt++) {%>
				$(".pension").css("background-image", 'url("/project/lodgmentImage/<%= lodgments.get(cnt).getHostId() %>/lodgment/<%= lodgments.get(cnt).getHostId() %>_1.jpg")');
			<%
			}%>
		});
	});
</script>
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
			<input type="button" id="reset" onclick="all_reset_pf()" value="초기화">
			<input type="submit" value="적용">

			<div id="reserve">
				<ul>
					<li><input type="checkbox" id="Pen_available"
						name="pension_filter" <%=check_Pen_available%>
						value="예약가능"><label for="Pen_available">예약가능</label></li>
				</ul>
			</div>

			<div id="type">

				<strong>펜션 유형</strong>
				<ul>
					<li><input type="checkbox" id="Pen_type1" value="펜션"
						name="pension_filter" <%=check_Pen_type1%>><label
						for="Pen_type1">펜션</label></li>
					<li><input type="checkbox" id="Pen_type2" value="풀빌라"
						name="pension_filter" <%=check_Pen_type2%>><label
						for="Pen_type2">풀빌라</label></li>
					<li><input type="checkbox" id="Pen_type3" value="럭셔리"
						name="pension_filter" <%=check_Pen_type3%>><label
						for="Pen_type3">럭셔리</label></li>

				</ul>
			</div>

			<div id="persons">
				<strong>인원</strong> <input type='button' id="pm"
					onclick='count("plus")' value='+' />
				<span id='result' name="persons"><%=persons1%></span>
				<input type='button' onclick='count("minus")' id="pm" value='-' />
				<input type=hidden id='resultid' name="persons" value="<%=persons1%>">
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
					<li><input type="checkbox" id="Pen_c1" value="수영장"
						name="pension_filter" <%=check_Pen_c1%>><label
						for="Pen_c1">수영장</label></li>
					<li><input type="checkbox" id="Pen_c2" value="BBQ"
						name="pension_filter" <%=check_Pen_c2%>><label
						for="Pen_c2">BBQ</label></li>
					<li><input type="checkbox" id="Pen_c3" value=족구장"
						name="pension_filter"> <%=check_Pen_c3%>><label
						for="Pen_c3">족구장</label></li>
					<li><input type="checkbox" id="Pen_c4" value="세미나실"
						name="pension_filter" <%=check_Pen_c4%>><label
						for="Pen_c4">세미나실</label></li>
					<li><input type="checkbox" id="Pen_c5" value="노래방"
						name="pension_filter" <%=check_Pen_c5%>><label
						for="Pen_c5">노래방</label></li>
					<li><input type="checkbox" id="Pen_c6" value="공용스파"
						name="pension_filter" <%=check_Pen_c6%>><label
						for="Pen_c6">공용스파</label></li>
					<li><input type="checkbox" id="Pen_c7" value="라운지"
						name="pension_filter" <%=check_Pen_c7%>><label
						for="Pen_c7">라운지</label></li>
					<li><input type="checkbox" id="Pen_c8" value="공용PC"
						name="pension_filter" <%=check_Pen_c8%>><label
						for="Pen_c8">공용PC</label></li>
					<li><input type="checkbox" id="Pen_c9" value="카페"
						name="pension_filter" <%=check_Pen_c9%>><label
						for="Pen_c9">카페</label></li>
					<li><input type="checkbox" id="Pen_c10" value="피트니스"
						name="pension_filter" <%=check_Pen_c10%>><label
						for="Pen_c10">피트니스</label></li>
					<li><input type="checkbox" id="Pen_c11" value="사우나"
						name="pension_filter" <%=check_Pen_c11%>><label
						for="Pen_c11">사우나</label></li>
					<li><input type="checkbox" id="Pen_c12" value="골프장"
						name="pension_filter" <%=check_Pen_c12%>><label
						for="Pen_c12">골프장</label></li>
					<li><input type="checkbox" id="Pen_c13" value="레스토랑"
						name="pension_filter" <%=check_Pen_c13%>><label
						for="Pen_c13">레스토랑</label></li>
					<li><input type="checkbox" id="Pen_c14" value="편의점"
						name="pension_filter" <%=check_Pen_c14%>><label
						for="Pen_c14">편의점</label></li>
					<li><input type="checkbox" id="Pen_c15" value="주방/식당"
						name="pension_filter" <%=check_Pen_c15%>><label
						for="Pen_c15">주방/식당</label></li>
					<li><input type="checkbox" id="Pen_c16" value="놀이방"
						name="pension_filter" <%=check_Pen_c16%>><label
						for="Pen_c16">놀이방</label></li>
					<li><input type="checkbox" id="Pen_c17" value="세탁기"
						name="pension_filter" <%=check_Pen_c17%>><label
						for="Pen_c17">세탁기</label></li>
					<li><input type="checkbox" id="Pen_c18" value="건조기"
						name="pension_filter" <%=check_Pen_c18%>><label
						for="Pen_c18">건조기</label></li>
					<li><input type="checkbox" id="Pen_c19" value="탈수기"
						name="pension_filter" <%=check_Pen_c19%>><label
						for="Pen_c19">탈수기</label></li>
					<li><input type="checkbox" id="Pen_c20" value="주차장"
						name="pension_filter" <%=check_Pen_c20%>><label
						for="Pen_c20">주차장</label></li>
					<li><input type="checkbox" id="Pen_c21" value="취사가능"
						name="pension_filter" <%=check_Pen_c21%>><label
						for="Pen_c21">취사가능</label></li>
					<li><input type="checkbox" id="Pen_c22" value="스키장"
						name="pension_filter" <%=check_Pen_c22%>><label
						for="Pen_c22">스키장</label></li>
					<li><input type="checkbox" id="Pen_c23" value="전자레인지"
						name="pension_filter" <%=check_Pen_c23%>><label
						for="Pen_c23">전자레인지</label></li>
					<li><input type="checkbox" id="Pen_c24" value="엘레베이터"
						name="pension_filter" <%=check_Pen_c24%>><label
						for="Pen_c24">엘레베이터</label></li>

				</ul>
			</div>
			<div id="facalty">
				<strong>객실 내 시설</strong>
				<ul>
					<li><input type="checkbox" id="Pen_fac1" value="와이파이"
						name="pension_filter" <%=check_Pen_fac1%>><label
						for="Pen_fac1">와이파이</label></li>
					<li><input type="checkbox" id="Pen_fac2" value="객실스파"
						name="pension_filter" <%=check_Pen_fac2%>><label
						for="Pen_fac2">객실스파</label></li>
					<li><input type="checkbox" id="Pen_fac3" value="전기밥솥"
						name="pension_filter" <%=check_Pen_fac3%>><label
						for="Pen_fac3">전기밥솥</label></li>
					<li><input type="checkbox" id="Pen_fac4" value="TV"
						name="pension_filter" <%=check_Pen_fac4%>><label
						for="Pen_fac4">TV</label></li>
					<li><input type="checkbox" id="Pen_fac5" value="욕실용품"
						name="pension_filter" <%=check_Pen_fac5%>><label
						for="Pen_fac5">욕실용품</label></li>
					<li><input type="checkbox" id="Pen_fac6" value="세면도구"
						name="pension_filter" <%=check_Pen_fac6%>><label
						for="Pen_fac6">세면도구</label></li>
					<li><input type="checkbox" id="Pen_fac7" value="미니바"
						name="pension_filter" <%=check_Pen_fac7%>><label
						for="Pen_fac7">미니바</label></li>
					<li><input type="checkbox" id="Pen_fac8" value="에어컨"
						name="pension_filter" <%=check_Pen_fac8%>><label
						for="Pen_fac8">에어컨</label></li>
					<li><input type="checkbox" id="Pen_fac9" value="냉장고"
						name="pension_filter" <%=check_Pen_fac9%>><label
						for="Pen_fac9">냉장고</label></li>
					<li><input type="checkbox" id="Pen_fac10" value="객실샤워실"
						name="pension_filter" <%=check_Pen_fac10%>><label
						for="Pen_fac10">객실샤워실</label></li>
					<li><input type="checkbox" id="Pen_fac11" value="욕조"
						name="pension_filter" <%=check_Pen_fac11%>><label
						for="Pen_fac11">욕조</label></li>
					<li><input type="checkbox" id="Pen_fac12" value="드라이기"
						name="pension_filter" <%=check_Pen_fac12%>><label
						for="Pen_fac12">드라이기</label></li>
					<li><input type="checkbox" id="Pen_fac13" value="다리미"
						name="pension_filter" <%=check_Pen_fac13%>><label
						for="Pen_fac13">다리미</label></li>

				</ul>
			</div>
			<div id="extra">
				<strong>기타</strong>
				<ul>
					<li><input type="checkbox" id="Pen_ex1" value="픽업가능"
						name="pension_filter" <%=check_Pen_ex1%>><label
						for="Pen_ex1">픽업가능</label></li>
					<li><input type="checkbox" id="Pen_ex2" value="객실내취사"
						name="pension_filter" <%=check_Pen_ex2%>><label
						for="Pen_ex2">객실내취사</label></li>
					<li><input type="checkbox" id="Pen_ex3" value="프린터사용"
						name="pension_filter" <%=check_Pen_ex3%>><label
						for="Pen_ex3">프린터사용</label></li>
					<li><input type="checkbox" id="Pen_ex4" value="짐보관가능"
						name="pension_filter" <%=check_Pen_ex4%>><label
						for="Pen_ex4">짐보관가능</label></li>
					<li><input type="checkbox" id="Pen_ex5" value="개인사물함"
						name="pension_filter" <%=check_Pen_ex5%>><label
						for="Pen_ex5">개인사물함</label></li>
					<li><input type="checkbox" id="Pen_ex6" value="무료주차"
						name="pension_filter" <%=check_Pen_ex6%>><label
						for="Pen_ex6">무료주차</label></li>
					<li><input type="checkbox" id="Pen_ex7" value="조식포함"
						name="pension_filter" <%=check_Pen_ex7%>><label
						for="Pen_ex7">조식포함</label></li>
					<li><input type="checkbox" id="Pen_ex8" value="객실내흡연"
						name="pension_filter" <%=check_Pen_ex8%>><label
						for="Pen_ex8">객실내흡연</label></li>
					<li><input type="checkbox" id="Pen_ex9" value="발렛파킹"
						name="pension_filter" <%=check_Pen_ex9%>><label
						for="Pen_ex9">발렛파킹</label></li>
					<li><input type="checkbox" id="Pen_ex10" value="금연"
						name="pension_filter" <%=check_Pen_ex10%>><label
						for="Pen_ex10">금연</label></li>
					<li><input type="checkbox" id="Pen_ex11" value="반려견동반"
						name="pension_filter" <%=check_Pen_ex11%>><label
						for="Pen_ex11">반려견동반</label></li>
					<li><input type="checkbox" id="Pen_ex12" value="카드결제"
						name="pension_filter" <%=check_Pen_ex12%>><label
						for="Pen_ex12">카드결제</label></li>
					<li><input type="checkbox" id="Pen_ex13" value="캠프파이어"
						name="pension_filter" <%=check_Pen_ex13%>><label
						for="Pen_ex13">캠프파이어</label></li>
					<li><input type="checkbox" id="Pen_ex14" value="장애인편의시설"
						name="pension_filter" <%=check_Pen_ex14%>><label
						for="Pen_ex14">장애인편의시설</label></li>
				</ul>
			</div>
		</div>
	</div>
	<div id="pension_filter_wrap">
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
			</div> <br>
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
