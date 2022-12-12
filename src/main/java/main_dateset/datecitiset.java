package main_dateset;

import java.text.SimpleDateFormat;
import java.util.Calendar;

public class datecitiset {
	public static String dateset() {
		Calendar cal = Calendar.getInstance();
		String format = "MM.dd";
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		String Startday = sdf.format(cal.getTime());
		cal.add(cal.DATE, +1); //날짜를 하루 더한다.
		String Endday = sdf.format(cal.getTime());
	String regervation = Startday + "%C2%A0~%C2%A0" + Endday;	
	return regervation;
	}
	public static String recomndComent() {
		String recommendComent[]= {"Highly Recommend","추천추천합니다","좋아요","요기 추천","이렇게 추천하는 걸!"};
		int i = (int) (Math.random()*5);
		return recommendComent[i];
	}
	public static String subImage(String imagePath) {
		int index = imagePath.indexOf("/lodgmentImage");
		String path = imagePath.substring(index+1);
		return path;
	}

}
