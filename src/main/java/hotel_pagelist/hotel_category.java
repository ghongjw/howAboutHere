package hotel_pagelist;

import java.text.SimpleDateFormat;
import java.util.Calendar;

public class hotel_category {
	public static String cityname(int index) {
		String[] citis = { "서울", "경기", "인천", "강원", "제주", "부산", "경남", "대구", "경북", "울산", "대전", "충남", "충북", "광주", "전남",
				"전북" };

		return citis[index];
	}

	public static String cityChildname(int index, int ChildIndex) {

		switch (index) {
		case 0:
			String[] Childs01 = { "강남/역삼/삼성/신사/청담", "서초/교대", "잠실/송파/왕십리/강동", "을지로/시청/명동", "종로/이낫동/동대문/강북", "서울역/이태원/용산",
					"마포/홍대/신촌/서대문", "영등포/여의도/김포공항", "구로/금천/관악/동작" };
			return Childs01[ChildIndex];

		case 1:
			String[] Childs02 = { "해운대(센텀,송정,달맞이)", "광안리", "부산역/남포/자갈치", "서면/동래/연제/남구", "기장/김해공항/기타(그외지역)",
					"영도/송도해수욕장" };

			return Childs02[ChildIndex];
		case 2:
			String[] Childs03 = { "제주시/제주국제공항", "애월/협재/김녕", "서귀포시", "중문", "성산/표선" };
			return Childs03[ChildIndex];
		case 3:
			String[] Childs04 = { "강릉/동해/삼척", "속초/고성", "양양/홍천/인제/철원", "평창/정선/횡성", "춘천/원주/영월/태백" };
			return Childs04[ChildIndex];
		case 4:
			String[] Childs05 = { "수원/성남/판교", "가평/양평/포천", "용인/평택/여주/이천", "화성/동탄/안산/부천/안양", "고양/의정부/파주/김포", "시흥/군포/광명",
					"남양주시/구리/하남" };
			return Childs05[ChildIndex];
		case 5:
			String[] Childs06 = { "송도/남동구/옹진군", "인천국제공항(중구)", "부평/계양/서구/미추홀구/강화" };
			return Childs06[ChildIndex];
		case 6:
			String[] Childs07 = { "경주", "거제/고성", "포항/청송/영덕/울진", "통영/창녕", "대구/구미/문경", "울산/안동", "창원/양산/김해",
					"사천/남해/진주/하동" };

			return Childs07[ChildIndex];
		case 7:
			String[] Childs08 = { "여수", "진주", "광주", "순천/광양", "군산/익산/부안/진안/무주", "화순/남원/구례", "목포/나주/완도/해남/영암" };
			return Childs08[ChildIndex];
		case 8:
			String[] Childs09 = { "대전", "천안/아산/예산/당진", "보령(대천)/태안(안면도)/서산/부여", "충주/제천/단양", "청주/세종" };
			return Childs09[ChildIndex];

		default:
			return "강남/역삼/삼성/신사/청담";
		}

	}

	public static String urldefine(int a, int b) {
		Calendar cal = Calendar.getInstance();
		String format = "MM.dd";
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		String Startday = sdf.format(cal.getTime());
		cal.add(cal.DATE, +1); // 날짜를 하루 더한다.
		String Endday = sdf.format(cal.getTime());
		String city = Integer.toString(a);
		String cityC = Integer.toString(b);
		String url = "hotel_recommend.jsp?cityName=" + city + "&cityChild=" + cityC;
		return url;
	}
}
