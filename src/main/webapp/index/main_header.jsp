<%@page import="teamproject.MemberDAO"%>
<%@page import="teamproject.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>여행할때 요기어때</title>
    <link rel="shortcut icon" href="//image.goodchoice.kr/images/web_v3/favicon_170822.ico" type="image/x-icon">
    <link rel="stylesheet preload"href="https://static.goodchoice.kr/fonts/css/font.css"as="style"type="text/css"crossorigin>
    <link rel="stylesheet" href="../css/common.css" />
    <!-- <link rel="canonical" href="https://www.goodchoice.kr/"> -->
    <link rel="stylesheet" href="../css/swiper.css" />
	<link rel="stylesheet" href="../css/main.css" />
	<link rel="stylesheet" href="../css/more.css">
	<link rel="stylesheet" href="../css/terms4.css">
	<link rel="stylesheet" href="https://static.goodchoice.kr/yg-webview/css/terms/terms-basic.css">
	<link rel="stylesheet" href="https://static.goodchoice.kr/yg-webview/css/terms/terms-basic-new.css">
	<link rel="stylesheet" href="../css/my.css"/>
	<link rel="stylesheet" href="../css/font.css"/>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript" src="../js/main_js.js"></script>
	<script type="text/javascript" src="../js/more.js"></script>
	<script type="text/javascript" src="../js/myinfo.js"></script>
	<script type="text/javascript" src="../js/query.comiseo.daterangepicker.min.js"></script>
	<script src=https://www.goodchoice.kr/js/service/common.js?rand=1664413250></script>
	<style type="text/css">
	.delbtn{
			width:50px;
			height:30px;
			margin-top: 50px;
			cursor: pointer;
		}
	.alert-contents__text{
	line-height: 0;
	}
	h3 {
    display: block;
    font-size: 1.17em;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bold;
	}
	.yoinfo{
	font-size: 30px;
    font-weight: bolder;
	}
	</style>
	
</head>
<body class="pc">
 <div class="wrap main_wrap show">
   <!-- Header -->
    <header class="scroll">
         <section>
            <h1><a href="../index/main.jsp" title="저기어때" style="height: 25px;">저기어때</a></h1>
            <button type="button" class="btn_menu nav_open ">메뉴</button>
            <button type="button" class="btn_srch srch_open " onclick="proc()" id ="btn_srch">검색</button><!-- 검색 버튼 클릭-->
            <ul class="gnb_pc" id ="search1">
	            <li><a href="#">내주변</a></li>
	            <%if(session.getAttribute("email") != null) {%>
	            <li><a href="../Myinfo/reserveList.jsp">예약내역</a></li>
	            <%} else{%>
	            <li><a href="../login/unknownlogin.jsp">예약내역</a></li>
	            <%} %>
	            <li class="over">
                <button type="button"  id="viewlist" onmouseover="listblock()"><span>더보기</span></button><!-- 마우스가 더보기버튼위에 올라갔을때 -->
		               <ul class="list_03"  id ="list" style="display:none;">
		                   <li><a href="../more/moreshow.jsp">공지사항</a></li>
		                   <li><a href="../more/event.jsp">이벤트</a></li>
		                   <li><a href="../more/faq.jsp">자주 묻는 질문</a></li>
		                   <li><a href="../more/inquiry.jsp">1:1 문의</a></li>
		                   <li><a href="../more/terms.jsp">약관 및 정책</a></li>
		               </ul>
            	</li>
            				<!-- 비로그인 상태에서 header 우측상단에 로그인버튼 생성 -->
            	<%if (session.getAttribute("email") == null){ %>
                <li><a href="../login/login.jsp"><span>로그인</span></a></li>
                <%} else{
                	String email = (String)session.getAttribute("email");
                	System.out.print("email : " + email);
                	MemberDAO memberDao = new MemberDAO();
                	MemberDTO member = memberDao.selectEmail(email);
                	String nickname = member.getNick();
                	String mobile = member.getMobile();
                %>
                			<!-- 로그인상태에선 header 우측상단에 회원정보 생성 -->
                <li class="over pic" onmouseover="memberlistblock()">
                	<a href="../Myinfo/myinfo.jsp">
                	<img src="https://image.goodchoice.kr/profile/ico/ico_21.png" alt="" /></a>
                        <ul class="list_04" style="display:none" id="memberlist">
                            <li><b><%=nickname%></b></li> <!--회원가입시 등록한 닉네임 -->
                            <li><a href="../Myinfo/myinfo.jsp">내정보</a></li>
                            <li><a href="../Myinfo/mypoint.jsp">포인트<!-- span>0P</span --></a></li>
                            <li><a href="../Myinfo/reserveList.jsp">예약내역<!-- span>0건</span --></a></li>
                            <li><a href="../Myinfo/notiSetting.jsp">알림설정</a></li>
                            <li><button type="button" class="pop_logout_open" onclick ="location.href='../index/logoutService.jsp'">로그아웃</button></li>
                        </ul>
                 </li>
                    <%memberDao.disconnection();} %>
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