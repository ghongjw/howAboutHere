<%@page import="hotel_pagelist.hotel_category"%>
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
<link rel="stylesheet" href="../css/motel_search.css" />
<script src="../motel_search/datePicker.js"></script>
<script src="../js/search.js"></script>
<%@page import="java.util.Locale"%>
<%@page import="java.util.concurrent.TimeUnit"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<!--  데이트 피커 jsql -->
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel="stylesheet" href="../css/hotel_search.css" />
<meta charset="UTF-8">
<%
String regervation1 = request.getParameter("datefilter");
String Startday1 = "";
String Endday1 = "";
String Bday1 = "";

//getParameter
String city1 = request.getParameter("cityName");
String cityChild1 = request.getParameter("cityChild");
String persons1 = "";
if (request.getParameter("persons") == null) {
	persons1 = "2";
} else {
	persons1 = request.getParameter("persons");
}

LodgmentLookupDAO lodgmentDao = new LodgmentLookupDAO();
ArrayList<MotelSearchDTO> lodgments = null;

String[] locations = null;
if (cityChild1 != null) {
	locations = hotel_category.cityChildname(Integer.parseInt(city1), Integer.parseInt(cityChild1)).split("/");
	lodgments = lodgmentDao.showLodgment_2(locations);
} else if (city1 != null) {
	lodgments = lodgmentDao.showLodgment_1(city1);
}

lodgmentDao.disconnection();

String hotel_reservation1[] = request.getParameterValues("hotel_reservation");
String hotel_type1[] = request.getParameterValues("hotel_type");
String hotel_bed1[] = request.getParameterValues("hotel_bed");
String hotel_common1[] = request.getParameterValues("hotel_common");
String hotel_facalty1[] = request.getParameterValues("hotel_facalty");
String hotel_extra1[] = request.getParameterValues("hotel_extra");
String sd1 = request.getParameter("sd");
String sort1 = request.getParameter("sort");
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

//몇박인지 초기값설정
if (sd1 == null || sd1.isEmpty()) {
	sd1 = ".1박";
}
if (diff1 == null || diff1.isEmpty()) {
	diff1 = "1";
}
System.out.println("sd=" + sd1);

String check_available = "";
String check_promotion = "";

String check_type1 = "";
String check_type2 = "";
String check_type3 = "";

String check_bed1 = "";
String check_bed2 = "";
String check_bed3 = "";
String check_bed4 = "";

String check_c1 = "";
String check_c2 = "";
String check_c3 = "";
String check_c4 = "";
String check_c5 = "";
String check_c6 = "";
String check_c7 = "";
String check_c8 = "";
String check_c9 = "";
String check_c10 = "";
String check_c11 = "";
String check_c12 = "";
String check_c13 = "";
String check_c14 = "";
String check_c15 = "";
String check_c16 = "";
String check_c17 = "";
String check_c18 = "";
String check_c19 = "";
String check_c20 = "";
String check_c21 = "";
String check_c22 = "";
String check_c23 = "";
String check_c24 = "";

String check_fac1 = "";
String check_fac2 = "";
String check_fac3 = "";
String check_fac4 = "";
String check_fac5 = "";
String check_fac6 = "";
String check_fac7 = "";
String check_fac8 = "";
String check_fac9 = "";
String check_fac10 = "";
String check_fac11 = "";
String check_fac12 = "";

String check_ex1 = "";
String check_ex2 = "";
String check_ex3 = "";
String check_ex4 = "";
String check_ex5 = "";
String check_ex6 = "";
String check_ex7 = "";
String check_ex8 = "";
String check_ex9 = "";
String check_ex10 = "";
String check_ex11 = "";
String check_ex12 = "";
String check_ex13 = "";
String check_ex14 = "";

String check_recom = "";
String check_distance = "";
String check_lowprice = "";
String check_highprice = "";

if (hotel_reservation1 != null) {
	for (String h : hotel_reservation1) {
		if (h.equals("예약가능")) {
	check_available = "checked";
		}
		if (h.equals("프로모션")) {
	check_promotion = "checked";
		}
	}
}
if (hotel_type1 != null) {
	for (String h : hotel_type1) {
		if (h.equals("5성급")) {
	check_type1 = "checked";
		}
		if (h.equals("특1급")) {
	check_type2 = "checked";
		}
		if (h.equals("특급")) {
	check_type3 = "checked";
		}
	}
}
if (hotel_bed1 != null) {
	for (String h : hotel_bed1) {
		if (h.equals("싱글")) {
	check_bed1 = "checked";
		}
		if (h.equals("더블")) {
	check_bed2 = "checked";
		}
		if (h.equals("트윈")) {
	check_bed3 = "checked";
		}
		if (h.equals("온돌")) {
	check_bed4 = "checked";
		}
	}
}
if (hotel_common1 != null) {
	for (String h : hotel_common1) {
		if (h.equals("피트니스")) {
	check_c1 = "checked";
		}
		if (h.equals("수영장")) {
	check_c2 = "checked";
		}
		if (h.equals("사우나")) {
	check_c3 = "checked";
		}
		if (h.equals("골프장")) {
	check_c4 = "checked";
		}
		if (h.equals("레스토랑")) {
	check_c5 = "checked";
		}
		if (h.equals("엘레베이터")) {
	check_c6 = "checked";
		}
		if (h.equals("라운지")) {
	check_c7 = "checked";
		}
		if (h.equals("공용PC")) {
	check_c8 = "checked";
		}
		if (h.equals("BBQ")) {
	check_c9 = "checked";
		}
		if (h.equals("카페")) {
	check_c10 = "checked";
		}
		if (h.equals("공용스파")) {
	check_c11 = "checked";
		}
		if (h.equals("족구장")) {
	check_c12 = "checked";
		}
		if (h.equals("세미나실")) {
	check_c13 = "checked";
		}
		if (h.equals("편의점")) {
	check_c14 = "checked";
		}
		if (h.equals("노래방")) {
	check_c15 = "checked";
		}
		if (h.equals("주방/식당")) {
	check_c16 = "checked";
		}
		if (h.equals("세탁기")) {
	check_c17 = "checked";
		}
		if (h.equals("건조기")) {
	check_c18 = "checked";
		}
		if (h.equals("탈수기")) {
	check_c19 = "checked";
		}
		if (h.equals("주차장")) {
	check_c20 = "checked";
		}
		if (h.equals("취사가능")) {
	check_c21 = "checked";
		}
		if (h.equals("공용샤워실")) {
	check_c22 = "checked";
		}
		if (h.equals("온천")) {
	check_c23 = "checked";
		}
		if (h.equals("스키장")) {
	check_c24 = "checked";
		}
	}
}
if (hotel_facalty1 != null) {
	for (String h : hotel_facalty1) {
		if (h.equals("객실스파")) {
	check_fac1 = "checked";
		}
		if (h.equals("미니바")) {
	check_fac2 = "checked";
		}
		if (h.equals("와이파이")) {
	check_fac3 = "checked";
		}
		if (h.equals("욕실용품")) {
	check_fac4 = "checked";
		}
		if (h.equals("TV")) {
	check_fac5 = "checked";
		}
		if (h.equals("에어컨")) {
	check_fac6 = "checked";
		}
		if (h.equals("냉장고")) {
	check_fac7 = "checked";
		}
		if (h.equals("객실샤워실")) {
	check_fac8 = "checked";
		}
		if (h.equals("욕조")) {
	check_fac9 = "checked";
		}
		if (h.equals("드라이기")) {
	check_fac10 = "checked";
		}
		if (h.equals("다리미")) {
	check_fac11 = "checked";
		}
		if (h.equals("전기밥솥")) {
	check_fac12 = "checked";
		}
	}
}
if (hotel_extra1 != null) {
	for (String h : hotel_extra1) {
		if (h.equals("반려견동반")) {
	check_ex1 = "checked";
		}
		if (h.equals("조식포함")) {
	check_ex2 = "checked";
		}
		if (h.equals("객실내흡연")) {
	check_ex3 = "checked";
		}
		if (h.equals("발렛파킹")) {
	check_ex4 = "checked";
		}
		if (h.equals("금연")) {
	check_ex5 = "checked";
		}
		if (h.equals("객실내취사")) {
	check_ex6 = "checked";
		}
		if (h.equals("프린터사용")) {
	check_ex7 = "checked";
		}
		if (h.equals("짐보관가능")) {
	check_ex8 = "checked";
		}
		if (h.equals("개인사물함")) {
	check_ex9 = "checked";
		}
		if (h.equals("무료주차")) {
	check_ex10 = "checked";
		}
		if (h.equals("픽업가능")) {
	check_ex11 = "checked";
		}
		if (h.equals("캠프파이어")) {
	check_ex12 = "checked";
		}
		if (h.equals("카드결제")) {
	check_ex13 = "checked";
		}
		if (h.equals("장애인편의시설")) {
	check_ex14 = "checked";
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

String reurl = "../hotel_search/hotel_recommend.jsp?cityName=" + city1 + "&cityChild=" + cityChild1;
%>
<script>
// 	$(function() {
// 		$(document).ready(function() {
<%-- 			<% for (int cnt = 0; cnt < lodgments.size(); cnt++) {%> --%>
<%-- 				$(".lodgment").css("background-image", 'url("/project/lodgmentImage/<%= lodgments.get(cnt).getHostId() %>/lodgment/<%= lodgments.get(cnt).getHostId() %>_1.jpg")'); --%>
<%-- 			<% --%>
<%--  			}%> --%>
// 		});
// 	});
</script>
<form action="<%=reurl%>" method="get">
	<div id="filter_wrap" style=  "float : left">
		<div id="date_box">
			<h3>날짜</h3>
			<div id="Revday_box">
				<button disabled></button>
				<input type="text" id="regervation" name="datefilter"
					value="<%=regervation1%>" readonly> <input type="text"
					id="displayregervation" name="sd" value=<%=sd1%> readonly>
				<input type="hidden" name="cityName" value="<%=city1%>" readonly>
				<input type="hidden" name="cityChild" value="<%=cityChild1%>"
					readonly> <input type="hidden" id="diff" name="diff"
					value="<%=diff1%>" readonly>

				<%@include file="../motel_search/Datepicker.jsp"%>
			</div>
			<div id="detail_box">
				<h3>상세조건</h3>
				<input type="button" onclick="all_reset_hf()" value="초기화"> <input
					type="submit" value="적용">
			</div>
			<div id="reserve">
				<ul>
					<li><input type="checkbox" id="available"
						name="hotel_reservation" <%=check_available%> value="예약가능"><label
						for="available">예약가능</label></li>
					<li><input type="checkbox" id="promotion"
						name="hotel_reservation" <%=check_promotion%> value="프로모션"><label
						for="promotion">프로모션</label></li>
				</ul>
			</div>

			<div id="type">

				<strong>호텔·리조트 유형</strong>
				<ul>
					<li><input type="checkbox" id="type1" value="5성급"
						name="hotel_type" <%=check_type1%>><label for="type1">5성급</label></li>
					<li><input type="checkbox" id="type2" value="특1급"
						name="hotel_type" <%=check_type2%>><label for="type2">특1급</label></li>
					<li><input type="checkbox" id="type3" value="특급"
						name="hotel_type" <%=check_type3%>><label for="type3">특급</label></li>

				</ul>
			</div>

			<div id="persons">
				<strong>인원</strong> <input type='button' id="pm"
					onclick='count("plus")' value='+' /> <span id='result'
					name="persons"><%=persons1%></span> <input type='button'
					onclick='count("minus")' id="pm" value='-' /> <input type=hidden
					id='resultid' name="persons" value="<%=persons1%>">
			</div>
			<div id="bed_type">
				<strong>베드타입</strong>
				<ul>
					<li><input type="checkbox" id="bed1" value="싱글"
						name="hotel_bed" <%=check_bed1%>><label for="bed1">싱글</label></li>
					<li><input type="checkbox" id="bed2" value="더블"
						name="hotel_bed" <%=check_bed2%>><label for="bed2">더블</label></li>
					<li><input type="checkbox" id="bed3" value="트윈"
						name="hotel_bed" <%=check_bed3%>><label for="bed3">트윈</label></li>
					<li><input type="checkbox" id="bed4" value="온돌"
						name="hotel_bed" <%=check_bed4%>><label for="bed4">온돌</label></li>
				</ul>
			</div>
			<div id="common">
				<strong>공용시설</strong>
				<ul>
					<li><input type="checkbox" id="c1" value="피트니스"
						name="hotel_common" <%=check_c1%>><label for="c1">피트니스</label></li>
					<li><input type="checkbox" id="c2" value="수영장"
						name="hotel_common" <%=check_c2%>><label for="c2">수영장</label></li>
					<li><input type="checkbox" id="c3" value="사우나"
						name="hotel_common" <%=check_c3%>><label for="c3">사우나</label></li>
					<li><input type="checkbox" id="c4" value="골프장"
						name="hotel_common" <%=check_c4%>><label for="c4">골프장</label></li>
					<li><input type="checkbox" id="c5" value="레스토랑"
						name="hotel_common" <%=check_c5%>><label for="c5">레스토랑</label></li>
					<li><input type="checkbox" id="c6" value="엘레베이터"
						name="hotel_common" <%=check_c6%>><label for="c6">엘레베이터</label></li>
					<li><input type="checkbox" id="c7" value="라운지"
						name="hotel_common" <%=check_c7%>><label for="c7">라운지</label></li>
					<li><input type="checkbox" id="c8" value="공용PC"
						name="hotel_common" <%=check_c8%>><label for="c8">공용PC</label></li>
					<li><input type="checkbox" id="c9" value="BBQ"
						name="hotel_common" <%=check_c9%>><label for="c9">BBQ</label></li>
					<li><input type="checkbox" id="c10" value="카페"
						name="hotel_common" <%=check_c10%>><label for="c10">카페</label></li>
					<li><input type="checkbox" id="c11" value="공용스파"
						name="hotel_common" <%=check_c11%>><label for="c11">공용스파</label></li>
					<li><input type="checkbox" id="c12" value="족구장"
						name="hotel_common" <%=check_c12%>><label for="c12">족구장</label></li>
					<li><input type="checkbox" id="c13" value="족구장"
						name="hotel_common" <%=check_c13%>><label for="c13">족구장</label></li>
					<li><input type="checkbox" id="c14" value="편의점"
						name="hotel_common" <%=check_c14%>><label for="c14">편의점</label></li>
					<li><input type="checkbox" id="c15" value="노래방"
						name="hotel_common" <%=check_c15%>><label for="c15">노래방</label></li>
					<li><input type="checkbox" id="c16" value="주방/식당"
						name="hotel_common" <%=check_c16%>><label for="c16">주방/식당</label></li>
					<li><input type="checkbox" id="c17" value="세탁기"
						name="hotel_common" <%=check_c17%>><label for="c17">세탁기</label></li>
					<li><input type="checkbox" id="c18" value="건조기"
						name="hotel_common" <%=check_c18%>><label for="c18">건조기</label></li>
					<li><input type="checkbox" id="c19" value="탈수기"
						name="hotel_common" <%=check_c19%>><label for="c19">탈수기</label></li>
					<li><input type="checkbox" id="c20" value="주차장"
						name="hotel_common" <%=check_c20%>><label for="c20">주차장</label></li>
					<li><input type="checkbox" id="c21" value="취사가능"
						name="hotel_common" <%=check_c21%>><label for="c21">취사가능</label></li>
					<li><input type="checkbox" id="c22" value="공용샤워실"
						name="hotel_common" <%=check_c22%>><label for="c22">공용샤워실</label></li>
					<li><input type="checkbox" id="c23" value="온천"
						name="hotel_common" <%=check_c23%>><label for="c23">온천</label></li>
					<li><input type="checkbox" id="c24" value="스키장"
						name="hotel_common" <%=check_c24%>><label for="c24">스키장</label></li>

				</ul>
			</div>
			<div id="facalty">
				<strong>객실 내 시설</strong>
				<ul>
					<li><input type="checkbox" id="fac1" value="객실스파"
						name="hotel_facalty" <%=check_fac1%>><label for="fac1">객실스파</label></li>
					<li><input type="checkbox" id="fac2" value="미니바"
						name="hotel_facalty" <%=check_fac2%>><label for="fac2">미니바</label></li>
					<li><input type="checkbox" id="fac3" value="와이파이"
						name="hotel_facalty" <%=check_fac3%>><label for="fac3">와이파이</label></li>
					<li><input type="checkbox" id="fac4" value="욕실용품"
						name="hotel_facalty" <%=check_fac4%>><label for="fac4">욕실용품</label></li>
					<li><input type="checkbox" id="fac5" value="TV"
						name="hotel_facalty" <%=check_fac5%>><label for="fac5">TV</label></li>
					<li><input type="checkbox" id="fac6" value="에어컨"
						name="hotel_facalty" <%=check_fac6%>><label for="fac6">에어컨</label></li>
					<li><input type="checkbox" id="fac7" value="냉장고"
						name="hotel_facalty" <%=check_fac7%>><label for="fac7">냉장고</label></li>
					<li><input type="checkbox" id="fac8" value="객실샤워실"
						name="hotel_facalty" <%=check_fac8%>><label for="fac8">객실샤워실</label></li>
					<li><input type="checkbox" id="fac9" value="욕조"
						name="hotel_facalty" <%=check_fac9%>><label for="fac9">욕조</label></li>
					<li><input type="checkbox" id="fac10" value="드라이기"
						name="hotel_facalty" <%=check_fac10%>><label for="fac10">드라이기</label></li>
					<li><input type="checkbox" id="fac11" value="다리미"
						name="hotel_facalty" <%=check_fac11%>><label for="fac11">다리미</label></li>
					<li><input type="checkbox" id="fac12" value="전기밥솥"
						name="hotel_facalty" <%=check_fac12%>><label for="fac12">전기밥솥</label></li>

				</ul>
			</div>
			<div id="extra">
				<strong>기타</strong>
				<ul>
					<li><input type="checkbox" id="ex1" value="반려견동반"
						name="hotel_extra" <%=check_ex1%>><label for="ex1">반려견동반</label></li>
					<li><input type="checkbox" id="ex2" value="조식포함"
						name="hotel_extra" <%=check_ex2%>><label for="ex2">조식포함</label></li>
					<li><input type="checkbox" id="ex3" value="객실내흡연"
						name="hotel_extra" <%=check_ex3%>><label for="ex3">객실내흡연</label></li>
					<li><input type="checkbox" id="ex4" value="발렛파킹"
						name="hotel_extra" <%=check_ex4%>><label for="ex4">발렛파킹</label></li>
					<li><input type="checkbox" id="ex5" value="금연"
						name="hotel_extra" <%=check_ex5%>><label for="ex5">금연</label></li>
					<li><input type="checkbox" id="ex6" value="객실내취사"
						name="hotel_extra" <%=check_ex6%>><label for="ex6">객실내취사</label></li>
					<li><input type="checkbox" id="ex7" value="프린터사용"
						name="hotel_extra" <%=check_ex7%>><label for="ex7">프린터사용</label></li>
					<li><input type="checkbox" id="ex8" value="짐보관가능"
						name="hotel_extra" <%=check_ex8%>><label for="ex8">짐보관가능</label></li>
					<li><input type="checkbox" id="ex9" value="개인사물함"
						name="hotel_extra" <%=check_ex9%>><label for="ex9">개인사물함</label></li>
					<li><input type="checkbox" id="ex10" value="무료주차"
						name="hotel_extra" <%=check_ex10%>><label for="ex10">무료주차</label></li>
					<li><input type="checkbox" id="ex11" value="픽업가능"
						name="hotel_extra" <%=check_ex11%>><label for="ex11">픽업가능</label></li>
					<li><input type="checkbox" id="ex12" value="캠프파이어"
						name="hotel_extra" <%=check_ex12%>><label for="ex12">캠프파이어</label></li>
					<li><input type="checkbox" id="ex13" value="카드결제"
						name="hotel_extra" <%=check_ex13%>><label for="ex13">카드결제</label></li>
					<li><input type="checkbox" id="ex14" value="장애인편의시설"
						name="hotel_extra" <%=check_ex14%>><label for="ex14">장애인편의시설</label></li>

				</ul>
			</div>
			<div id="hotel_filter_wrap">
				<div class="top_sort">
					<div class="btn_wrap width_3">
						<input type="radio" id="recom" value="recom" name="sort"
							<%=check_recom%>> <label for="recom">추천순</label> <input
							type="radio" id="distance" value="distance" name="sort"
							<%=check_distance%>> <label for="distance">거리 순</label> <input
							type="radio" id="lowprice" value="lowprice" name="sort"
							<%=check_lowprice%>> <label for="lowprice">낮은 가격
							순</label> <input type="radio" id="highprice" value="highprice"
							name="sort" <%=check_highprice%>> <label for="highprice">높은
							가격 순</label>
					</div>
					<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

				</div>
				<div id="wrap_commertial">
					<span>인기추천</span><input type="button" id="cf" value="광고"
						onclick="cf_pop()">
					<div id="cfPopup" style="display: none">
						<span>추천 상품 광고입니다.</span>

					</div>

				</div>
			</div>
		</div>
	</div>
	
</form>
<%
	for (MotelSearchDTO md : lodgments) {
		System.out.print("getHostId : " + md.getHostId() + "\n");
	%>
	<div id="hotellists" style="background: url('/project/lodgmentImage/<%= md.getHostId() %>/lodgment/<%= md.getHostId() %>_1.jpg'); background-size:100%">
		<div id="left">
			<p id="LodgementName_hotel"><%=md.getLodgmentName()%></p>

			<p id="LodgementRecommend_hotel"></p>
			<p id="LodgementCome_hotel"><%=md.getWayToCome()%></p>
		</div>
		<div id="right">
			<p id="LodgemoentStayPrice_hotel"><label>대실</label><%=md.getLentPrice()%></p>
			<p id="LodgemoentSleepPrice_hotel"><label style="padding-left:0;">숙박</label><%=md.getOneNightPrice()%></p>
		</div>
		<form id="frm" action="../reservation/hotelInfoForm.jsp?datefilter=<%=regervation1%>" method="post">
<!-- 			<div id="hotelLists_shadow"></div> -->
			<input type="button" id="hotelinfo_hotel" value="" onclick="submit()">
			<input type="hidden" name="LodgementHostName"value="<%=md.getHostId()%>">
			<input type="hidden" name="sd"value="<%=sd1%>">
			<input type="hidden" name="diff"value="<%=diff1%>">
		</form>
	</div>

	<%
	}
	%>
