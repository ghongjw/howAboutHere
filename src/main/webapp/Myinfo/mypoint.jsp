<%@page import="teamproject.MemberDTO"%>
<%@page import="teamproject.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%
   		String email = (String)session.getAttribute("email");
   		MemberDAO memberDao = new MemberDAO();
   		MemberDTO member = memberDao.selectEmail(email);
   		
   %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>여행할때 요기어때</title>
    <link rel="shortcut icon" href="//image.goodchoice.kr/images/web_v3/favicon_170822.ico" type="image/x-icon">
    <link rel="stylesheet preload"href="https://static.goodchoice.kr/fonts/css/font.css"as="style"type="text/css"crossorigin>
    <link rel="stylesheet" href="../css/common.css" />
    <link rel="canonical" href="https://www.goodchoice.kr/">
    <link rel="stylesheet" href="../css/swiper.css" />
	<link rel="stylesheet" href="../css/main.css" />
	<link rel="stylesheet" href="../css/more.css">
	<link rel="stylesheet" href="../css/terms4.css">
	<link rel="stylesheet" href="https://static.goodchoice.kr/yg-webview/css/terms/terms-basic.css">
	<link rel="stylesheet" href="https://static.goodchoice.kr/yg-webview/css/terms/terms-basic-new.css">
	<link rel="stylesheet" href="../css/my.css"/>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript" src="../js/main_js.js"></script>
	<script type="text/javascript" src="../js/more.js"></script>
	<script type="text/javascript" src="../js/myinfo.js"></script>
	<style type="text/css">
		.alert-contents__text{
			line-height: 0;
		}
	</style>
	
</head>
<body class="pc">
 <div class="wrap main_wrap show">
   <!-- Header -->
    <header>
         <section>
            <h1><a href="../index/main.jsp" title="저기어때">저기어때</a></h1>
            <button type="button" class="btn_menu nav_open ">메뉴</button>
            <button type="button" class="btn_srch srch_open " onclick="proc()" id ="btn_srch">검색</button><!-- 검색 버튼 클릭-->
            <ul class="gnb_pc" id ="search1">
	            <li><a href="#">내주변</a></li>
	            <%if(session.getAttribute("email") != null) {%>
	            <li><a href="../Myinfo/reserveList.jsp">예약내역</a></li>
	            <%} else{%>
	            <li><a href="../login/login.jsp">예약내역</a></li>
	            <%} %>
	            <li class="over">
                <button type="button"  id="viewlist" onmouseover="listblock()"><span>더보기</span></button><!-- 마우스가 더보기버튼위에 올라갔을때 -->
		               <ul class="list_03"  id ="list" style="display:none;">
		                   <li><a href="../more/moreshow.jsp">공지사항</a></li>
		                   <li><a href="../more/event.jsp">이벤트</a></li>
		                   <!-- <li><a href="https://www.goodchoice.kr/more/project">혁신 프로젝트</a></li> -->
		                   <li><a href="#">자주 묻는 질문</a></li>
		                   <li><a href="../more/inquiry.jsp">1:1 문의</a></li>
		                   <li><a href="../more/terms.jsp">약관 및 정책</a></li>
		               </ul>
            	</li>
            				<!-- 비로그인 상태에서 header 우측상단에 로그인버튼 생성 -->
            	<%if (session.getAttribute("email") == null){ %>
                <li><a href="../login/login.jsp"><span>로그인</span></a></li>
                <%} else{%>
                			<!-- 로그인상태에선 header 우측상단에 회원정보 생성 -->
                <li class="over pic" onmouseover="memberlistblock()">
                	<a href="../Myinfo/myinfo.jsp">
                	<img src="https://image.goodchoice.kr/profile/ico/ico_21.png" alt="" /></a>
                        <ul class="list_04" style="display:none" id="memberlist">
                            <li><b>85세기름밥</b></li> <!--회원가입시 등록한 닉네임 -->
                            <li><a href="../Myinfo/myinfo.jsp">내정보</a></li>
                            <li><a href="../Myinfo/mypoint.jsp">포인트<!-- span>0P</span --></a></li>
                            <li><a href="../Myinfo/reserveList.jsp">예약내역<!-- span>0건</span --></a></li>
                            <li><a href="../Myinfo/notiSetting.jsp">알림설정</a></li>
                            <li><button type="button" class="pop_logout_open" onclick ="location.href='../index/logoutService.jsp'">로그아웃</button></li>
                        </ul>
                 </li>
                    <%} %>
            </ul>

            <!-- Search -->
            <div class="srch_bar" id="search2">
                <div class="wrap_inp">
                    <input type="text" id="keyword" placeholder="지역, 숙소명" autocomplete="off" />
                    <button type="button" class="btn_srch">검색</button>
                </div>
                <button class="btn_cancel" onclick="srch_close()">취소</button><!-- 검색창에서 x 버튼 클릭 -->
            </div>
            <!-- //Search -->

        </section>
    </header>
<!-- Sub Top -->
<div class="sub_top_wrap">
	<div class="sub_top bg_kong_2" onmouseover="listnone()">
		<h2>내정보</h2>
	</div>
</div>
<!-- //Sub Top -->
<!-- Content  -->
<div id="content" class="sub_wrap my_wrap" data-v-f012d516 data-v-6523adef onmouseover="listnone()">
	<h3 class="sub_title mobile-only" data-v-f012d516>포인트</h3>
	<div data-v-f012d516>
		<nav>
			<ul>
			<li><a class="active" href="mypoint.jsp">포인트</a></li>
            <li><a class="" href="reserveList.jsp">예약 내역</a></li>
            <li><a class="" href="myinfo.jsp">내 정보 관리</a></li>
            <li><a class="" href="notiSetting.jsp">알림</a></li>
             </ul>
         </nav>
    </div>
    <main class="container align_rt" data-v-f012d516>
    	<input type="hidden" name="page" value="1" data-v-f012d516>
    	<h3 class="page-title pc-only" data-v-f012d516>포인트</h3>
    	<header class="point-header" data-v-f012d516>
    		<div data-v-a44a2b76 data-v-f012d516>
    			<div class="points-summary" data-v-a44a2b76>
    				<div class="upper-col" data-v-a44a2b76>
    					<div class="heading-text" data-v-a44a2b76>
    						<p class="heading-text__title" data-v-a44a2b76>내 포인트</p>
    						<p class="heading-text__current-point" data-v-a44a2b76><%=member.getPoint()%> P</p>
   						</div>
   						<svg width="20" height="20" fill="none" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid meet" class="icon-info" data-v-a44a2b76 data-v-a44a2b76>
   							<path fill-rule="evenodd" clip-rule="evenodd" d="M17.5 10a7.5 7.5 0 11-15 0 7.5 7.5 0 0115 0zM11 6a1 1 0 11-2 0 1 1 0 012 0zm0 9V9H9v6h2z" fill="#000" fill-opacity=".8" data-v-a44a2b76 data-v-a44a2b76></path>
   						</svg>
   					</div> <div class="lower-col" data-v-a44a2b76>
   						<p class="notice-text" data-v-a44a2b76>30일 내
   							<span class="font-weight--xb" data-v-a44a2b76><%=member.getPoint() %> P</span>가 소멸될 예정이에요.
            			</p>
           				<!---->
           					</div>
        		</div>
        	</div>
	        <nav class="point-filter" data-v-f012d516>
	        	<button class="btn-capsule btn-capsule--solid" data-v-7e2f9980 data-v-f012d516>
	        		<span data-v-7e2f9980>전체</span> <!----></button>
	        	<button class="btn-capsule btn-capsule--solid" data-v-7e2f9980 data-v-f012d516>
	        		<span data-v-7e2f9980>적립</span> <!----></button>
	        	<button class="btn-capsule btn-capsule--solid" data-v-7e2f9980 data-v-f012d516>
	        		<span data-v-7e2f9980>사용</span> <!----></button>
	        	<button class="btn-capsule btn-capsule--solid" data-v-7e2f9980 data-v-f012d516>
	        		<span data-v-7e2f9980>소멸</span> <!----></button>
	        </nav>
       </header>
	    <section class="points-list" data-v-58e184f6 data-v-f012d516>
	    	<div class="points-list__notice-empty" data-v-58e184f6>
	        포인트 내역이 없어요
	    	</div>
	    </section>
    </main> <!----> <!---->
</div>
<%@ include file="/index/main_footer.jsp" %>

<div data-v-3d84cbe3="" data-v-6523adef="" class="point_info" style="display:none">
	<div data-v-3d84cbe3="" class="alert_msg box_shadow">
		<div data-v-3d84cbe3="" class="msg popup_cont">
			<div data-v-3d84cbe3="" class="alert-contents">
				<p data-v-3d84cbe3="" class="alert-contents__title">
                    포인트 이용안내
                </p>
                <div data-v-3d84cbe3="" class="alert-contents__text">
                	<strong data-v-3d84cbe3=""></strong>
                	<span data-v-3d84cbe3="">
                		<ul class="dot_txt">
                			<li>포인트 사용 기간은 적립 일에 따라 각각 달라요.</li>
                			<li>사용 기간 내에 쓰지 않은 포인트는 자동으로 소멸돼요.</li>
                			<li>포인트 사용 기간 내에 포인트를 취소한다면 그대로 돌려 드려요. 단, 사용 기간은 처음 지급한 날과 같아요.</li>
                			<li>포인트 사용 기간 만료 후에 포인트를 취소한다면 자동으로 소멸돼요.</li>
                		</ul>
                	</span>
                </div>
              </div>
           <div data-v-3d84cbe3="" class="btn_center"><a data-v-3d84cbe3="" class="point_info_close">확인</a>
           </div>
		</div>
	</div>
</div>