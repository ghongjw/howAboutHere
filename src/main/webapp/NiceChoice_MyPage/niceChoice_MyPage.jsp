<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
	<link rel = "stylesheet" href = "niceChoice_MyPage.css">
	<script src = "niceChoice_MyPage.js"></script>

	<%
		if (session.getAttribute("hostEmail") == null) {
			out.print("<script>location.href = '/project/HostHouseAuth/hosthouseauth.jsp';</script>");
			return;
		}
	
		String nowPw = (String)session.getAttribute("pw");
	%>
</head>
<body>
	<%@ include file = "/NiceChoice/niceChoice_Header.jsp" %>
	
	<div class = "myPage_center">
		<div class = "myPage_table">
			<div>
				<span class = "myPageHeaderText">
					마이페이지
				</span>
			</div>
			
			<div class = "myPageInfoText">
				<span>
					● 현재 페이지는 추가 보안 인증 절차가 필요합니다.
				</span> <br>
				
				<span>
					● 로그인 시 사용된 비밀번호를 다시 한번 입력해 주세요.
				</span> <br>
				
				<hr>
			</div>
			
			<div class = "myPageFunction">
				<input type = "password" placeholder = "로그인 비밀번호" id = "pw">
				<button type = "button" class = "authBtn" onclick = "verify('<%= nowPw %>')">인증</button>
			</div>
		</div>
	</div>
	
	<%@ include file = "/NiceChoice/niceChoice_footer.jsp" %>
</body>
</html>