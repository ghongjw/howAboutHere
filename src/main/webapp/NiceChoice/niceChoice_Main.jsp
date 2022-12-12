<%@page import="DTO.NoticeDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>여기어때 호스트 하우스</title>
	<link rel = "stylesheet" href = "niceChoice_Main.css">
	<%
		if (session.getAttribute("hostEmail") == null) {
			out.print("<script>location.href = '/project/HostHouseAuth/hosthouseauth.jsp';</script>");
			return;
		}
	
		NoticeDAO notice = new NoticeDAO();
		ArrayList<NoticeDTO> notices = notice.getMainDocumentNotice();
	%>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script>
		$(function() {
			$(".moreNotice").on("click", function() {
				location.href = "/project/NiceChoice_Notice/niceChoice_notice.jsp";
			});
			
			<% for(int cnt = 0; cnt < 6; cnt++) {%>
				$(".notice_body<%= cnt %>").css("cursor", "pointer");
				$(".notice_body<%= cnt %>").css("margin-left", "15px");
			
				$(".notice_body<%= cnt %>").on("click", function() {
					location.href = "/project/NiceChoice_Notice/niceChoice_noticeDetail.jsp?title=" + "<%= notices.get(cnt).getTitle() %>" + "&noticetext=" + "<%= notices.get(cnt).getNoticeText() %>";
				});
			<%}%>
		});
	</script>
</head>
<body>
	<%@ include file = "niceChoice_Header.jsp" %>
	
	<section id = "main_wrap">
		<div class = "main_top">
			<h1>아래 정보를 모두 입력하시고 숙소 등록을 완료하세요.</h1>
			
			<button class = "registButton" onclick = "location.href = '/project/NiceChoice_MyPage/niceChoice_MyPage.jsp'">업체 정보 등록 ></button>
			
			<div class = "todo_Area">
				<div class = "first">
					<img src = "/project/Img/first.png" class = "firstImg"> <br>
					마이페이지 <br>
					업체 정보 등록
				</div>
				
				<div class = "second">
					<img src = "/project/Img/second.png" class = "secondImg"> <br>
					소개 작성
				</div>
				
				<div class = "third">
					<img src = "/project/Img/third.png" class = "thirdImg"> <br>
					이용규칙 관리
				</div>
				
				<div class = "fourth">
					<img src = "/project/Img/fourth.png" class = "fourthImg"> <br>
					객실 관리
				</div>
			</div>
		</div>
		
		<div class = "mainSpot">
			<img src = "/project/Img/mainSpot.png">
		</div>
		
		<div class = "bottom_Area">
			<div class = "bottom_Area_noticeArea">
				<div class = "notice_header">
					<span class = "noticeText">공지사항</span>
					<span class = "moreNotice">더보기 ></span>
				</div>
				<hr>
				
				<% for (int cnt = 0; cnt < 6; cnt++) {%>
					<div class = "notice_body<%=cnt%>">
						<span>
							<%= notices.get(cnt).getTitle() %> <br>
						</span>
						
						<span>
							<%= notices.get(cnt).getNoticeTime() %>
						</span>
					</div> <hr>
				<%} %>
			</div>
			
			<div class = "bottom_Area_roomStatusArea">
				<div class = "roomStatusHeader">
					<span>
						예약 객실 판매 >
					</span>
				</div>
				<div class = "roomStatusBody">
					<table>
						<tr>
							<td>0</td>
							<td>0</td>
							<td>0</td>
						</tr>
						
						<tr>
							<td>오늘</td>
							<td>이번주</td>
							<td>이번달</td>
						</tr>
					</table>
				</div>
			</div>
			
			<div class = "noUseArea">
				<p>준비중입니다 ㅡㅢ</p>
			</div>
			
			<div class = "reservation_table">
				<table>
					<tr>
						<td colspan = "2" class = "reservation_table_title"> 입실 예정 고객정보</td>
						<td colspan = "2" style = "text-align : left;">오늘 날짜</td>
						<td colspan = "2" class = "moreReservationText" style = "text-align : right;">더보기 ></td>
					</tr>
					
					<tr>
						<th>예약번호</th>
						<th>객실명</th>
						<th>예약자</th>
						<th>전화번호</th>
						<th>사용기간</th>
						<th>예약확인</th>
					</tr>
					<tr>
						<td colspan = "6">
							<hr>
						</td>
					</tr>
					
					<tr>
						<td>1</td>
						<td>2</td>
						<td>3</td>
						<td>4</td>
						<td>5</td>
						<td>6</td>
					</tr>
					<tr>
						<td>1</td>
						<td>2</td>
						<td>3</td>
						<td>4</td>
						<td>5</td>
						<td>6</td>
					</tr>
					<tr>
						<td>1</td>
						<td>2</td>
						<td>3</td>
						<td>4</td>
						<td>5</td>
						<td>6</td>
					</tr>
				</table>
			</div>
		</div>
		<br><br>
	</section>
	<%@ include file = "niceChoice_footer.jsp" %>
</body>
</html>