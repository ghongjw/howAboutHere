<%@page import="DTO.LodgmentDTO"%>
<%@page import="DAO.MyInfoLookupDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<%
		MyInfoLookupDAO myInfo = new MyInfoLookupDAO();
		LodgmentDTO lodgment = myInfo.lodgmentInfoLookup_3((String)session.getAttribute("hostEmail"));
	
		String inTime = "", outTime = "", deadlineTime = "";
		if (lodgment.getInTime() != null && lodgment.getOutTime() != null && lodgment.getDeadlineTime() != null) {
			inTime = lodgment.getInTime();
			outTime = lodgment.getOutTime();
			deadlineTime = lodgment.getDeadlineTime();
		}
		
	%>
	<link rel = "stylesheet" href = "/project/NiceChoice_HostTime/niceChoice_HostTime.css">
	<script src = "/project/NiceChoice_HostTime/niceChoice_HostTime.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script>
		$(function() {
			$(document).ready(function() {
				$("#inTime").val("<%= inTime %>").prop("selected", true);
				$("#outTime").val("<%= outTime %>").prop("selected", true);
				$("#deadlineTime").val("<%= deadlineTime %>").prop("selected", true);
			});
		});
	</script>
</head>
<body>
	<%@ include file = "/NiceChoice/niceChoice_Header.jsp" %>
	<div class = "hostTime_center">
		<div class="todo_Area">
			<div class="firs t">
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
		
		<div class = "updateHostTime">
			<div class = "timeText_1">
				<span>
					● [이용규칙 관리] 는 체크인/아웃 및 마감시간을 설정하시는 기능입니다.
				</span>
			</div> <br>
			
			<div>
				<form id = "lodgmentRegForm">
					<table>
						<tr>
							<th rowspan = "2">이용시간</th>
							<td>
								<span class = "timeText_2">체크인 가능시간</span>
								<select id = "inTime" name = "inTime">
									<option value = "13">오후 01:00</option>
									<option value = "14">오후 02:00</option>
									<option value = "15">오후 03:00</option>
									<option value = "16">오후 04:00</option>
									<option value = "17">오후 05:00</option>
									<option value = "18">오후 06:00</option>
									<option value = "19">오후 07:00</option>
									<option value = "20">오후 08:00</option>
								</select>
							</td>
						</tr>
						
						<tr>
							<td>
								<span class = "timeText_2">체크아웃 완료시간</span>
								<select id = "outTime" name = "outTime">
									<option value = "10">오전 10:00</option>
									<option value = "11">오전 11:00</option>
									<option value = "12">오후 12:00</option>
									<option value = "13">오후 01:00</option>
									<option value = "14">오후 02:00</option>
									<option value = "15">오후 03:00</option>
									<option value = "16">오후 04:00</option>
									<option value = "17">오후 05:00</option>
								</select>
							</td>
						</tr>
						
						<tr>
							<th>예약 마감<br>시간 설정
							<td>
								<select class = "endOfReservate" id = "deadlineTime" name = "deadlineTime">
									<option value = "12">오후 12:00</option>
									<option value = "13">오후 01:00</option>
									<option value = "14">오후 02:00</option>
									<option value = "15">오후 03:00</option>
									<option value = "16">오후 04:00</option>
									<option value = "17">오후 05:00</option>
									<option value = "18">오후 06:00</option>
									<option value = "19">오후 07:00</option>
									<option value = "20">오후 08:00</option>
									<option value = "21">오후 09:00</option>
									<option value = "22">오후 10:00</option>
									<option value = "23">오후 11:00</option>
									<option value = "24">오전 12:00</option>
									<option value = "1">오전 01:00</option>
									<option value = "2">오전 02:00</option>
								</select>
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
	<%@ include file = "/NiceChoice/niceChoice_footer.jsp" %>
</body>
</html>