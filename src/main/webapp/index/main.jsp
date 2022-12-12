<%@page import="main_dateset.datecitiset"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	<!-- header -->
<%@ include file="main_header.jsp" %>

     <!-- Bg Dimm -->
    <div class="bg_dimm" onclick="close_layer();">&nbsp;</div>
    <div class="bg_dimm_prevent">&nbsp;</div>

    <!-- 추천검색어 -->
    <div class="recommend_srch" id="search3">
        <div class="scroll_srch">
            <div class="scroller">
                <div class="default"  style="display:block">
                    <strong>추천 검색어</strong>
                    <ul></ul>
                </div>
                <!-- 연관검색어 -->
                <div class="chain">
                    <ul></ul>
                </div>
            </div>
        </div>
    </div>
    <div id="content" onmouseover="listnone()"><!-- 마우스가 content에 갔을때 list를 숨김 -->
  		<div class="main_spot">여행할때 여기어때</div>
    	<div class="main_link">
			<ul>
				<li><a href="../motel_search/motel_recommend.jsp" menu-link="1"><span class="ico_01">&nbsp;</span>
				<p>모텔</p></a></li>
			<li><a href="../hotel_search/hotel_recommend.jsp?cityName=0&cityChild=0&datefilter=<%=datecitiset.dateset() %>" menu-link="2"><span class="ico_02">&nbsp;</span>
				<p>호텔·리조트</p></a></li>
			<li><a href="../pension_search/pension_recommend.jsp?cityName=0&cityChild=0&datefilter=<%=datecitiset.dateset() %>" menu-link="3"><span class="ico_03">&nbsp;</span>
				<p>펜션</p></a></li>
			<li><a href="../guestHouse_search/guestHouse_recommend.jsp?cityName=0&cityChild=0&datefilter=<%=datecitiset.dateset() %>" menu-link="6"><span class="ico_04">&nbsp;</span>
				<p>게스트하우스</p></a></li>
			<li><a href="../camping_search/camping_recommend.jsp?cityName=0&datefilter=<%=datecitiset.dateset() %>" menu-link="5"><span class="ico_05">&nbsp;</span>
				<p>캠핑·글램핑</p></a></li>
			<li><a href="#"><span class="ico_07">&nbsp;</span>
				<p>내주변</p></a></li>
			
			</ul>
		</div>
	</div>
	<!-- Recommend -->
		<div class="recommend">
			<h2 class="yoinfo">요기어때 소식</h2>
			<ul>
				
				<li><a href="#" target="_blank"><img src="//image.goodchoice.kr/images/web_v3/b2b_banner.png" alt="여기어때 비즈니스" /><strong>요기어때 비즈니스</strong>출장부터 복지까지<br/>여기어때 비즈니스로 스마트하게</a></li>
				<!-- <li><a href="https://www.goodchoice.kr/product/recommend/82"><img src="//image.goodchoice.kr/images/web_v3/re_1.png" alt="스타&컬리넌" /><strong>스타&컬리넌</strong>최고와 최고가 만났습니다<br/>모던한 감성과 스타일리쉬한 호텔</a></li> -->
				<li><a href="#" target="_blank"><img src="//image.goodchoice.kr/images/web_v3/re_jalnan.png" alt="여기어때 잘난체" /><strong>요기어때 서체 출시</strong>젊고 당당한 여기어때 잘난체<br/>지금 다운로드 받으세요!</a></li>
			</ul>
			<!-- li><a href="https://www.goodchoice.kr/product/recommend/153"><img src="//image.goodchoice.kr/images/web_v3/re_3.png" alt="" /><strong>반려동물 동반가능 숙소</strong>혼자두지마세요. 이제 함께 떠나요</a></li>
			<li><a href="#none" ><img src="//image.goodchoice.kr/images/web_v3/re_4.png" class="img_ready " alt="" /><strong>컨텐츠 준비중</strong>빠른시일내에 준비하겠습니다.<br/>이용에 불편을 드려 죄송합니다.</a></li -->
		</div>
	<!-- //Recommend -->
	<!-- App Down -->
		<div class="appdown">
			<p>앱 다운 받고 <b>더 많은 혜택</b> 받으세요</p>
			<div>
				<a href="#" class="down_and" target="_blank" title="구글플레이 새창"><img src="//image.goodchoice.kr/images/web_v3/banner_and.png" alt="GET IT ON Google Play" /></a>
				<a href="#" class="down_ios" target="_blank" title="앱스토어 새창"><img src="//image.goodchoice.kr/images/web_v3/banner_ios.png" alt="Download on the App Store" /></a>
				<!--
				<button onclick="pop_layer_w('pop_downlink');" class="gra_left_right_red">앱 다운로드 링크보내기</button>
				-->
			</div>
		</div>
	<!-- //App Down -->
	<!-- EVENT -->
		<div class="event_main">
			<h2>이벤트</h2>
			<section class="swiper-container">
				<ul class="swiper-wrapper">
					<li class='swiper-slide'><a href="#"><img  src="//image.goodchoice.kr/images/cms/home_img/4b9d41f51f329355f76c0daad7dc5027.jpg" alt="대한민국 여행페스타" /></a></li><li class='swiper-slide'><a href="/more/eventView/2524?page=0"><img  src="//image.goodchoice.kr/images/cms/home_img/fb4507e69d3fa1779d4623946aa76244.jpg" alt="씽크어스 친환경 여행 캠페인" /></a></li><li class='swiper-slide'><a href="/more/eventView/608?page=0"><img  src="//image.goodchoice.kr/images/cms/home_img/3c13f7bf4ea5ef67729fa285aca7896f.jpg" alt="페이백 50﹪ 쿠폰 이벤트" /></a></li>				</ul>
				<!-- Add Pagination -->
				<div class="swiper-pagination"></div>
			</section>
		</div>
	<!-- //EVENT -->
	<!-- Ad -->
		<div class="ad_ask">
			<!-- Pc -->
			<ul class="pc">
				<li>
					<a href="#" onclick="alert('신규 업체 가입 문의는 고객센터 (1544-4087) 로 연락해주세요'); return false;" target="_blank">
						<img src="//image.goodchoice.kr/images/web_v3/ad_01_171013.png" alt="여기어때 광고 신청하기" />
					</a>
				</li>
				<li><a href="/project/HostHouseAuth/hosthouseauth.jsp" target="_blank"><img src="//image.goodchoice.kr/images/web_v3/ad_02_171013.png" alt="게스트 하우스 숙소 등록하기" /></a></li>
			</ul>
		</div>
	<!-- //Ad -->
	
    <!-- Footer -->
	<%@ include file="main_footer.jsp" %>	