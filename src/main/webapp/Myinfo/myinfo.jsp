<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/index/main_header.jsp" %>
<%
	String email = (String)session.getAttribute("email");
	MemberDAO memberDao = new MemberDAO();
	MemberDTO memberDto = memberDao.selectEmail(email);
	String nickname = memberDto.getNick();
	String mobile = memberDto.getMobile();
%>
<!-- Sub Top -->
<div class="sub_top_wrap">
	<div class="sub_top bg_kong_2" onmouseover="listnone()">
		<h2>내정보</h2>
	</div>
</div>
<!-- //Sub Top -->
<!-- Content  -->
<div id="content" class="sub_wrap my_wrap" onmouseover="listnone()">
	<p class="sub_title">내 정보 관리</p>

	<!-- Nav -->
	    <nav>
        <ul>
            <li><a class="" href="mypoint.jsp">포인트</a></li>
            <li><a class="" href="reserveList.jsp">예약 내역</a></li>
            <li><a class="active" href="myinfo.jsp">내 정보 관리</a></li>
            <li><a class="" href="notiSetting.jsp">알림</a></li>
            
        </ul>
    </nav>
	<div class="align_rt">
		<div class="mypage">
			<form name="form1" action="myinfo_NickUpdate_Service.jsp" autocomplete="off" method="post" novalidate data-form="unick">
				<!-- 폼전송시 전달되는 data target element -->
				<div class="mypageForm__form-inputs-wrap" aria-hidden="true">
					<input type="hidden" name="uno" value="18923103" />
					<input type="text" name="unick" id="test1" aria-hidden="true" value="85세기름밥" />
					<input type="text" name="uname" aria-hidden="true" value="" />
					<input type="tel"  name="uphone" aria-hidden="true" value="010****7914" />
				</div>

				<input type="hidden" name="yeogi_token" value="44d310e952e3b1adbb73e84c44bb2ef9">
				<input type="hidden" id="utype" name="utype" value="4">
				<input type="hidden" name="utype" value="4">
				<!--// 폼전송시 전달되는 data target element -->
				<section class="top_area">
					<strong>내 정보 수정</strong>
					<div class="login_info">
						<div><img src="https://image.goodchoice.kr/profile/ico/ico_21.png" alt=""></div>
					</div>

					<div class="pw_input">
						<div class="pw_input__title">
							<b>닉네임</b>
							<!--회원가입시 등록한 닉네임 -->
							<span class="title__uinfo"><%=nickname%></span> 
						</div>
						<section class="modifying-section" style="display:none">
							<p class="inp_wrap remove">
								<input type="text" value="<%=nickname%>"
									   placeholder="체크인시 필요한 정보입니다." name="changenick" id="changerandom"
									   />
							</p>
							<button type="button" class="btn_etc btn_confirm active" onclick="changeNickname()">딴거할래요</button> <!-- 활성화 클래스 'active' -->
						</section>
						<div class="pw_input__btns-wrap">
							<button class="btns-wrap__edit-btn" type="button">수정</button>
							<button class="btns-wrap__submit-btn" type="submit">수정완료</button>
							<button class="btns-wrap__cancel-btn" type="button">수정취소</button>
						</div>
					</div>
				</section>
			</form>
			<form name="form2" action="myinfo_Usernameupdate_Service.jsp" autocomplete="off" method="post" novalidate data-form="uname">
				<!-- 폼전송시 전달되는 data target element -->
				
				<section class="top_area">
					<div class="pw_input">
						<div class="pw_input__title">
							<b>예약자 이름</b>
							<span class="title__uinfo"></span>
						</div>
						<section class="modifying-section" style="display:none">
							<p class="inp_wrap remove form-errors">
								<input type="text" id="uname"
									   value="<%=memberDto.getUsername()%>"
									   placeholder="체크인시 필요한 정보입니다."
									   name="uname"
									   >
							</p>
						</section>
						<div class="pw_input__btns-wrap">
							<button class="btns-wrap__edit-btn" type="button" style="?android:attr/borderlessButtonStyle">수정</button>
							<button class="btns-wrap__submit-btn"  type="submit">수정완료</button>
							<button class="btns-wrap__cancel-btn"  type="button" style="?android:attr/borderlessButtonStyle">수정취소</button>
						</div>
					</div>
				</section>
			</form>

			<form  name="form3" action="myinfo_Mobileupdate_Service.jsp" autocomplete="off" method="post" novalidate data-form="uphone">
				<section>
					<!-- 폼전송시 전달되는 data target element -->
					<div class="mypageForm__form-inputs-wrap" aria-hidden="true">
						<input type="hidden" name="uno" value="18923103" />
						<input type="text" name="unick" aria-hidden="true" value="85세기름밥" />
						<input type="text" name="uname" aria-hidden="true" value="" />
						<input type="tel" name="uphone" aria-hidden="true" value="010****7914" />
					</div>
					<input type="hidden" name="yeogi_token" value="44d310e952e3b1adbb73e84c44bb2ef9">
					<input type="hidden" name="utype" value="4">
					<div class="pw_input phone_confirm">
						<div class="pw_input__title">
							<b>휴대폰 번호</b>
							<span class="title__uinfo"><%=mobile%></span>
							<div class="safety_txt">개인 정보 보호를 위해 내 정보는 모두 안전하게 암호화됩니다.</div>
						</div>
						<div class="modifying-section" style="display:none">
							
							<input type="hidden" id="phone_certification_point" value="MYPAGE" style="display: none;">
						</div>
						<div class="pw_input__btns-wrap">
							<button class="btns-wrap__edit-btn " type="button" onclick="location.href='myinfo_Mobileupdate.jsp'">수정</button>
							<button class="btns-wrap__submit-btn" type="submit">수정완료</button>
							<button class="btns-wrap__cancel-btn" type="button">수정취소</button>
						</div>
					</div>
				</section>
			</form>
			<!-- <button class="btn_submit disabled btn_one" type="submit">저장</button>-->

					</div>

		<div class="bot_btn">
			<p>여기어때를 이용하고 싶지 않으신가요?</p>
			<button type="button" onclick="location.href='../index/logoutService.jsp'">로그아웃</button>
							<button type="button"><a href="myinfo_delete.jsp">회원탈퇴</a></button>
					</div>
	</div>
</div>
<!-- //Content  -->

<%@ include file="/index/main_footer.jsp" %>