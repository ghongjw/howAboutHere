<%@page import="DTO.RoomInfoDTO"%>
<%@page import="DAO.MyInfoLookupDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<link rel = "stylesheet" href = "/project/NiceChoice_RoomManage/niceChoice_RoomManage.css">
	<script src = "/project/NiceChoice_RoomManage/niceChoice_RoomManage.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<%
		if (session.getAttribute("hostEmail") == null) {
			out.print("<script>location.href = '/project/HostHouseAuth/hosthouseauth.jsp';</script>");
			return;
		}
	%>
	
	<script>
		$(function() {
			$(".imageSaveBtn").on("click", function() {
				const imageInput = $("#imageInput")[0];
				const roomName = $("#roomName").val();
				
				console.log(imageInput);
				if (imageInput.files.length == 0) {
					alert("이미지가 선택되지 않았습니다.");
					return;
				} else if (roomName == "") {
					alert("객실명을 입력하신 후 이미지를 추가해주세요.");
					return;
				}
				
				const formData = new FormData();
				for (var cnt = 0; cnt < 20; cnt++) {
					formData.append("image" + (cnt + 1), imageInput.files[cnt]);
				}
				
				formData.append("roomName", roomName);
				
				$.ajax({
					type : "POST",
					url : "/project/RegistService/roomImageRegist.jsp?roomName=" + roomName,
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
	<div class = "roomManage_center">
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
		
		<div class = "roomManageArea">
			<div class = "roomManageText">
				<span>
					● [객실 관리] 는 객실을 추가등록 하실 때 사용하시는 기능입니다. (* 기존 등록하신 객실 수정/삭제는 관리자에게 요청하세요. )
				</span>
			</div> <br>
			
			<form id = "roomInfoRegForm" method = "POST">
				<table>
					<tr>
						<th>객실 정보</th>
						
						<td>
							<div class = "roomInfo">
								<span class = "roomInfoText">객실명</span>
								<input type = "text" placeholder = "이름을 입력하세요." id = "roomName" name = "roomName">
							</div>
							
							<div class = "roomInfo">
								<span class = "roomInfoText">객실 유형</span>
								<input type = "text" placeholder = "객실 유형을 입력하세요." id = "roomType" name = "roomType">
							</div>
							
							<div class = "roomInfo">
								<span class = "roomInfoText">객실 개수</span>
								<input type = "text" placeholder = "객실 개수를 입력하세요.(* 숫자만 입력)" id = "roomCount" name = "roomCount">
							</div>
							
							<div class = "roomInfo">
								<span class = "roomInfoText">인원</span>
								<input type = "text" placeholder = "최대 입장 가능한 인원을 입력하세요.(* 숫자만 입력)" id = "capacity" name = "capacity">
							</div>
						</td>
					</tr>
					
					<tr>
						<th>이미지 정보<br>(최대 1장)</th>
						
						<td height = 65>
							<div class = "filebox">
								<label for = "imageInput" class = "imageAddBtn">이미지 추가</label>
    							<input type = "file" id = "imageInput" name = "imageInput" style = "display : none;">
							</div>
							
							<div class = "buttonBox">
    							<button type = "button" class = "imageSaveBtn">이미지 저장</button>
    						</div>
    						
    						<label class = "imageInfoText">* 추가 버튼으로 이미지 선택 후 저장 버튼을 누르세요.</label>
						</td>
					</tr>
					
					<tr>
						<th>객실 소개글</th>
						<td>
							<textarea placeholder = "객실 내 침대 구성과, 전용 욕실 여부 등 객실 소개/구성을 자세히 기재해 주세요." id = "roomIntro" name = "roomIntro"></textarea>
						</td>
					</tr>
					
					<tr>
						<th>편의시설</th>
						<td>
							<textarea placeholder = "편의시설에 대한 설명을 기재해주세요." id = "convenienceFacility" name = "convenienceFacility"></textarea>
						</td>
					</tr>
					
					<tr>
						<th>대실 가격</th>
						<td>
							<div class = "priceArea">
								<span class = "priceText">요금 :</span> 
								<input type = "text" placeholder = "요금 입력(* 숫자만 입력)" class = "priceInputArea" id = "lentPrice" name = "lentPrice">
							</div>
						</td>
					</tr>
					
					<tr>
						<th>숙박 가격</th>
						<td>
							<div class = "priceArea">
								<span class = "priceText">요금 :</span> 
								<input type = "text" placeholder = "요금 입력(* 숫자만 입력)" class = "priceInputArea" id = "onenightPrice" name = "onenightPrice">
							</div>
						</td>
					</tr>
				</table>
				
				<div class = "regBtnArea">
					<button type = "button" class = "regBtn" onclick = "verify()">저장/추가</button>
				</div>
			</form>
		</div>
	</div>
	<%@ include file = "/NiceChoice/niceChoice_footer.jsp" %>
</body>
</html>