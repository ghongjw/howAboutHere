<%@page import="DAO.MyInfoLookupDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>요기어때 호스트하우스</title>
	<link rel = "stylesheet" href = "/project/NiceChoice/niceChoice_Header.css">
	<script src = "/project/NiceChoice/niceChoice_Header.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script> 
		$(function() {
			$("#myAndlodgmentInfo").on("click", function() {
			<%
				MyInfoLookupDAO getInfo = new MyInfoLookupDAO();
				String phone = getInfo.lookupPhone((String)session.getAttribute("hostEmail"));
				
				if (phone == null) { %>
					location.href = "/project/NiceChoice_MyPage/niceChoice_MyPage.jsp";
				<%} else {%>
					location.href = "/project/NiceChoice_MyInfo/niceChoice_MyInfo.jsp";
				<%
				}%>
			});
			
			$("#intro__").on("click", function() {
			<%
				String verifyLodgmentCategory = getInfo.lookupType((String)session.getAttribute("hostEmail"));
				
				if (verifyLodgmentCategory == null) {%>
					alert("내정보/숙소관리 -> 내정보/업체정보 등록 후 이용해주시기 바랍니다.");
				<%
				} else {%>
					location.href = "/project/NiceChoice_HostIntro/niceChoice_hostIntro.jsp?category=" + "<%= verifyLodgmentCategory %>";
				<%
				}%>
			});
			
			$("#rule").on("click", function() {
			<%
				String verifyConvenienceFacilities = getInfo.lookupFacilities((String)session.getAttribute("hostEmail"));
				if (verifyConvenienceFacilities == null) { %>
					alert("내정보/숙소관리 -> 소개작성 등록 후 이용해주시기 바랍니다.");
				<%
				} else {%>
					location.href = "/project/NiceChoice_HostTime/niceChoice_HostTime.jsp";
				<%
				}%>
			});
			
			$("#room").on("click", function () {
			<%
				String verifyInTime = getInfo.lookupInTime((String)session.getAttribute("hostEmail"));
				if (verifyInTime == null) {%>
					alert("내정보/숙소관리 -> 내정보/업체정보, 소개 작성, 이용규칙 관리 등록 후 이용해주시기 바랍니다.");
				<%} else {%>
					location.href = "/project/NiceChoice_RoomManage/niceChoice_RoomManage.jsp";
				<%}%>
			});
		});
		<%
			getInfo.disconnection();
		%>
	</script>
</head>
<body>
	<div id = "wrap">
		<div class = "header_1">
			<div class = "header_1_left">
				<a href = "niceChoice_Main.jsp">
					<img src = "/project/Img/home.png">
				</a>
				<span>
					<strong>대표자</strong>
					 님 안녕하세요.
				</span>
				<div class = "header_1_left_vertical"></div>
				<div class = "header_1_reservate">
					<img src = "/project/Img/phone.png">
					<span>예약문의 하지마</span>
				</div>
			</div>
			
			<div class = "header_1_right_myPage">
				<img src = "/project/Img/myPage.png" class = "myPageImg">
				<span class = "myPageText" onclick = "location.href = '/project/NiceChoice_MyPage/niceChoice_MyPage.jsp'">마이페이지</span>
			</div>
			<div class = "header_1_right_vertical"></div>
			<div class = "header_1_right_logOut">
				<img src = "/project/Img/logOut.png" class = "logOutImg">
				<span class = "logOutText" onclick = "location.href = '/project/LoginService/logoutService.jsp'">로그아웃</span>
			</div>
		</div>
		
		<div class = "header_2">
			<div class = "header_2_logo">
				<img src = "/project/Img/logoImg.png" style = "width : 115px; height : 42px; cursor : pointer;" onclick = "location.href = '/project/NiceChoice/niceChoice_Main.jsp'">
			</div>
			
			<div class = "header_2_banner">
				<!--<span onmouseover = "showLodgeManageBanner()" onmouseout="hideLodgeManageBanner()">숙소관리</span>-->
				<span onmouseover = "showReservateBanner()" onmouseout = "hideReservateBanner()">예약관리</span>
				<span onmouseover = "showNoticeBanner()" onmouseout="hideNoticeBanner()">고객행복센터</span>
				<span onmouseover = "showLodgmanageBanner()" onmouseout="hideLodgmanageBanner()" id = "roomRegist">내정보/숙소관리</span>
			</div>
			
		</div>
		
		<div class="notice_banner" id="notice_banner" onmouseover = "showNoticeBanner()" onmouseout="hideNoticeBanner()">
			<span class = "notice_banner_detail" onclick = "location.href = '/project/NiceChoice_Notice/niceChoice_notice.jsp'">
				공지사항
			</span> <br>
			
			<span class = "notice_banner_detail" onclick = "location.href = '/project/NiceChoice_QA/niceChoice_QA.jsp'">
				자주 묻는 질문
			</span> <br>
			
			<span class = "notice_banner_detail" onclick = "location.href = '/project/NiceChoice_Clause/niceChoice_Clause.jsp'">
				서비스 약관
			</span> <br>
		</div>
		
		<div class="reservate_banner" id="reservate_banner" onmouseover = "showReservateBanner()" onmouseout="hideReservateBanner()">
			<span class = "reservate_banner_detail">
				실시간 예약 관리
			</span> <br>
			
			<span class = "reservate_banner_detail">
				예약 내역
			</span> <br>
		</div>
		
		<div class="lodgeManage_banner" id="lodgeManage_banner" onmouseover = "showLodgmanageBanner()" onmouseout="hideLodgmanageBanner()">
			<span class = "lodgeManage_banner_detail" id = "myAndlodgmentInfo">
				내정보/업체정보
			</span> <br>
			
			<span class = "lodgeManage_banner_detail" id = "intro__">
				소개 작성
			</span> <br>
			
			<span class = "lodgeManage_banner_detail" id = "rule">
				이용규칙 관리
			</span> <br>
			
			<span class = "lodgeManage_banner_detail" id = "room">
				객실 관리
			</span>
		</div>

	</div>
</body>
</html>