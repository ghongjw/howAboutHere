<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/index/main_header.jsp" %>
<!-- Sub Top -->
<div class="sub_top_wrap">
	<div class="sub_top bg_kong_2" onmouseover="listnone()">
		<h2>내정보</h2>
	</div>
</div>
<!-- //Sub Top -->
<!-- Content  -->
<div id="content" class="sub_wrap my_wrap" onmouseover="listnone()">
	<p class="sub_title">예약내역</p>

	<!-- Nav -->
    <nav>
        <ul>
            <li><a class="" href="mypoint.jsp">포인트</a></li>
            <li><a class="active" href="reserveList.jsp">예약 내역</a></li>
            <li><a class="" href="myinfo.jsp">내 정보 관리</a></li>
            <li><a class="" href="notiSetting.jsp">알림</a></li>
            
        </ul>
    </nav>
    <div class="align_rt" data-v-ea7e1050>
	    <div class="list_none" style="display: block">
                	예약 내역이 없습니다.
             <b>최저가로 예약 가능한
         	 	<br>숙소들을 지금 만나세요!
             </b>
             <p>
             	<a href="../index/main.jsp" class="btn_red">다양한 숙소 보러가기
                </a>
             </p>
         </div>
	</div>
</div>
    
<%@ include file="/index/main_footer.jsp" %>