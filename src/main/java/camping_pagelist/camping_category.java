package camping_pagelist;

import java.text.SimpleDateFormat;
import java.util.Calendar;

public class camping_category {
	public static String cityname(int index) {
		String[] citis = { "경기/인천", "충청", "경상/부산", "전라/제주", "강원"};

		return citis[index];
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
