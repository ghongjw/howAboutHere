package pension_pagelist;

import java.text.SimpleDateFormat;
import java.util.Calendar;

public class pension_category {
	public static String cityname(int index) {
		String[] citis = { "경기/인천", "강원", "가평", "경북", "충청", "경남", "전라", "부산", "제주" };

		return citis[index];
	}

	public static String cityChildname(int index, int ChildIndex) {

		switch (index) {
		case 0:
			String[] Childs01 = { "양평/용문", "포천/남양주", "대부도/영흥도/선제도", "강화", "영종도/을왕리/기타도서", "파주/양주/연천", "화성/제부도/안성",
					"용인/여주/이천" };
			return Childs01[ChildIndex];

		case 1:
			String[] Childs02 = { "강릉/경포", "속초/고성", "양양", "춘천(남이섬/)강촌", "홍천/인제/철원/화천", "동해/삼척", "평창/횡성/원주", "정선/영월" };

			return Childs02[ChildIndex];
		case 2:
			String[] Childs03 = { "남이섬/가평읍", "아침고요수목원/상면", "청평/설악/쁘띠프랑스", "자라섬/북면" };
			return Childs03[ChildIndex];
		case 3:
			String[] Childs04 = { "경주", "포항", "영덕/울진/울릉도", "문경/상주/안동/영주", "청도/성주/경산" };
			return Childs04[ChildIndex];
		case 4:
			String[] Childs05 = { "태안/만리포/청포대", "꽃지/안면도", "대천/보령", "단양/충주/제천/괴산", "서산/예산/아산/서천", "공주/청주/보은" };
			return Childs05[ChildIndex];
		case 5:
			String[] Childs06 = { "거제", "통영/고성", "남해/사천", "산청/하동/합천/거창", "밀양/양산/김해/창원", "울산" };
			return Childs06[ChildIndex];
		case 6:
			String[] Childs07 = { "여수", "변산반도/부안", "순천/광양/구례/담양", "전주/무주", "영광/목포/고흥" };

			return Childs07[ChildIndex];
		case 7:
			String[] Childs08 = { "해운대/광안리/송정", "기장", "강서/진구/서구" };
			return Childs08[ChildIndex];
		case 8:
			String[] Childs09 = { "제주/애월", "함덕/월정/구좌/하도", "협재/한림", "서귀포/성산/표선", "중문/산방산/모솔포" };
			return Childs09[ChildIndex];

		default:
			return "양평/용문";
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
		String url = "pension_recommend.jsp?cityName=" + city + "&cityChild=" + cityC;
		return url;
	}
}
