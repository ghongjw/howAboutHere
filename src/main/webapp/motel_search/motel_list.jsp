<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="motel_pageList.motel_category"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String url="motel_recommend.jsp?cityName=";

String regervation = request.getParameter("datefilter");
String min_price = request.getParameter("min_price");
String max_price = request.getParameter("max_price");
String sd = request.getParameter("sd");
String diff = request.getParameter("diff");
String motel_reservation[] = request.getParameterValues("motel_reservation");
String motel_theme[] = request.getParameterValues("motel_theme");
String motel_spa[] = request.getParameterValues("motel_spa");
String motel_play[] = request.getParameterValues("motel_play");
String motel_benefit[] = request.getParameterValues("motel_benefit");
String sort = request.getParameter("sort");

String check = "";
if(motel_reservation!=null){
	for(String m :motel_reservation){
	check =check + "&motel_reservation="+m;
	}
}
if(motel_theme!=null){
	for(String m :motel_theme){
	check =check + "&motel_theme="+m;
	}
}
if(motel_spa!=null){
	for(String m :motel_spa){
	check =check + "&motel_spa="+m;
	}
}
if(motel_play!=null){
	for(String m :motel_play){
	check =check + "&motel_play="+m;
	}
}
if(motel_benefit!=null){
	for(String m :motel_benefit){
	check =check + "&motel_benefit="+m;
	}
}
if (sort!= null) {
	if (sort.equals("distance")) {
		check =check + "&sort=distance";
	}
	if (sort.equals("lowprice")) {
		check =check + "&sort=lowprice";
	}
	if (sort.equals("highprice")) {
		check =check + "&sort=highprice";
	}
}
if (regervation == null || regervation.equals("")) {
	Calendar cal = Calendar.getInstance();
	String format = "MM.dd";
	SimpleDateFormat sdf = new SimpleDateFormat(format);
	String Startday = sdf.format(cal.getTime());
	cal.add(cal.DATE, +1); //날짜를 하루 더한다.
	String Endday = sdf.format(cal.getTime());
	regervation = Startday + "%C2%A0~%C2%A0" + Endday;
}


if (sd == null || sd.isEmpty()) {
	sd = ".1박";
}
if (diff == null || diff.isEmpty()) {
	diff = "1";
}
String filtering = "&datefilter=" + regervation + "&sd=" + sd+ "&diff=" + diff + check + "&min_price=" + min_price + "&max_price="
		+ max_price;
%>



<div class="area_list" id="area_list" onclick="listhold()"  >
	<div class="fix_title"></div>
	<ul class="city">
		<li id="city1" onmouseover="city1()"><a href="<%=url%>0">서울</a></li>
		<li id="city2" onmouseover="city2()"><a href="<%=url%>1">경기</a></li>
		<li id="city3" onmouseover="city3()"><a href="<%=url%>2">인천</a></li>
		<li id="city4" onmouseover="city4()"><a href="<%=url%>3">강원</a></li>
		<li id="city5" onmouseover="city5()"><a href="<%=url%>4">제주</a></li>
		<li id="city6" onmouseover="city6()"><a href="<%=url%>5">부산</a></li>
		<li id="city7" onmouseover="city7()"><a href="<%=url%>6">경남</a></li>
		<li id="city8" onmouseover="city8()"><a href="<%=url%>7">대구</a></li>
		<li id="city9" onmouseover="city9()"><a href="<%=url%>8">경북</a></li>
		<li id="city10" onmouseover="city10()"><a href="<%=url%>9">울산</a></li>
		<li id="city11" onmouseover="city11()"><a href="<%=url%>10">대전</a></li>
		<li id="city12" onmouseover="city12()"><a href="<%=url%>11">충남</a></li>
		<li id="city13" onmouseover="city13()"><a href="<%=url%>12">충북</a></li>
		<li id="city14" onmouseover="city14()"><a href="<%=url%>13">광주</a></li>
		<li id="city15" onmouseover="city15()"><a href="<%=url%>14">전남</a></li>
		<li id="city16" onmouseover="city16()"><a href="<%=url%>15">전북</a></li>
	</ul>

	<div class="isscroll_02">

		<ul class="city_child" id="city_child1">
			<li><a href="<%=motel_category.urldefine(0,0)%><%=filtering%>">서울 인기숙소<span>HOT</span></a></li>
			<li><a href="<%=motel_category.urldefine(0,1)%><%=filtering%>">강남/역삼/삼성/논현</a></li>
			<li><a href="<%=motel_category.urldefine(0,2)%><%=filtering%>">서초/신사/방배</a></li>
			<li><a href="<%=motel_category.urldefine(0,3)%><%=filtering%>">잠실/방이</a></li>
			<li><a href="<%=motel_category.urldefine(0,4)%><%=filtering%>">잠실새내/신천</a></li>
			<li><a href="<%=motel_category.urldefine(0,5)%><%=filtering%>">영등포/여의도</a></li>
			<li><a href="<%=motel_category.urldefine(0,6)%><%=filtering%>">구로/금천/오류/신도림</a></li>
			<li><a href="<%=motel_category.urldefine(0,7)%><%=filtering%>">강서/화곡/까치산역/목동</a></li>
			<li><a href="<%=motel_category.urldefine(0,8)%><%=filtering%>">천호/길동/둔춘</a></li>
			<li><a href="<%=motel_category.urldefine(0,9)%><%=filtering%>">서울대/신림/사당/동잘</a></li>
			<li><a href="<%=motel_category.urldefine(0,10)%><%=filtering%>">종로/대학로</a></li>
			<li><a href="<%=motel_category.urldefine(0,11)%><%=filtering%>">용산/중구/명동/이태원</a></li>
			<li><a href="<%=motel_category.urldefine(0,12)%><%=filtering%>">성신여대/성북/월곡</a></li>
			<li><a href="<%=motel_category.urldefine(0,13)%><%=filtering%>">노원/도봉/창동</a></li>
			<li><a href="<%=motel_category.urldefine(0,14)%><%=filtering%>">강북/수유/미아</a></li>
			<li><a href="<%=motel_category.urldefine(0,15)%><%=filtering%>">왕십리/성수/금호</a></li>
			<li><a href="<%=motel_category.urldefine(0,16)%><%=filtering%>">건대/광진/구의</a></li>
			<li><a href="<%=motel_category.urldefine(0,17)%><%=filtering%>">동대문/장안/청량리<br>답십리
			</a></li>
			<li><a href="<%=motel_category.urldefine(0,18)%><%=filtering%>">중랑/상봉/면목/태릉</a></li>
			<li><a href="<%=motel_category.urldefine(0,19)%><%=filtering%>">신촌/홍대/서대문/마포</a></li>
			<li><a href="<%=motel_category.urldefine(0,20)%><%=filtering%>">은펑/연신내/불광</a></li>
		</ul>
		<ul class="city_child" id="city_child2">
			<li><a href="<%=motel_category.urldefine(1,0)%><%=filtering%>">경기 인기숙소<span>HOT</span></a></li>
			<li><a href="<%=motel_category.urldefine(1,1)%><%=filtering%>">수원/인계</a></li>
			<li><a href="<%=motel_category.urldefine(1,2)%><%=filtering%>">수원시/권선/영통</a></li>
			<li><a href="<%=motel_category.urldefine(1,3)%><%=filtering%>">수원역/새류/팔달문<br>구운/장안
			</a></li>
			<li><a href="<%=motel_category.urldefine(1,4)%><%=filtering%>">대부도/제부도</a></li>
			<li><a href="<%=motel_category.urldefine(1,5)%><%=filtering%>">안성/평택/송탄</a></li>
			<li><a href="<%=motel_category.urldefine(1,6)%><%=filtering%>">오산/화성/동탄</a></li>
			<li><a href="<%=motel_category.urldefine(1,7)%><%=filtering%>">파주/금촌/헤이리<br>통일동산
			</a></li>
			<li><a href="<%=motel_category.urldefine(1,8)%><%=filtering%>">김포/장기/구례<br>대명항
			</a></li>
			<li><a href="<%=motel_category.urldefine(1,9)%><%=filtering%>">고양/일산</a></li>
			<li><a href="<%=motel_category.urldefine(1,10)%><%=filtering%>">의정부</a></li>
			<li><a href="<%=motel_category.urldefine(1,11)%><%=filtering%>">부천</a></li>
			<li><a href="<%=motel_category.urldefine(1,12)%><%=filtering%>">안양/평촌/인덕원/과천</a></li>
			<li><a href="<%=motel_category.urldefine(1,13)%><%=filtering%>">군포/금정/산본/의왕</a></li>
			<li><a href="<%=motel_category.urldefine(1,14)%><%=filtering%>">안산</a></li>
			<li><a href="<%=motel_category.urldefine(1,15)%><%=filtering%>">광명/철산/시흥신천역</a></li>
			<li><a href="<%=motel_category.urldefine(1,16)%><%=filtering%>">시흥/월곷/정왕<br>오이도
			</a></li>
			<li><a href="<%=motel_category.urldefine(1,17)%><%=filtering%>">용인</a></li>
			<li><a href="<%=motel_category.urldefine(1,18)%><%=filtering%>">이천/광주/여주</a></li>
			<li><a href="<%=motel_category.urldefine(1,19)%><%=filtering%>">성남/분당</a></li>
			<li><a href="<%=motel_category.urldefine(1,20)%><%=filtering%>">구리/하남</a></li>
			<li><a href="<%=motel_category.urldefine(1,21)%><%=filtering%>">남양주</a></li>
			<li><a href="<%=motel_category.urldefine(1,22)%><%=filtering%>">가평/양평</a></li>
			<li><a href="<%=motel_category.urldefine(1,23)%><%=filtering%>">양주/동두천/연천/장흥</a></li>
			<li><a href="<%=motel_category.urldefine(1,24)%><%=filtering%>">포천</a></li>
		</ul>
		<ul class="city_child" id="city_child3">
			<li><a href="<%=motel_category.urldefine(2,0)%><%=filtering%>">인천 인기숙소<span>HOT</span></a></li>
			<li><a href="<%=motel_category.urldefine(2,1)%><%=filtering%>">부평</a></li>
			<li><a href="<%=motel_category.urldefine(2,2)%><%=filtering%>">주안</a></li>
			<li><a href="<%=motel_category.urldefine(2,3)%><%=filtering%>">구월/소래포구</a></li>
			<li><a href="<%=motel_category.urldefine(2,4)%><%=filtering%>">동암/간석</a></li>
			<li><a href="<%=motel_category.urldefine(2,5)%><%=filtering%>">을왕리/인천공항</a></li>
			<li><a href="<%=motel_category.urldefine(2,6)%><%=filtering%>">월미도/차이나타운<br>신포/동인천
			</a></li>
			<li><a href="<%=motel_category.urldefine(2,7)%><%=filtering%>">작전/경인교대</a></li>
			<li><a href="<%=motel_category.urldefine(2,8)%><%=filtering%>">용현/숭의/도화/송림</a></li>
			<li><a href="<%=motel_category.urldefine(2,9)%><%=filtering%>">송도/연수</a></li>
			<li><a href="<%=motel_category.urldefine(2,10)%><%=filtering%>">서구/검단</a></li>
			<li><a href="<%=motel_category.urldefine(2,11)%><%=filtering%>">강화/옹진/백령도</a></li>
		</ul>
		<ul class="city_child" id="city_child4">
			<li><a href="<%=motel_category.urldefine(3,0)%><%=filtering%>">강원 인기숙소<span>HOT</span></a></li>
			<li><a href="<%=motel_category.urldefine(3,1)%><%=filtering%>">강릉역/교동택지/옥계</a></li>
			<li><a href="<%=motel_category.urldefine(3,2)%><%=filtering%>">경포대/사턴/주문진</a></li>
			<li><a href="<%=motel_category.urldefine(3,3)%><%=filtering%>">양양/낙산/하초대/인제</a></li>
			<li><a href="<%=motel_category.urldefine(3,4)%><%=filtering%>">속초/설악/동명항/고성</a></li>
			<li><a href="<%=motel_category.urldefine(3,5)%><%=filtering%>">춘천/홍천/철원/화천</a></li>
			<li><a href="<%=motel_category.urldefine(3,6)%><%=filtering%>">원주/횡성</a></li>
			<li><a href="<%=motel_category.urldefine(3,7)%><%=filtering%>">정동진/동해/삼척</a></li>
			<li><a href="<%=motel_category.urldefine(3,8)%><%=filtering%>">평창/영월/정선/태백</a></li>
		</ul>
		<ul class="city_child" id="city_child5">
			<li><a href="<%=motel_category.urldefine(4,0)%><%=filtering%>">제주 인기숙소<span>HOT</span></a></li>
			<li><a href="<%=motel_category.urldefine(4,1)%><%=filtering%>">제주시</a></li>
			<li><a href="<%=motel_category.urldefine(4,2)%><%=filtering%>">애월/협재</a></li>
			<li><a href="<%=motel_category.urldefine(4,3)%><%=filtering%>">서귀포/마라도</a></li>
		</ul>
		<ul class="city_child" id="city_child6">
			<li><a href="<%=motel_category.urldefine(5,0)%><%=filtering%>">부산 인기숙소<span>HOT</span></a></li>
			<li><a href="<%=motel_category.urldefine(5,1)%><%=filtering%>">해운대/재송</a></li>
			<li><a href="<%=motel_category.urldefine(5,2)%><%=filtering%>">송정/기장/청관</a></li>
			<li><a href="<%=motel_category.urldefine(5,3)%><%=filtering%>">서면/초읍/양정<br>부산시민공원/범천
			</a></li>
			<li><a href="<%=motel_category.urldefine(5,4)%><%=filtering%>">남포동/부산역/송도/영도/범일동</a></li>
			<li><a href="<%=motel_category.urldefine(5,5)%><%=filtering%>">광안리/수영/민락</a></li>
			<li><a href="<%=motel_category.urldefine(5,6)%><%=filtering%>">경성대/대연/용호/문현</a></li>
			<li><a href="<%=motel_category.urldefine(5,7)%><%=filtering%>">동래/온천장/부산대<br>구서/사직
			</a></li>
			<li><a href="<%=motel_category.urldefine(5,8)%><%=filtering%>">연산/토곡</a></li>
			<li><a href="<%=motel_category.urldefine(5,9)%><%=filtering%>">사상(공항경전철)/학장/엄궁</a></li>
			<li><a href="<%=motel_category.urldefine(5,10)%><%=filtering%>">강서/하단/사하<br>명지/신호/다대포
			</a></li>
			<li><a href="<%=motel_category.urldefine(5,11)%><%=filtering%>">덕천/만덕/구포<br>화명/북구
			</a></li>
		</ul>
		<ul class="city_child" id="city_child7">
			<li><a href="<%=motel_category.urldefine(6,0)%><%=filtering%>">경남 인기숙소<span>HOT</span></a></li>
			<li><a href="<%=motel_category.urldefine(6,1)%><%=filtering%>">김해/장유/율하</a></li>
			<li><a href="<%=motel_category.urldefine(6,2)%><%=filtering%>">양산/밀양</a></li>
			<li><a href="<%=motel_category.urldefine(6,3)%><%=filtering%>">거제/통영/고성군</a></li>
			<li><a href="<%=motel_category.urldefine(6,4)%><%=filtering%>">진주</a></li>
			<li><a href="<%=motel_category.urldefine(6,5)%><%=filtering%>">사천/남해/하동</a></li>
			<li><a href="<%=motel_category.urldefine(6,6)%><%=filtering%>">창원 상남/용호/중앙</a></li>
			<li><a href="<%=motel_category.urldefine(6,7)%><%=filtering%>">창원 명서/팔용<br>봉곡/북면
			</a></li>
			<li><a href="<%=motel_category.urldefine(6,8)%><%=filtering%>">마산/진해</a></li>
			<li><a href="<%=motel_category.urldefine(6,9)%><%=filtering%>">거창/함안/창녕/의령</a></li>
		</ul>
		<ul class="city_child" id="city_child8">
			<li><a href="<%=motel_category.urldefine(7,0)%><%=filtering%>">대구 인기숙소<span>HOT</span></a></li>
			<li><a href="<%=motel_category.urldefine(7,1)%><%=filtering%>">동성로/시청/서문시장</a></li>
			<li><a href="<%=motel_category.urldefine(7,2)%><%=filtering%>">대구역/경북대/엑스코/칠곡3지구<br>태전동/금호지구
			</a></li>
			<li><a href="<%=motel_category.urldefine(7,3)%><%=filtering%>">동대구역/신암/신천/동촌유원지<br>대구공항/혁신도시/팔공산
			</a></li>
			<li><a href="<%=motel_category.urldefine(7,4)%><%=filtering%>">수성구/수성못/범어/알파시티/남구<br>대명/봉덕/성당못
			</a></li>
			<li><a href="<%=motel_category.urldefine(7,5)%><%=filtering%>">두류공원/두류/본리/죽전/감삼</a></li>
			<li><a href="<%=motel_category.urldefine(7,6)%><%=filtering%>">평리/내당/비산/원대</a></li>
			<li><a href="<%=motel_category.urldefine(7,7)%><%=filtering%>">성서공단/계명대/달성군</a></li>
		</ul>
		<ul class="city_child" id="city_child9">
			<li><a href="<%=motel_category.urldefine(8,0)%><%=filtering%>">경북 인기숙소<span>HOT</span></a></li>
			<li><a href="<%=motel_category.urldefine(8,1)%><%=filtering%>">경주/보문단지/황리단길/불국사<br>안강/감포/양남
			</a></li>
			<li><a href="<%=motel_category.urldefine(8,2)%><%=filtering%>">구미</a></li>
			<li><a href="<%=motel_category.urldefine(8,3)%><%=filtering%>">포항남구/시청/시외버스터미널<br>구룡포/문덕/오천
			</a></li>
			<li><a href="<%=motel_category.urldefine(8,4)%><%=filtering%>">포항북구/영일대/죽도시장<br>여객터미널
			</a></li>
			<li><a href="<%=motel_category.urldefine(8,5)%><%=filtering%>">울진/울릉도/청송/영덕</a></li>
			<li><a href="<%=motel_category.urldefine(8,6)%><%=filtering%>">경산/하양/영천/청도</a></li>
			<li><a href="<%=motel_category.urldefine(8,7)%><%=filtering%>">문경/상주/영주/예천</a></li>
			<li><a href="<%=motel_category.urldefine(8,8)%><%=filtering%>">안동</a></li>
			<li><a href="<%=motel_category.urldefine(8,9)%><%=filtering%>">김천/성주/칠곡/의성/군의</a></li>
		</ul>
		<ul class="city_child" id="city_child10">
			<li><a href="<%=motel_category.urldefine(9,0)%><%=filtering%>">울산 인기숙소<span>HOT</span></a></li>
			<li><a href="<%=motel_category.urldefine(9,1)%><%=filtering%>">동구/북구/울주군/일산/정자<br>진하/영남알프스
			</a></li>
			<li><a href="<%=motel_category.urldefine(9,2)%><%=filtering%>">남구/중구/삼산/성남/무거/신정</a></li>

		</ul>
		<ul class="city_child" id="city_child11">
			<li><a href="<%=motel_category.urldefine(10,0)%><%=filtering%>">대전 인기숙소<span>HOT</span></a></li>
			<li><a href="<%=motel_category.urldefine(10,1)%><%=filtering%>">유성 봉명/도안/장대</a></li>
			<li><a href="<%=motel_category.urldefine(10,2)%><%=filtering%>">중구 은행/대흥/선화/유쳔</a></li>
			<li><a href="<%=motel_category.urldefine(10,3)%><%=filtering%>">동구 용천/복합터미널</a></li>
			<li><a href="<%=motel_category.urldefine(10,4)%><%=filtering%>">대덕구 신탄진/중리</a></li>
			<li><a href="<%=motel_category.urldefine(10,5)%><%=filtering%>">서구둔산/용문/월평</a></li>
		</ul>
		<ul class="city_child" id="city_child12">
			<li><a href="<%=motel_category.urldefine(11,0)%><%=filtering%>">충남 인기숙소<span>HOT</span></a></li>
			<li><a href="<%=motel_category.urldefine(11,1)%><%=filtering%>">천안서북구</a></li>
			<li><a href="<%=motel_category.urldefine(11,2)%><%=filtering%>">천안동남구</a></li>
			<li><a href="<%=motel_category.urldefine(11,3)%><%=filtering%>">계릉/금산/논산</a></li>
			<li><a href="<%=motel_category.urldefine(11,4)%><%=filtering%>">공주/동학사</a></li>
			<li><a href="<%=motel_category.urldefine(11,5)%><%=filtering%>">아산</a></li>
			<li><a href="<%=motel_category.urldefine(11,6)%><%=filtering%>">태안/안면도</a></li>
			<li><a href="<%=motel_category.urldefine(11,7)%><%=filtering%>">서산</a></li>
			<li><a href="<%=motel_category.urldefine(11,8)%><%=filtering%>">당진</a></li>
			<li><a href="<%=motel_category.urldefine(11,9)%><%=filtering%>">서천/부여</a></li>
			<li><a href="<%=motel_category.urldefine(11,10)%><%=filtering%>">대천/보령</a></li>
			<li><a href="<%=motel_category.urldefine(11,11)%><%=filtering%>">예산/청양/홍성</a></li>
			<li><a href="<%=motel_category.urldefine(11,12)%><%=filtering%>">새종</a></li>
		</ul>
		<ul class="city_child" id="city_child13">
			<li><a href="<%=motel_category.urldefine(12,0)%><%=filtering%>">충북 인기숙소<span>HOT</span></a></li>
			<li><a href="<%=motel_category.urldefine(12,1)%><%=filtering%>">청주 홍덕구/서원구</a></li>
			<li><a href="<%=motel_category.urldefine(12,2)%><%=filtering%>">청주 상당구/청원구</a></li>
			<li><a href="<%=motel_category.urldefine(12,3)%><%=filtering%>">진천/음성</a></li>
			<li><a href="<%=motel_category.urldefine(12,4)%><%=filtering%>">제천/단양</a></li>
			<li><a href="<%=motel_category.urldefine(12,5)%><%=filtering%>">충주/수안보</a></li>
			<li><a href="<%=motel_category.urldefine(12,6)%><%=filtering%>">중평/과산/영동/보은/옥천</a></li>
		</ul>
		<ul class="city_child" id="city_child14">
			<li><a href="<%=motel_category.urldefine(13,0)%><%=filtering%>">광주 인기숙소<span>HOT</span></a></li>
			<li><a href="<%=motel_category.urldefine(13,1)%><%=filtering%>">북구/챔피언스필드/광주역/전남대학교</a></li>
			<li><a href="<%=motel_category.urldefine(13,2)%><%=filtering%>">서구/유스쾌어터미널/상무지구</a></li>
			<li><a href="<%=motel_category.urldefine(13,3)%><%=filtering%>">동구/남구/국립아시아문화전당/충장로</a></li>
			<li><a href="<%=motel_category.urldefine(13,4)%><%=filtering%>">광산구 하남/송정역</a></li>
			<li><a href="<%=motel_category.urldefine(13,5)%><%=filtering%>">광산구 첨단지구</a></li>
		</ul>
		<ul class="city_child" id="city_child15">
			<li><a href="<%=motel_category.urldefine(14,0)%><%=filtering%>">전남 인기숙소<span>HOT</span></a></li>
			<li><a href="<%=motel_category.urldefine(14,1)%><%=filtering%>">여수</a></li>
			<li><a href="<%=motel_category.urldefine(14,2)%><%=filtering%>">순천</a></li>
			<li><a href="<%=motel_category.urldefine(14,3)%><%=filtering%>">광양</a></li>
			<li><a href="<%=motel_category.urldefine(14,4)%><%=filtering%>">목포/무안/영암</a></li>
			<li><a href="<%=motel_category.urldefine(14,5)%><%=filtering%>">나주/담양/곡성/구례/영광/장성/함평</a></li>
			<li><a href="<%=motel_category.urldefine(14,6)%><%=filtering%>">화순/보성/해남/완도/강진/고흥/진도</a></li>
		</ul>
		<ul class="city_child" id="city_child16">
			<li><a href="<%=motel_category.urldefine(15,0)%><%=filtering%>">전북 인기숙소<span>HOT</span></a></li>
			<li><a href="<%=motel_category.urldefine(15,1)%><%=filtering%>">전주 덕진구</a></li>
			<li><a href="<%=motel_category.urldefine(15,2)%><%=filtering%>">전구완산구/완주</a></li>
			<li><a href="<%=motel_category.urldefine(15,3)%><%=filtering%>">군산/비응도</a></li>
			<li><a href="<%=motel_category.urldefine(15,4)%><%=filtering%>">남원/임실/순창/무주/진안/장수</a></li>
			<li><a href="<%=motel_category.urldefine(15,5)%><%=filtering%>">익산/익산터미널/익산역</a></li>
			<li><a href="<%=motel_category.urldefine(15,6)%><%=filtering%>">김제/부안/고창/정읍</a></li>
		</ul>
	</div>
</div>

</body>
</html>