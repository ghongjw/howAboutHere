<%@page import="java.util.List"%>
<%@page import="motel_pageList.motel_category"%>
<%@page import="Lodgement.MotelSearchDTO"%>
<%@page import="Lodgement.MotelSearchDAO"%>
<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
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
<link rel="stylesheet" href="../css/motel_search.css" />
<script src="./datePicker.js"></script>
<%@page import="java.util.Locale"%>
<%@page import="java.util.concurrent.TimeUnit"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<!--  데이트 피커 jsql -->
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel="stylesheet" href="../css/filter.css" />
<meta charset="UTF-8">
<%
String regervation = request.getParameter("datefilter");
String Startday = "";
String Endday = "";
String Bday = "";

//getParameter
String city1 = request.getParameter("cityName");
String cityChild1 = request.getParameter("cityChild");
String min_price = request.getParameter("min_price");
String max_price = request.getParameter("max_price");

String motel_reservation1[] = request.getParameterValues("motel_reservation");
String motel_theme1[] = request.getParameterValues("motel_theme");
String motel_spa1[] = request.getParameterValues("motel_spa");
String motel_play1[] = request.getParameterValues("motel_play");
String motel_benefit1[] = request.getParameterValues("motel_benefit");
String diff1 = request.getParameter("diff");
String sd = request.getParameter("sd");
String sort = request.getParameter("sort");

//몇박인지 초기값설정
if (sd == null || sd.isEmpty()) {
	sd = ".1박";
}
if (diff1 == null || diff1.isEmpty()) {
	diff1 = "1";
}

//가격필터 값이 없을때 초기화하기
if (min_price == null || min_price.isEmpty()) {
	min_price = "10000";
}
if (max_price == null || max_price.isEmpty()) {
	max_price = "300000";
}

//필터 값 가져온후 초기값으로체크하기
String check_timeRoom = "";
String check_sleepRoom = "";
String check_discount = "";

String check_t1 = "";
String check_t2 = "";
String check_t3 = "";
String check_t4 = "";
String check_t5 = "";
String check_t6 = "";
String check_t7 = "";
String check_t8 = "";
String check_t9 = "";
String check_t10 = "";

String check_s1 = "";
String check_s2 = "";
String check_s3 = "";
String check_s4 = "";
String check_s5 = "";
String check_s6 = "";
String check_s7 = "";

String check_p1 = "";
String check_p2 = "";
String check_p3 = "";
String check_p4 = "";
String check_p5 = "";
String check_p6 = "";
String check_p7 = "";
String check_p8 = "";
String check_p9 = "";

String check_b1 = "";
String check_b2 = "";
String check_b3 = "";

String check_distance = "";
String check_lowprice = "";
String check_highprice = "";

if (sort != null) {
	if (sort.equals("distance")) {
		check_distance = "checked";
	}
	if (sort.equals("lowprice")) {
		check_lowprice = "checked";
	}
	if (sort.equals("highprice")) {
		check_highprice = "checked";

	}
} else {
	check_distance = "checked";
}

if (motel_reservation1 != null) {
	for (String m : motel_reservation1) {

		if (m.equals("대실예약")) {
	check_timeRoom = "checked";
		}
		if (m.equals("숙박예약")) {
	check_sleepRoom = "checked";
		}
		if (m.equals("할인")) {
	check_discount = "checked";
		}
	}
}
if (motel_theme1 != null) {
	for (String m : motel_theme1) {
		if (m.equals("무인텔")) {
	check_t1 = "checked";
		}
		if (m.equals("파티룸")) {
	check_t2 = "checked";
		}
		if (m.equals("거울룸")) {
	check_t3 = "checked";
		}
		if (m.equals("복층룸")) {
	check_t4 = "checked";
		}
		if (m.equals("공주룸")) {
	check_t5 = "checked";
		}
		if (m.equals("트윈베드")) {
	check_t6 = "checked";
		}
		if (m.equals("야외테라스")) {
	check_t7 = "checked";
		}
		if (m.equals("바다뷰")) {
	check_t8 = "checked";
		}
		if (m.equals("호수뷰")) {
	check_t9 = "checked";
		}
		if (m.equals("하늘뷰")) {
	check_t10 = "checked";
		}
	}
}
if (motel_spa1 != null) {
	for (String m : motel_spa1) {

		if (m.equals("스파/월풀")) {
	check_s1 = "checked";
		}
		if (m.equals("사우나/찜질방")) {
	check_s2 = "checked";
		}
		if (m.equals("맛사지베드")) {
	check_s3 = "checked";
		}
		if (m.equals("히노끼탕")) {
	check_s4 = "checked";
		}
		if (m.equals("노천탕")) {
	check_s5 = "checked";
		}
		if (m.equals("반신욕")) {
	check_s6 = "checked";
		}
		if (m.equals("욕실TV")) {
	check_s7 = "checked";
		}
	}
}
if (motel_play1 != null) {
	for (String m : motel_play1) {
		if (m.equals("수영장")) {
	check_p1 = "checked";
		}
		if (m.equals("노래방")) {
	check_p2 = "checked";
		}
		if (m.equals("당구대")) {
	check_p3 = "checked";
		}
		if (m.equals("게임기")) {
	check_p4 = "checked";
		}
		if (m.equals("안마의자")) {
	check_p5 = "checked";
		}
		if (m.equals("커플PC")) {
	check_p6 = "checked";
		}
		if (m.equals("미니바")) {
	check_p7 = "checked";
		}
		if (m.equals("3DTV")) {
	check_p8 = "checked";
		}
		if (m.equals("빔프로젝터")) {
	check_p9 = "checked";
		}
	}
}
if (motel_benefit1 != null) {
	for (String m : motel_benefit1) {
		if (m.equals("예약취소가능")) {
	check_b1 = "checked";
		}
		if (m.equals("예약특가")) {
	check_b2 = "checked";
		}
		if (m.equals("좋은숙박")) {
	check_b3 = "checked";
		}

	}
}
///////////////////////검증/////////////////////////////////////////////

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

String reurl = "/project/motel_search/motel_recommend.jsp?cityName=" + city1 + "&cityChild=" + cityChild1;

if (regervation == null || regervation.equals("")) {
	Calendar cal = Calendar.getInstance();
	String format = "MM.dd";
	SimpleDateFormat sdf = new SimpleDateFormat(format);
	Startday = sdf.format(cal.getTime());
	cal.add(cal.DATE, +1); //날짜를 하루 더한다.
	Endday = sdf.format(cal.getTime());
	regervation = Startday + " ~ " + Endday;
}

String cityChildNameF = motel_category.cityChildname(intCity1, intCityChild1);
String[] locations = null;

MotelSearchDAO motelDao = new MotelSearchDAO();
List<MotelSearchDTO> motelRecommends = null;

if (cityChild1 != null) {
	locations = motel_category.cityChildname(Integer.parseInt(city1), Integer.parseInt(cityChild1)).split("/");
	motelRecommends = motelDao.list_child(locations);
} else if (city1 != null) {
	motelRecommends = motelDao.list(city1);
}

motelDao.disconnection();

int intdiff = 1;
try {
	intdiff = Integer.parseInt(diff1);
} catch (Exception e) {

}

if (intdiff > 7) {
%>
<script>
	alert("예약가능한 날짜는 7박입니다.");
	history.back();
</script>
<%
}

%>


<div id="filter_wrap">
	<form action="<%=reurl%>" method="get">
		<div id="date_box">
			<h3>날짜</h3>
			<div id="Revday_box">
				<button disabled></button>
				<input type="text" id="regervation" name="datefilter"
					value="<%=regervation%>" readonly> <input type="text"
					id="displayregervation" name="sd" value=<%=sd%> readonly> <input
					type="hidden" name="cityName" value="<%=city1%>" readonly>
				<input type="hidden" name="cityChild" value="<%=cityChild1%>"
					readonly> <input type="hidden" id="diff" name="diff"
					value="<%=diff1%>" readonly>

				<%@include file="/motel_search/Datepicker.jsp"%>
			</div>
			<div id="detail_box">
				<h3>상세조건</h3>
				<input type="button" onclick="all_reset()" value="초기화"> <input
					type="submit" value="적용">
			</div>

			<div id="reserve">
				<ul>
					<li><input type="checkbox" id="timeRoom"
						name="motel_reservation" <%=check_timeRoom%> value="대실예약"><label
						for="timeRoom">대실 예약</label></li>
					<li><input type="checkbox" id="sleepRoom"
						name="motel_reservation" <%=check_sleepRoom%> value="숙박예약"><label
						for="sleepRoom">숙박 예약</label></li>
					<li><input type="checkbox" id="discount"
						name="motel_reservation" <%=check_discount%> value="할인"><label
						for="discount">50% 할인</label></li>
				</ul>
			</div>

			<div id="theme">

				<strong>이색테마</strong>
				<ul>
					<li><input type="checkbox" id="t1" value="무인텔"
						name="motel_theme" <%=check_t1%>><label for="t1">무인텔</label></li>
					<li><input type="checkbox" id="t2" value="파티룸"
						name="motel_theme" <%=check_t2%>><label for="t2">파티룸</label></li>
					<li><input type="checkbox" id="t3" value="거울룸"
						name="motel_theme" <%=check_t3%>><label for="t3">거울룸</label></li>
					<li><input type="checkbox" id="t4" value="복층룸"
						name="motel_theme" <%=check_t4%>><label for="t4">복층룸</label></li>
					<li><input type="checkbox" id="t5" value="공주룸"
						name="motel_theme" <%=check_t5%>><label for="t5">공주룸</label></li>
					<li><input type="checkbox" id="t6" value="트윈베드"
						name="motel_theme" <%=check_t6%>><label for="t6">트윈베드</label></li>
					<li><input type="checkbox" id="t7" value="야외테라스"
						name="motel_theme" <%=check_t7%>><label for="t7">야외테라스</label></li>
					<li><input type="checkbox" id="t8" value="바다뷰"
						name="motel_theme" <%=check_t8%>><label for="t8">바다뷰</label></li>
					<li><input type="checkbox" id="t9" value="호수뷰"
						name="motel_theme" <%=check_t9%>><label for="t9">호수뷰</label></li>
					<li><input type="checkbox" id="t10" value="하늘뷰"
						name="motel_theme" <%=check_t10%>><label for="t10">하늘뷰</label></li>
				</ul>
			</div>
			<div id="spa">
				<strong>스파시설</strong>
				<ul>
					<li><input type="checkbox" id="s1" value="스파/월풀"
						name="motel_spa" <%=check_s1%>><label for="s1">스파/월풀</label></li>
					<li><input type="checkbox" id="s2" value="사우나/찜질방"
						name="motel_spa" <%=check_s2%>><label for="s2">사우나/찜질방</label></li>
					<li><input type="checkbox" id="s3" value="맛사지베드"
						name="motel_spa" <%=check_s3%>><label for="s3">맛사지베드</label></li>
					<li><input type="checkbox" id="s4" value="히노끼탕"
						name="motel_spa" <%=check_s4%>><label for="s4">히노끼탕</label></li>
					<li><input type="checkbox" id="s5" value="노천탕"
						name="motel_spa" <%=check_s5%>><label for="s5">노천탕</label></li>
					<li><input type="checkbox" id="s6" value="반신욕"
						name="motel_spa" <%=check_s6%>><label for="s6">반신욕</label></li>
					<li><input type="checkbox" id="s7" value="욕실TV"
						name="motel_spa" <%=check_s7%>><label for="s7">욕실TV</label></li>
				</ul>
			</div>
			<div id="play">
				<strong>놀이시설</strong>
				<ul>
					<li><input type="checkbox" id="p1" value="수영장"
						name="motel_play" <%=check_p1%>><label for="p1">수영장</label></li>
					<li><input type="checkbox" id="p2" value="노래방"
						name="motel_play" <%=check_p2%>><label for="p2">노래방</label></li>
					<li><input type="checkbox" id="p3" value="당구대"
						name="motel_play" <%=check_p3%>><label for="p3">당구대</label></li>
					<li><input type="checkbox" id="p4" value="게임기"
						name="motel_play" <%=check_p4%>><label for="p4">게임기</label></li>
					<li><input type="checkbox" id="p5" value="안마의자"
						name="motel_play" <%=check_p5%>><label for="p5">안마의자</label></li>
					<li><input type="checkbox" id="p6" value="커플PC"
						name="motel_play" <%=check_p6%>><label for="p6">커플PC</label></li>
					<li><input type="checkbox" id="p7" value="미니바"
						name="motel_play" <%=check_p7%>><label for="p7">미니바</label></li>
					<li><input type="checkbox" id="p8" value="3DTV"
						name="motel_play" <%=check_p8%>><label for="p8">3DTV</label></li>
					<li><input type="checkbox" id="p9" value="빔프로젝터"
						name="motel_play" <%=check_p9%>><label for="p9">빔프로젝터</label></li>
				</ul>
			</div>
			<div id="benefit">
				<strong>혜택</strong>
				<ul>
					<li><input type="checkbox" id="b1" value="예약취소가능"
						name="motel_benefit" <%=check_b1%>><label for="b1">+
							예약취소가능</label></li>
					<li><input type="checkbox" id="b2" value="예약특가"
						name="motel_benefit" <%=check_b2%>><label for="b2">+
							예약특가</label></li>
					<li><input type="checkbox" id="b3" value="좋은숙박"
						name="motel_benefit" <%=check_b3%>><label for="b3">+
							좋은숙박</label></li>
				</ul>
			</div>
			<div id="price">
				<strong>가격</strong> <span><label for="amount"></label><input
					type="text" id="amount" class="price_val" readonly> <input
					type="hidden" id="min_price" name="min_price"
					value="<%=min_price%>"> <input type="hidden" id="max_price"
					name="max_price" value="<%=max_price%>"></span>
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

				<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
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
											min : xReturnNumber($("#slider")
													.data('min')) * 10000,
											max : xReturnNumber($("#slider")
													.data('max')) * 10000,
											step : 10000,
											values : [ min_price, max_price ],
											slide : function(event, ui) {
												if ((ui.values[0] + 10000) >= ui.values[1]) {
													return false;
												}

												$("#min_price").val(
														ui.values[0]);
												$("#max_price").val(
														ui.values[1]);

												min_title = xReturnNumber(ui.values[0]) / 10000;
												max_title = xReturnNumber(ui.values[1]) / 10000;

												amount_title = min_title
														+ '만원 이상';

												if (max_title < xReturnNumber($(
														"#slider").data('max'))) {
													amount_title = min_title
															+ '만원 ~ '
															+ max_title + '만원';
												}

												$("#amount").val(amount_title);
											}
										});

						if (max_title < xReturnNumber($("#slider").data('max'))) {
							amount_title = min_title + '만원 ~ ' + max_title
									+ '만원';
						}

						$("#amount").val(amount_title);
					});
				</script>
				<label class="minwon">1만원</label><label class="maxwon">30만원</label>
			</div>
		</div>
</div>
<div id="motel_filter_wrap">
	<div class="top_sort">
		<div class="btn_wrap width_3">
			<input type="radio" id="distance" value="distance" name="sort"
				<%=check_distance%>> <label for="distance">거리 순</label> <input
				type="radio" id="lowprice" value="lowprice" name="sort"
				<%=check_lowprice%>> <label for="lowprice">낮은 가격 순</label> <input
				type="radio" id="highprice" value="highprice" name="sort"
				<%=check_highprice%>> <label for="highprice">높은 가격 순</label>
		</div>

	</div>
	<div id="wrap_commertial">
		<span>지역추천</span><input type="button" id="cf" value="광고"
			onclick="cf_pop()">
		<div id="cfPopup" style="display: none">
			<span>지역추천 상품 광고입니다.</span>

		</div>
	</div>
	</form>

	<%
	for (MotelSearchDTO md : motelRecommends) {
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
		<form id="frm" action="../reservation/hotelInfoForm.jsp?datefilter=<%=regervation%>" method="post">
			<div id="motelLists_shadow"></div>
			<input type="button" id="hotelinfo" value="" onclick="submit()">
			<input type="hidden" name="LodgementHostName"value="<%=md.getHostId()%>">
			<input type="hidden" name="sd"value="<%=sd%>">
			<input type="hidden" name="diff"value="<%=diff1%>">
		</form>
	</div>

	<%
	}
	%>
</div>