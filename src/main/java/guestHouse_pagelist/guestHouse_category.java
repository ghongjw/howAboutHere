package guestHouse_pagelist;

import java.text.SimpleDateFormat;
import java.util.Calendar;

public class guestHouse_category {
	public static String cityname(int index) {
		String[] citis = { "서울", "경기/인천", "강원", "부산", "경상", "전라", "충청/대전", "제주" };

		return citis[index];
	}

	public static String cityChildname(int index, int ChildIndex) {

		switch (index) {
		case 0:
			String[] Childs01 = { "홍대/신촌/마포", "북촌/인사동/종로/동대문", "명동/남산/중구", "강남/잠실/삼성/서초", "이태원/서울역/용산", "영등포/신림/김포공항" };
			return Childs01[ChildIndex];

		case 1:
			String[] Childs02 = { "경기", "인천", "인천공항/중구" };

			return Childs02[ChildIndex];
		case 2:
			String[] Childs03 = { "강릉/동해/삼척", "속초/양양/고성", "춘천/영월" };
			return Childs03[ChildIndex];
		case 3:
			String[] Childs04 = { "해운대/기장", "남포동/자갈치/송도/감천마을", "부산역/서면", "광안리" };
			return Childs04[ChildIndex];
		case 4:
			String[] Childs05 = { "경주", "대구", "안동/포항", "통영", "거제/남해/울산" };
			return Childs05[ChildIndex];
		case 5:
			String[] Childs06 = { "전주/한옥마을", "군산/남원/익산", "여수", "순천/목포/함평", "광주"

			};
			return Childs06[ChildIndex];
		case 6:
			String[] Childs07 = { "충청", "대전" };

			return Childs07[ChildIndex];
		case 7:
			String[] Childs08 = { "제주공항", "애월/협재", "조천/함덕", "구좌/월정", "조천/함덕", "구좌/월정", "성산/우도", "남원/표선", "서귀포/중문",
					"대정/안덕" };
			return Childs08[ChildIndex];

		default:
			return "홍대/신촌/마포";
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
		String url = "guestHouse_recommend.jsp?cityName=" + city + "&cityChild=" + cityC;
		return url;
	}
}
