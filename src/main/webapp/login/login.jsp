<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="login1.css">
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script async defer crossorigin="anonymous"
	src="https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v10.0&appId=985868138947943"
	nonce="SiOBIhLG"></script>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="login1.js"></script>
<title>로그인 | 여기어때</title>
</head>
<body>
	<div id="wrap">
		<form action="loginService.jsp" method="post">
			<header><a href="../index/main.jsp" style="display: block;text-indent: -9999px;">요기 어때</a></header>
			<div id="kakao_login_box">
				<input type="button" id="kakaologin_button" onclick="kakaoClick()">
				<div class="kakao_icon">
					<label>카카오톡으로 로그인</label>
				</div>
				<input type="button" id="kabutton" onclick="kakaoClick()">
			</div>
			<div id="facebook_login_box">
				<input type="button" id="facebooklogin" onclick="faceClick()">
				<div class="facebook_icon">
					<label>Facebook으로 로그인</label>
				</div>
				<input type="button" id="falogin" onclick="faceClick()">


			</div>
  <!-- //네이버 로그인 버튼 노출 영역 -->
			<div id="naver_login_box">
				<input type="button" id="naverIdLogin_loginButton"
					onclick="openPopUp()">
					
				<div class="naver_icon"><label>네이버로 로그인</label></div>
				<input type="button" id="naloginButton" onclick="openPopUp()">
				<div id="naver_id_login" class="naver_id_login" ></div>
				 <script type="text/javascript">
				 var naver_id_login = new naver_id_login("mGGft55DO1y8VFGTafj6", "http://localhost:8181/hotel/login/callback.jsp");
			  naver_id_login.setButton("green", 3,60);
			  	var state = naver_id_login.getUniqState();
			  	naver_id_login.setDomain("http://localhost:8181/hotel/login/main.jsp");
			  	naver_id_login.setState(state);
			  	naver_id_login.setPopup();
			  	naver_id_login.init_naver_id_login();
			  	//alert(naver_id_login.oauthParams.access_token);
			  	  // 네이버 사용자 프로필 조회
			  	 naver_id_login.get_naver_userprofile("naverSignInCallback()");
			  	  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
			  	
  </script>
			</div>
			<table id="or">
			<tr>
			<td id="bor"> </td>
			<td rowspan=2>또는</td>
			<td id="bor"> </td>
			</tr>
			<tr>
			<td > </td>
			<td > </td>
			</tr>
			</table>
			
			<div id="idbox">
			<div class="mail_icon"></div>
			<input id="id_input" type="text" placeholder="이메일 주소" name="email" onkeyup="mail_keyup()" onBlur="mail_blur()">
			
			</div>
			<label id="mail_alert"></label>
			<div id="pwbox">
			<div class="pw_icon"></div>
			<input id="pw_input" type="password" placeholder="비밀번호" name="password" onkeyup="pw_keyup()" >
			
			</div>
			<label id="pw_alert"></label>
			
			<input type="submit" id="login_button" value="로그인" style="cursor:pointer">
			<div id="setting">
			<div id="reset_pw"><a href="passwdResetStart.jsp">비밀번호 재설정</a></div><div id="split">|</div>
			<div id="register"><a href="../register/register_agreement.jsp">회원가입</a></div>
	</div>
	</form>
</div>
</body>
</html>