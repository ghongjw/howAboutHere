package motel_pageList;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

public class motel_category {

	public static String cityname(int index) {
		String[] citis = { "서울", "경기", "인천", "강원", "제주", "부산", "경남", "대구", "경북", "울산", "대전", "충남", "충북", "광주", "전남",
				"전북" };

		return citis[index];
	}

	public static String cityChildname(int index, int ChildIndex) {

		switch (index) {
		case 0:
			String[] Childs01 = { "서울 인기숙소", "강남/역삼/삼성/논현", "서초/신사/방배", "잠실/방이", "잠실새내/신천", "영등포/여의도", "구로/금천/오류/신도림",
					"강서/화곡/까치산역/목동", "천호/길동/둔춘", "서울대/신림/사당/동잘", "종로/대학로", "용산/중구/명동/이태원", "성신여대/성북/월곡", "노원/도봉/창동",
					"강북/수유/미아", "왕십리/성수/금호", "건대/광진/구의", "동대문/장안/청량리/답십리", "중랑/상봉/면목/태릉", "신촌/홍대/서대문/마포", "은펑/연신내/불광" };
			return Childs01[ChildIndex];

		case 1:
			String[] Childs02 = { "경기 인기숙소", "수원/인계", "수원시/권선/영통", "수원역/새류/팔달문/구운/장안", "대부도/제부도", "안성/평택/송탄",
					"오산/화성/동탄", "파주/금촌/헤이리/통일동산", "김포/장기/구례/대명항", "고양/일산", "의정부", "부천", "안양/평촌/인덕원/과천", "군포/금정/산본/의왕",
					"안산", "광명/철산/시흥신천역", "시흥/월곷/정왕/오이도", "용인", "이천/광주/여주", "성남/분당", "구리/하남", "남양주", "가평/양평",
					"양주/동두천/연천/장흥", "포천" };
			return Childs02[ChildIndex];
		case 2:
			String[] Childs03 = { "인천 인기숙소", "부평", "주안", "구월/소래포구", "동암/간석", "을왕리/인천공항", "월미도/차이나타운/신포/동인천", "작전/경인교대",
					"용현/숭의/도화/송림", "송도/연수", "서구/검단", "강화/옹진/백령도" };
			return Childs03[ChildIndex];
		case 3:
			String[] Childs04 = { "강원 인기숙소", "강릉역/교동택지/옥계", "경포대/사턴/주문진", "양양/낙산/하초대/인제", "속초/설악/동명항/고성", "춘천/홍천/철원/화천",
					"원주/횡성", "정동진/동해/삼척", "평창/영월/정선/태백" };
			return Childs04[ChildIndex];
		case 4:
			String[] Childs05 = { "제주 인기숙소", "제주시", "애월/협재", "서귀포/마라도" };
			return Childs05[ChildIndex];
		case 5:
			String[] Childs06 = { "부산인기숙소", "해운대/재송", "송정/기장/청관", "서면/초읍/양정/부산시민공원/범천", "남포동/부산역/송도/영도/범일동",
					"광안리/수영/민락", "경성대/대연/용호/문현", "동래/온천장/부산대/구서/사직", "연산/토곡", "사상(공항경전철)/학장/엄궁", "강서/하단/사하/명지/신호/다대포",
					"덕천/만덕/구포/화명/북구" };
			return Childs06[ChildIndex];
		case 6:
			String[] Childs07 = { "경남 인기숙소", "김해/장유/율하", "양산/밀양", "거제/통영/고성군", "진주", "사천/남해/하동", "창원 상남/용호/중앙",
					"창원 명서/팔용/봉곡/북면", "마산/진해", "거창/함안/창녕/의령" };
			return Childs07[ChildIndex];
		case 7:
			String[] Childs08 = { "대구 인기숙소", "동성로/시청/서문시장", "대구역/경북대/엑스코/칠곡3지구/태전동/금호지구",
					"동대구역/신암/신천/동촌유원지/대구공항/혁신도시/팔공산", "수성구/수성못/범어/알파시티/남구/대명/봉덕/성당못", "두류공원/두류/본리/죽전/감삼", "평리/내당/비산/원대",
					"성서공단/계명대/달성군" };
			return Childs08[ChildIndex];
		case 8:
			String[] Childs09 = { "경북 인기숙소", "경주/보문단지/황리단길/불국사/안강/감포/양남", "구미", "포항남구/시청/시외버스터미널/구룡포/문덕/오천",
					"포항북구/영일대/죽도시장/여객터미널", "울진/울릉도/청송/영덕", "경산/하양/영천/청도", "문경/상주/영주/예천", "안동", "김천/성주/칠곡/의성/군의" };
			return Childs09[ChildIndex];
		case 9:
			String[] Childs10 = { "울산 인기숙소", "동구/북구/울주군/일산/정자/진하/영남알프스", "남구/중구/삼산/성남/무거/신정" };
			return Childs10[ChildIndex];
		case 10:
			String[] Childs11 = { "대전 인기숙소", "유성 봉명/도안/장대", "중구 은행/대흥/선화/유쳔", "동구 용천/복합터미널", "대덕구 신탄진/중리",
					"서구둔산/용문/월평" };
			return Childs11[ChildIndex];
		case 11:
			String[] Childs12 = { "충남 인기숙소", "천안서북구", "천안동남구", "계릉/금산/논산", "공주/동학사", "아산", "태안/안면도", "서산", "당진",
					"서천/부여", "대천/보령", "예산/청양/홍성", "새종" };
			return Childs12[ChildIndex];
		case 12:
			String[] Childs13 = { "충북 인기숙소", "청주 홍덕구/서원구", "청주 상당구/청원구", "진천/음성", "제천/단양", "충주/수안보", "중평/과산/영동/보은/옥천" };
			return Childs13[ChildIndex];
		case 13:
			String[] Childs14 = { "광주 인기숙소", "북구/챔피언스필드/광주역/전남대학교", "서구/유스쾌어터미널/상무지구", "동구/남구/국립아시아문화전당/충장로",
					"광산구 하남/송정역", "광산구 첨단지구" };
			return Childs14[ChildIndex];
		case 14:
			String[] Childs15 = { "전남 인기숙소", "여수", "순천", "광양", "목포/무안/영암", "나주/담양/곡성/구례/영광/장성/함평",
					"화순/보성/해남/완도/강진/고흥/진도" };
			return Childs15[ChildIndex];
		case 15:
			String[] Childs16 = { "전북 인기숙소", "전주 덕진구", "전구완산구/완주", "군산/비응도", "남원/임실/순창/무주/진안/장수", "익산/익산터미널/익산역",
					"김제/부안/고창/정읍" };
			return Childs16[ChildIndex];

		default:
			return "서울 인기숙소";
		}
	}
	public static String urldefine(int a,int b) {
		Calendar cal = Calendar.getInstance();
		String format = "MM.dd";
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		String Startday = sdf.format(cal.getTime());
		cal.add(cal.DATE, +1); //날짜를 하루 더한다.
		String Endday = sdf.format(cal.getTime());
		String city= Integer.toString(a);
		String cityC= Integer.toString(b);
		String url="motel_recommend.jsp?cityName="+city+"&cityChild="+cityC;
		return url;
	}

}
