<%@page import="DTO.LodgmentDTO"%>
<%@page import="DAO.MyInfoLookupDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	
	<link rel = "stylesheet" href = "niceChoice_hostIntro.css">
	<script src = "niceChoice_hostIntro.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	
	<%
		request.setCharacterEncoding("UTF-8");
		// 비정상적인 접근 차단
		if (session.getAttribute("hostEmail") == null) {
			out.print("<script>location.href = '/project/HostHouseAuth/hosthouseauth.jsp';</script>");
			return;
		} else if (request.getParameter("category") == null) {
			out.print("<script>location.href = '/project/HostHouseAuth/hosthouseauth.jsp';</script>");
			return;
		}
		
		String introByHost = "", wayToCome = "", nearbyFacility = "", lodgmentRule = "", dynamicCharge = "", parkingInfo = "", checklist = "";
		String[] convenienceFacilities = new String[300];
		
		// category에 따른 편의시설 서비스 안내 checkBox 세팅
		String category = request.getParameter("category");
		
		MyInfoLookupDAO myInfoDao = new MyInfoLookupDAO();
		LodgmentDTO lodgment = myInfoDao.lodgmentInfoLookup_2((String)session.getAttribute("hostEmail"));
		
		if (lodgment.getConvenienceFacility() != null)
			convenienceFacilities = lodgment.getConvenienceFacility().split(" ");
		else
			convenienceFacilities = null;
		
		if (lodgment.getIntroByHost() != null && lodgment.getWayToCome() != null && lodgment.getLodgmentRule() != null 
				&& lodgment.getDynamicCharge() != null && lodgment.getParkingInfo() != null && lodgment.getChecklist() != null) {
			introByHost = lodgment.getIntroByHost();
			wayToCome = lodgment.getWayToCome();
			nearbyFacility = lodgment.getNearByFacility();
			lodgmentRule = lodgment.getLodgmentRule();
			dynamicCharge = lodgment.getDynamicCharge();
			parkingInfo = lodgment.getParkingInfo();
			checklist = lodgment.getChecklist();
		}
	%>
	<script>
		// 저장된 값 세팅
		$(function() {
			$(document).ready(function() {
			<%	if (convenienceFacilities != null) {
				for (int cnt = 0; cnt < convenienceFacilities.length; cnt++) {%>
					$("input[value=<%= convenienceFacilities[cnt] %>]").prop("checked", true);	
				<%
				}%>				
			<%}%>
				
				$("#introByHost").val("<%= introByHost %>");
				$("#wayToCome").val("<%= wayToCome %>");
				$("#nearbyFacility").val("<%= nearbyFacility %>");
				$("#lodgmentRule").val("<%= lodgmentRule %>");
				$("#dynamicCharge").val("<%= dynamicCharge %>");
				$("#parkingInfo").val("<%= parkingInfo %>");
				$("#checklist").val("<%= checklist %>");
			});
		});
		
		// 숙박업체 이미지 추가
		$(function() {
			$(".imageSaveBtn").on("click", function() {
				const imageInput = $("#imageInput")[0];
				
				console.log(imageInput);
				if (imageInput.files.length == 0) {
					alert("이미지가 선택되지 않았습니다.");
					return;
				}
				
				const formData = new FormData();
				for (var cnt = 0; cnt < 20; cnt++) {
					formData.append("image" + (cnt + 1), imageInput.files[cnt]);
				}
				
				$.ajax({
					type : "POST",
					url : "/project/RegistService/lodgmentImageRegist.jsp",
					processData : false,
					contentType : false,
					data : formData,
					success : function(data) {
						$(".filebox").load(location.href + " .filebox");
						alert(data);
					},
					err : function(err) {
						alert("등록 실패. 관리자에게 문의하세요.");
					}
				});
			});
		});
	</script>
</head>

<body>
	<%@ include file = "/NiceChoice/niceChoice_Header.jsp" %>
	
	<div class = "hostIntro_center">
		<div class="todo_Area">
			<div class="first">
				<img src="/project/Img/first.png" class="firstImg"> <br>
				마이페이지 <br> 업체 정보 등록
			</div>

			<div class="second">
				<img src="/project/Img/second.png" class="secondImg"> <br>
				소개 작성
			</div>

			<div class="third">
				<img src="/project/Img/third.png" class="thirdImg"> <br>
				이용규칙 관리
			</div>

			<div class="fourth">
				<img src="/project/Img/fourth.png" class="fourthImg"> <br>
				객실 관리
			</div>
		</div>
		
		<div style = "height : 18px;"> <!-- white Space Area --> </div>
		
		<div class = "updateHostIntro">
			<div class = "introText_1">
				<span>
					● [소개 작성] 은 게스트하우스 전체를 소개하는 기능입니다. (사진, 이벤트 정보, 오시는 길 등)
				</span>
			</div>
			
			<div class = "introText_2">
				<span>
					[필수 기입 정보]
				</span>
			</div>
			
			<div>
				<form id = "lodgmentRegForm" method = "POST">
					<table>
						<tr>
							<th rowspan = "2">업체 이미지<br>(최대 5장)</th>
						</tr>
						
						<tr>
							<td width = 100>
								<div class = "filebox">
									<label for = "imageInput" class = "imageAddBtn">이미지 추가</label>
    								<input type = "file" id = "imageInput" name = "imageInput" multiple style = "display : none;">
								</div>
								<div class = "buttonBox">
    								<button type = "button" class = "imageSaveBtn">이미지 저장</button>
    							</div>
    							<label class = "imageInfoText">* 추가 버튼으로 이미지 선택 후 저장 버튼을 누르세요.</label>
							</td>
						</tr>
						
						<tr>
							<th>편의시설<br>서비스 안내</th>
								
							<td>
							<!-- <label><input type = "checkbox" name = "facilities" value = "주방/식당">주방/식당</label>  -->
								<% if (category.equals("모텔")) {%>
								<span class = "facility">
									<label><input type = "checkbox" name = "facilities" value = "무인텔">무인텔</label>
									<label><input type = "checkbox" name = "facilities" value = "파티룸">파티룸</label>
									<label><input type = "checkbox" name = "facilities" value = "거울룸">거울룸</label>
									<label><input type = "checkbox" name = "facilities" value = "복층룸">복층룸</label>
									<label><input type = "checkbox" name = "facilities" value = "공주룸">공주룸</label>
									<label><input type = "checkbox" name = "facilities" value = "트윈베드">트윈베드</label>
									<label><input type = "checkbox" name = "facilities" value = "야외테라스">야외테라스</label>
									<label><input type = "checkbox" name = "facilities" value = "바다뷰">바다뷰</label>
									<label><input type = "checkbox" name = "facilities" value = "호수뷰">호수뷰</label>
									<label><input type = "checkbox" name = "facilities" value = "하늘뷰">하늘뷰</label>
									<label><input type = "checkbox" name = "facilities" value = "스파/월풀">스파/월풀</label>
									<label><input type = "checkbox" name = "facilities" value = "사우나/찜질방">사우나/찜질방</label>
									<label><input type = "checkbox" name = "facilities" value = "맛사지베드">맛사지베드</label>
									<label><input type = "checkbox" name = "facilities" value = "히노끼탕">히노끼탕</label>
									<label><input type = "checkbox" name = "facilities" value = "노천탕">노천탕</label>
									<label><input type = "checkbox" name = "facilities" value = "반신욕">반신욕</label>
									<label><input type = "checkbox" name = "facilities" value = "욕실TV">욕실TV</label>
									<label><input type = "checkbox" name = "facilities" value = "수영장">수영장</label>
									<label><input type = "checkbox" name = "facilities" value = "노래방">노래방</label>
									<label><input type = "checkbox" name = "facilities" value = "당구대">당구대</label>
									<label><input type = "checkbox" name = "facilities" value = "게임기">게임기</label>
									<label><input type = "checkbox" name = "facilities" value = "안마의자">안마의자</label>
									<label><input type = "checkbox" name = "facilities" value = "커플PC">커플PC</label>
									<label><input type = "checkbox" name = "facilities" value = "미니바">미니바</label>
									<label><input type = "checkbox" name = "facilities" value = "3DTV">3DTV</label>
									<label><input type = "checkbox" name = "facilities" value = "빔프로젝터">빔프로젝터</label>
								</span>
								<%
								} else if (category.equals("호텔/리조트")) {%>
								<span class = "facility">
									<label><input type = "checkbox" name = "facilities" value = "피트니스">피트니스</label>
									<label><input type = "checkbox" name = "facilities" value = "수영장">수영장</label>
									<label><input type = "checkbox" name = "facilities" value = "사우나">사우나</label>
									<label><input type = "checkbox" name = "facilities" value = "골프장">골프장</label>
									<label><input type = "checkbox" name = "facilities" value = "레스토랑">레스토랑</label>
									<label><input type = "checkbox" name = "facilities" value = "엘리베이터">엘리베이터</label>
									<label><input type = "checkbox" name = "facilities" value = "라운지">라운지</label>
									<label><input type = "checkbox" name = "facilities" value = "공용PC">공용PC</label>
									<label><input type = "checkbox" name = "facilities" value = "BBQ">BBQ</label>
									<label><input type = "checkbox" name = "facilities" value = "카페">카페</label>
									<label><input type = "checkbox" name = "facilities" value = "공용스파">공용스파</label>
									<label><input type = "checkbox" name = "facilities" value = "족구장">족구장</label>
									<label><input type = "checkbox" name = "facilities" value = "세미나실">세미나실</label>
									<label><input type = "checkbox" name = "facilities" value = "편의점">편의점</label>
									<label><input type = "checkbox" name = "facilities" value = "노래방">노래방</label>
									<label><input type = "checkbox" name = "facilities" value = "주방/식당">주방/식당</label>
									<label><input type = "checkbox" name = "facilities" value = "세탁기">세탁기</label>
									<label><input type = "checkbox" name = "facilities" value = "건조기">건조기</label>
									<label><input type = "checkbox" name = "facilities" value = "탈수기">탈수기</label>
									<label><input type = "checkbox" name = "facilities" value = "주차장">주차장</label>
									<label><input type = "checkbox" name = "facilities" value = "취사가능">취사가능</label>
									<label><input type = "checkbox" name = "facilities" value = "공용샤워실">공용샤워실</label>
									<label><input type = "checkbox" name = "facilities" value = "온천">온천</label>
									<label><input type = "checkbox" name = "facilities" value = "스키장">스키장</label>
									<label><input type = "checkbox" name = "facilities" value = "객실스파">객실스파</label>
									<label><input type = "checkbox" name = "facilities" value = "미니바">미니바</label>
									<label><input type = "checkbox" name = "facilities" value = "와이파이">와이파이</label>
									<label><input type = "checkbox" name = "facilities" value = "욕실용품">욕실용품</label>
									<label><input type = "checkbox" name = "facilities" value = "TV">TV</label>
									<label><input type = "checkbox" name = "facilities" value = "에어컨">에어컨</label>
									<label><input type = "checkbox" name = "facilities" value = "냉장고">냉장고</label>
									<label><input type = "checkbox" name = "facilities" value = "객실샤워실">객실샤워실</label>
									<label><input type = "checkbox" name = "facilities" value = "욕조">욕조</label>
									<label><input type = "checkbox" name = "facilities" value = "드라이기">드라이기</label>
									<label><input type = "checkbox" name = "facilities" value = "다리미">다리미</label>
									<label><input type = "checkbox" name = "facilities" value = "전기밥솥">전기밥솥</label>
									<label><input type = "checkbox" name = "facilities" value = "반려견동반">반려견동반</label>
									<label><input type = "checkbox" name = "facilities" value = "조식포함">조식포함</label>
									<label><input type = "checkbox" name = "facilities" value = "객실내흡연">객실내흡연</label>
									<label><input type = "checkbox" name = "facilities" value = "발렛파킹">발렛파킹</label>
									<label><input type = "checkbox" name = "facilities" value = "금연">금연</label>
									<label><input type = "checkbox" name = "facilities" value = "객실내취사">객실내취사</label>
									<label><input type = "checkbox" name = "facilities" value = "프린터사용">프린터사용</label>
									<label><input type = "checkbox" name = "facilities" value = "짐보관가능">짐보관가능</label>
									<label><input type = "checkbox" name = "facilities" value = "개인사물함">개인사물함</label>
									<label><input type = "checkbox" name = "facilities" value = "무료주차">무료주차</label>
									<label><input type = "checkbox" name = "facilities" value = "픽업가능">픽업가능</label>
									<label><input type = "checkbox" name = "facilities" value = "캠프파이어">캠프파이어</label>
									<label><input type = "checkbox" name = "facilities" value = "카드결제">카드결제</label>
									<label><input type = "checkbox" name = "facilities" value = "장애인편의시설">장애인편의시설</label>
								</span>
								<%
								} else if (category.equals("펜션")) {%>
								<span class = "facility">
									<label><input type = "checkbox" name = "facilities" value = "수영장">수영장</label>
									<label><input type = "checkbox" name = "facilities" value = "BBQ">BBQ</label>
									<label><input type = "checkbox" name = "facilities" value = "족구장">족구장</label>
									<label><input type = "checkbox" name = "facilities" value = "세미나실">세미나실</label>
									<label><input type = "checkbox" name = "facilities" value = "노래방">노래방</label>
									<label><input type = "checkbox" name = "facilities" value = "공용스파">공용스파</label>
									<label><input type = "checkbox" name = "facilities" value = "라운지">라운지</label>
									<label><input type = "checkbox" name = "facilities" value = "공용PC">공용PC</label>
									<label><input type = "checkbox" name = "facilities" value = "카페">카페</label>
									<label><input type = "checkbox" name = "facilities" value = "피트니스">피트니스</label>
									<label><input type = "checkbox" name = "facilities" value = "사우나">사우나</label>
									<label><input type = "checkbox" name = "facilities" value = "골프장">골프장</label>
									<label><input type = "checkbox" name = "facilities" value = "레스토랑">레스토랑</label>
									<label><input type = "checkbox" name = "facilities" value = "편의점">편의점</label>
									<label><input type = "checkbox" name = "facilities" value = "주방/식당">주방/식당</label>
									<label><input type = "checkbox" name = "facilities" value = "놀이방">놀이방</label>
									<label><input type = "checkbox" name = "facilities" value = "세탁기">세탁기</label>
									<label><input type = "checkbox" name = "facilities" value = "건조기">건조기</label>
									<label><input type = "checkbox" name = "facilities" value = "탈수기">탈수기</label>
									<label><input type = "checkbox" name = "facilities" value = "주차장">주차장</label>
									<label><input type = "checkbox" name = "facilities" value = "취사가능">취사가능</label>
									<label><input type = "checkbox" name = "facilities" value = "스키장">스키장</label>
									<label><input type = "checkbox" name = "facilities" value = "전자레인지">전자레인지</label>
									<label><input type = "checkbox" name = "facilities" value = "엘레베이터">엘레베이터</label>
									<label><input type = "checkbox" name = "facilities" value = "와이파이">와이파이</label>
									<label><input type = "checkbox" name = "facilities" value = "객실스파">객실스파</label>
									<label><input type = "checkbox" name = "facilities" value = "전기밥솥">전기밥솥</label>
									<label><input type = "checkbox" name = "facilities" value = "TV">TV</label>
									<label><input type = "checkbox" name = "facilities" value = "욕실용품">욕실용품</label>
									<label><input type = "checkbox" name = "facilities" value = "세면도구">세면도구</label>
									<label><input type = "checkbox" name = "facilities" value = "미니바">미니바</label>
									<label><input type = "checkbox" name = "facilities" value = "에어컨">에어컨</label>
									<label><input type = "checkbox" name = "facilities" value = "냉장고">냉장고</label>
									<label><input type = "checkbox" name = "facilities" value = "객실샤워실">객실샤워실</label>
									<label><input type = "checkbox" name = "facilities" value = "욕조">욕조</label>
									<label><input type = "checkbox" name = "facilities" value = "드라이기">드라이기</label>
									<label><input type = "checkbox" name = "facilities" value = "다리미">다리미</label>
									<label><input type = "checkbox" name = "facilities" value = "픽업가능">픽업가능</label>
									<label><input type = "checkbox" name = "facilities" value = "객실내취사">객실내취사</label>
									<label><input type = "checkbox" name = "facilities" value = "프린터사용">프린터사용</label>
									<label><input type = "checkbox" name = "facilities" value = "짐보관가능">짐보관가능</label>
									<label><input type = "checkbox" name = "facilities" value = "개인사물함">개인사물함</label>
									<label><input type = "checkbox" name = "facilities" value = "무료주차">무료주차</label>
									<label><input type = "checkbox" name = "facilities" value = "조식포함">조식포함</label>
									<label><input type = "checkbox" name = "facilities" value = "객실내흡연">객실내흡연</label>
									<label><input type = "checkbox" name = "facilities" value = "발렛파킹">발렛파킹</label>
									<label><input type = "checkbox" name = "facilities" value = "금연">금연</label>
									<label><input type = "checkbox" name = "facilities" value = "반려견동반">반려견동반</label>
									<label><input type = "checkbox" name = "facilities" value = "카드결제">카드결제</label>
									<label><input type = "checkbox" name = "facilities" value = "캠프파이어">캠프파이어</label>
									<label><input type = "checkbox" name = "facilities" value = "장애인편의시설">장애인편의시설</label>
								</span>
								<%
								} else if (category.equals("게스트하우스")) {%>
								<span class = "facility">
									<label><input type = "checkbox" name = "facilities" value = "세탁기">세탁기</label>
									<label><input type = "checkbox" name = "facilities" value = "라운지">라운지</label>
									<label><input type = "checkbox" name = "facilities" value = "주방/식당">주방/식당</label>
									<label><input type = "checkbox" name = "facilities" value = "건조기">건조기</label>
									<label><input type = "checkbox" name = "facilities" value = "탈수기">탈수기</label>
									<label><input type = "checkbox" name = "facilities" value = "엘레베이터">엘레베이터</label>
									<label><input type = "checkbox" name = "facilities" value = "주차장">주차장</label>
									<label><input type = "checkbox" name = "facilities" value = "공용PC">공용PC</label>
									<label><input type = "checkbox" name = "facilities" value = "BBQ">BBQ</label>
									<label><input type = "checkbox" name = "facilities" value = "카페">카페</label>
									<label><input type = "checkbox" name = "facilities" value = "전자레인지">전자레인지</label>
									<label><input type = "checkbox" name = "facilities" value = "취사가능">취사가능</label>
									<label><input type = "checkbox" name = "facilities" value = "와이파이">와이파이</label>
									<label><input type = "checkbox" name = "facilities" value = "개인콘센트">개인콘센트</label>
									<label><input type = "checkbox" name = "facilities" value = "욕실용품">욕실용품</label>
									<label><input type = "checkbox" name = "facilities" value = "에어컨">에어컨</label>
									<label><input type = "checkbox" name = "facilities" value = "냉장고">냉장고</label>
									<label><input type = "checkbox" name = "facilities" value = "객실샤워실">객실샤워실</label>
									<label><input type = "checkbox" name = "facilities" value = "욕조">욕조</label>
									<label><input type = "checkbox" name = "facilities" value = "드라이기">드라이기</label>
									<label><input type = "checkbox" name = "facilities" value = "다리미">다리미</label>
									<label><input type = "checkbox" name = "facilities" value = "TV">TV</label>
									<label><input type = "checkbox" name = "facilities" value = "조식포함">조식포함</label>
									<label><input type = "checkbox" name = "facilities" value = "개인사물함">개인사물함</label>
									<label><input type = "checkbox" name = "facilities" value = "객실내흡연">객실내흡연</label>
									<label><input type = "checkbox" name = "facilities" value = "반려견동반">반려견동반</label>
									<label><input type = "checkbox" name = "facilities" value = "짐보관가능">짐보관가능</label>
									<label><input type = "checkbox" name = "facilities" value = "프린터사용">프린터사용</label>
									<label><input type = "checkbox" name = "facilities" value = "무료주차">무료주차</label>
									<label><input type = "checkbox" name = "facilities" value = "카드결제">카드결제</label>
								</span>
								<%
								} else if (category.equals("캠핑/글램핑")) {%>
								<span class = "facility">
									<label><input type = "checkbox" name = "facilities" value = "전기사용가능">전기사용가능</label>
									<label><input type = "checkbox" name = "facilities" value = "BBQ">BBQ</label>
									<label><input type = "checkbox" name = "facilities" value = "개수대">개수대</label>
									<label><input type = "checkbox" name = "facilities" value = "공용샤워실">공용샤워실</label>
									<label><input type = "checkbox" name = "facilities" value = "인터넷">인터넷</label>
									<label><input type = "checkbox" name = "facilities" value = "매점">매점</label>
									<label><input type = "checkbox" name = "facilities" value = "공용화장실">공용화장실</label>
									<label><input type = "checkbox" name = "facilities" value = "물놀이시설">물놀이시설</label>
									<label><input type = "checkbox" name = "facilities" value = "카페">카페</label>
									<label><input type = "checkbox" name = "facilities" value = "편의점">편의점</label>
									<label><input type = "checkbox" name = "facilities" value = "노래방">노래방</label>
									<label><input type = "checkbox" name = "facilities" value = "주방/식당">주방/식당</label>
									<label><input type = "checkbox" name = "facilities" value = "세탁기">세탁기</label>
									<label><input type = "checkbox" name = "facilities" value = "건조기">건조기</label>
									<label><input type = "checkbox" name = "facilities" value = "탈수기">탈수기</label>
									<label><input type = "checkbox" name = "facilities" value = "공용PC">공용PC</label>
									<label><input type = "checkbox" name = "facilities" value = "주차장">주차장</label>
									<label><input type = "checkbox" name = "facilities" value = "라운지">라운지</label>
									<label><input type = "checkbox" name = "facilities" value = "전자레인지">전자레인지</label>
									<label><input type = "checkbox" name = "facilities" value = "취사가능">취사가능</label>
									<label><input type = "checkbox" name = "facilities" value = "객실샤워실">객실샤워실</label>
									<label><input type = "checkbox" name = "facilities" value = "드라이기">드라이기</label>
									<label><input type = "checkbox" name = "facilities" value = "와이파이">와이파이</label>
									<label><input type = "checkbox" name = "facilities" value = "TV">TV</label>
									<label><input type = "checkbox" name = "facilities" value = "욕실용품">욕실용품</label>
									<label><input type = "checkbox" name = "facilities" value = "미니바">미니바</label>
									<label><input type = "checkbox" name = "facilities" value = "에어컨">에어컨</label>
									<label><input type = "checkbox" name = "facilities" value = "냉장고">냉장고</label>
									<label><input type = "checkbox" name = "facilities" value = "욕조">욕조</label>
									<label><input type = "checkbox" name = "facilities" value = "다리미">다리미</label>
									<label><input type = "checkbox" name = "facilities" value = "전기밥솥">전기밥솥</label>
									<label><input type = "checkbox" name = "facilities" value = "객실스파">객실스파</label>
									<label><input type = "checkbox" name = "facilities" value = "세면도구">세면도구</label>
									<label><input type = "checkbox" name = "facilities" value = "장비대여">장비대여</label>
									<label><input type = "checkbox" name = "facilities" value = "사이트주차">사이트주차</label>
									<label><input type = "checkbox" name = "facilities" value = "카드결제">카드결제</label>
									<label><input type = "checkbox" name = "facilities" value = "조식포함">조식포함</label>
									<label><input type = "checkbox" name = "facilities" value = "객실내흡연">객실내흡연</label>
									<label><input type = "checkbox" name = "facilities" value = "발렛파킹">발렛파킹</label>
									<label><input type = "checkbox" name = "facilities" value = "반려견동반">반려견동반</label>
									<label><input type = "checkbox" name = "facilities" value = "객실내취사">객실내취사</label>
									<label><input type = "checkbox" name = "facilities" value = "픽업가능">픽업가능</label>
									<label><input type = "checkbox" name = "facilities" value = "캠프파이어">캠프파이어</label>
									<label><input type = "checkbox" name = "facilities" value = "금연">금연</label>
								</span>
								<%
								}%>
							</td>
						</tr>
						
						<tr>
							<th>사장님 한마디</th>
							<td>
								<textarea rows = "20" cols = "80" placeholder = "숙박업소(호스트)의 소개글을 작성해주세요!" id = "introByHost" name = "introByHost"></textarea>
							</td>
						</tr>
						
						<tr>
							<th>오시는길</th>
							<td>
								<textarea rows = "20" cols = "80" placeholder = "주요 버스터미널, 기차역, 공항 등 숙소까지 찾아가는 자세한 방법을 기재해주세요!" id = "wayToCome" name = "wayToCome"></textarea>
							</td>
						</tr>
						
						<tr>
							<th>주변 정보</th>
							<td>
								<textarea rows = "20" cols = "80" placeholder = "숙소 주변의 명소를 홍보하여 주세요!" id = "nearbyFacility" name = "nearbyFacility"></textarea>
							</td>
						</tr>
						
						<tr>
							<th>숙소 이용<br>규칙</th>
							<td>
								<textarea rows = "20" cols = "80" placeholder = "숙소 내 필수 이용규칙이 있을 경우 기재해주세요!" id = "lodgmentRule" name = "lodgmentRule"></textarea>
							</td>
						</tr>

						<tr>
							<th>현장요금 추가정보</th>
							<td>
								<textarea rows = "20" cols = "80" placeholder = "숙소에서 제공되는 숙박비 외의 유료 서비스가 있을 경우 가격정보와 함께 항목을 기재해주세요!" id = "dynamicCharge" name = "dynamicCharge"></textarea>
							</td>
						</tr>

						<tr>
							<th>주차장 정보</th>
							<td><textarea rows="20" cols="80" placeholder="주차장 유/무료 정보 및 시간당 요금을 기재해주세요." id = "parkingInfo" name = "parkingInfo"></textarea>
							</td>
						</tr>

						<tr>
							<th>확인 사항<br>및 기타</th>
							<td><textarea rows="20" cols="80" placeholder="기재된 숙소 정보 외에 게스트 숙지 사항을 기재해주세요." id = "checklist" name = "checklist"></textarea>
							</td>
						</tr>
					</table>
					
					<div class = "regBtnArea">
						<button type = "button" class = "regBtn" onclick = "verify()">저장 후 다음단계</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<%@ include file="/NiceChoice/niceChoice_footer.jsp"%>
</body>
</html>