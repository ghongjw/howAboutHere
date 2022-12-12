/**
 * 
 */

Kakao.init('fd4042932dae317040da159ab157c168'); //발급받은 키 중 javascript키를 사용해준다.
console.log(Kakao.isInitialized()); // sdk초기화여부판단
//카카오로그인
function kakaoClick() {
	Kakao.Auth.login({
		success: function(response) {// 로그인 성공하면 받아오는 데이터
			Kakao.API.request({// 사용자 정보 가져오기
				url: '/v2/user/me',
				success: function(response) {
					console.log(response)
					id = response.id;
					email = response.properties.nickname;
					console.log(id)
					console.log(email)
				},
				fail: function(error) {
					console.log(error)
				},
			})
		},
		fail: function(error) {
			console.log(error)
		},
	})
}

function statusChangeCallback(res) {
	statusChangeCallback(response);
}

function faceClick() {
	FB.login(function(response) {
		if (response.status === 'connected') {
			FB.api('/me', 'get', { fields: 'name,email' }, function(r) {
				console.log(r);
			})
		} else if (response.status === 'not_authorized') {
			// 사람은 Facebook에 로그인했지만 앱에는 로그인하지 않았습니다.
			alert('앱에 로그인해야 이용가능한 기능입니다.');
		} else {
			// 그 사람은 Facebook에 로그인하지 않았으므로이 앱에 로그인했는지 여부는 확실하지 않습니다.
			alert('페이스북에 로그인해야 이용가능한 기능입니다.');
		}
	}, { scope: 'public_profile,email' });
}

window.fbAsyncInit = function() {
	FB.init({
		appId: '985868138947943',
		xfbml: true,
		version: 'v15.0'
	});
	FB.AppEvents.logPageView();
};

(function(d, s, id) {
	var js, fjs = d.getElementsByTagName(s)[0];
	if (d.getElementById(id)) { return; }
	js = d.createElement(s); js.id = id;
	js.src = "https://connect.facebook.net/en_US/sdk.js";
	fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));


function openPopUp() {
	console.log("da")
	window.open("https://nid.naver.com/oauth2.0/authorize?response_type=token&amp;client_id=mGGft55DO1y8VFGTafj6&amp;redirect_uri=http%3A%2F%2Flocalhost%3A8181%2Fhotel%2Flogin%2Fcallback.jsp&amp;state=95699c90-2717-4e21-8e38-dc3186e562d7", 'naverloginpop', 'titlebar=1, resizable=1, scrollbars=yes, width=600, height=550');
	
}


function mail_keyup() {
	var email = document.getElementById("id_input");
	var mail_alert = document.getElementById("mail_alert");
	var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	if (!regExp.test(email.value)) {
		mail_alert.innerHTML = "이메일 주소를 확인해 주세요";
	} else {
		mail_alert.innerHTML = "";
	}

}
function mail_blur() {
	var email = document.getElementById("id_input");
	var mail_alert = document.getElementById("mail_alert");
	var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	console.log("ddd");
	if (email.value == "") {
		mail_alert.innerHTML = "이메일 주소를 확인해 주세요";
		mail_alert.style.color = "red";
		email.style.borderColor = "red";
	}
	else if (!regExp.test(email.value)) {
		mail_alert.innerHTML = "이메일 주소를 확인해 주세요";
		mail_alert.style.color = "red";
		email.style.borderColor = "red";
	} else {
		mail_alert.innerHTML = "";
		mail_alert.style.color = "grey";
		email.style.borderColor = "grey";
	}
}
function pw_keyup() {
	var pw = document.getElementById("pw_input");
	var pw_alert = document.getElementById("pw_alert");
	if (pw.value == "") {
		pw_alert.innerHTML = "비밀번호 입력해 주세요";
		pw_alert.style.color = "red";
		pw.style.borderColor = "red";
	} else {
		pw_alert.innerHTML = "";
	}

}
