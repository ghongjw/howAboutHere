<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%Date date = new Date();
SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");
String notiTime = sdf.format(date);%>
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
	<p class="sub_title">알림</p>

	<!-- Nav -->
    <nav>
        <ul>
            <li><a class="" href="mypoint.jsp">포인트</a></li>
            <li><a class="" href="reserveList.jsp">예약 내역</a></li>
            <li><a class="" href="myinfo.jsp">내 정보 관리</a></li>
            <li><a class="active" href="notiSetting.jsp">알림</a></li>
            
        </ul>
    </nav>
    <div class="align_rt" data-v-6c70c7d6>
    	<div class="noti_list" data-v-6c70c7d6>
    		<h3>알림</h3> 
		
    		<section class="noti-setting-section" data-v-6c70c7d6>
    			<div class="noti-check-item" data-v-6c70c7d6>
    				<input type="checkbox" class="allcheck">
   						 <!----> 
   						<span data-v-6c70c7d6>
   							<a href="#" target="_blank" class="agreeall">마케팅 알림 수신 동의(선택)</a>
 						</span>
					
				</div>
			<div class="noti-guide" data-v-6c70c7d6>
                        할인쿠폰, 특가 상품, 이벤트 등 다양한 혜택 소식을
                        가장 먼저 보내드려요.
            </div>
           
		
            <fieldset data-v-6c70c7d6>
            	<div class="noti-check-item">
            		<input type="checkbox" class="check" value="푸시 알림" id="push">
            			 <!----> 
            			<span class="selitem">푸시 알림</span>
            	</div>
            	<div class="noti-check-item">
            		<input type="checkbox" class="check" value="이메일" id="email">
            				<!----> 
           				<span class="selitem">이메일</span>
            			
           		</div>
            	<div class="noti-check-item">
            		 <input type="checkbox" class="check" value="SMS" id="sms">
            				<!----> 
            				<span class="selitem">SMS</span>
            	</div>
            	</fieldset>
            </section>
            <button class="noti-confirm-button" data-v-6c70c7d6 type="submit">변경</button>
	
		
		</div>
	</div>
</div>
<div data-v-3d84cbe3="" data-v-6523adef="" class="notimsg" style="display:none">
	<div data-v-3d84cbe3="" class="alert_msg box_shadow">
		<div data-v-3d84cbe3="" class="msg popup_cont">
			<div data-v-3d84cbe3="" class="alert-contents">
				<p data-v-3d84cbe3="" class="alert-contents__title">
                    마케팅 알림 수신정보가 수정되었습니다.
                </p>
                <div data-v-3d84cbe3="" class="alert-contents__text">
                	<strong data-v-3d84cbe3="">
                	</strong>
                	<span data-v-3d84cbe3="">
                		<ul class="dot_txt">
                			<li>일시: <%=notiTime %></li>
                			<li class="refusal"></li>
                			<li class="agree"></li>
                		</ul>
                	</span>
                </div>
			</div>
			<div data-v-3d84cbe3="" class="btn_center">
				<a data-v-3d84cbe3="" class="close_notimsg">확인</a>
			</div>
		</div>
	</div>
</div>
        
                
    
<%@ include file="/index/main_footer.jsp" %>