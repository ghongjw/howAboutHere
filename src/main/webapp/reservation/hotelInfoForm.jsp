<%@page import="Lodgement.RoomDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Lodgement.LodgementDTO"%>
<%@page import="main_dateset.datecitiset"%>
<%@page import="Lodgement.RoomDAO"%>
<%@page import="Lodgement.LodgementDAO"%>
<%@page import="java.io.File"%>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript" src=../js/search.js></script>
<meta charset="UTF-8">
<title>요기어때</title>
<%@ include file="../index/main_header.jsp"%>
<link rel="stylesheet" href="../css/randui.css">
<link rel="stylesheet" href="../css/common.css">
<link rel="stylesheet" href="../css/hotelInfo.css" />
<script src="./datePicker.js"></script>
<script src="../js/hotelInfo.js"></script>
<link rel="stylesheet" href="../css/filter.css" />
<meta charset="UTF-8">

<!--  헤더 스크롤 js -->
<script
	src=https://www.goodchoice.kr/js/service/common.js?rand=1664413250></script>
<%
request.setCharacterEncoding("UTF-8");
// 데이트피커 값
String regervation = request.getParameter("datefilter");
// 몇박?
String sd = request.getParameter("sd");

String diff = request.getParameter("diff");
String LodgmentHostName = request.getParameter("LodgementHostName");

String lodgmentTable = LodgmentHostName + "LODGMENT";
String roomTable = LodgmentHostName + "LODGMENTROOM";

if (sd == null || sd.isEmpty()) {
	sd = ".1박";
}

if (diff == null || diff.isEmpty()) {
	diff = "1";
}
if (regervation == null || regervation.isEmpty()) {
	regervation = datecitiset.dateset().replace("%C2%A0", " ");
}
LodgementDAO lodgementDao = new LodgementDAO();
LodgementDTO lodgment = lodgementDao.list(lodgmentTable);

RoomDAO roomDao = new RoomDAO();
ArrayList<RoomDTO> rooms = roomDao.list(roomTable);

lodgementDao.disconnection();
roomDao.disconnection();

%>
<div id="headbox"></div>
<div id="info_box">
	<div id="LodgeInfo_top">
		<div id="main_image_box">
			<img id="main_image" src="/project/lodgmentImage/<%= LodgmentHostName %>/lodgment/<%= LodgmentHostName %>_1.jpg" />
			<div id="sub_imagesbox">
				<%
				for (int i = 0; i < 4; i++) {
					System.out.print("롯지맨트호스트네임 : " + LodgmentHostName + "\n");
				%>
				<img id="sub_image<%=i%>" src="/project/lodgmentImage/<%= LodgmentHostName %>/lodgment/<%= LodgmentHostName %>_<%= i + 1 %>.jpg"
					onclick="image_click<%=i%>()" />
				<%
				}
				%>
			</div>
		</div>
		<div id="Linfo">
			<h2><%=lodgment.getLodgmentName()%></h2>
			<p id="recommend">
				<span></span><%=datecitiset.recomndComent()%>
			<p>
			<p id="address"><%=lodgment.getLodgmentAddress()%></p>
			<div id="comment">
				<h3>사장님 한마디</h3>
				<p>
					-
					<%=lodgment.getIntroByHost()%>
				</p>

			</div>
		</div>
	</div>


	<div id="LodgeInfo_middle">
		<div id="menu_select">
			<input type="radio" id="reservation" name="pages"
				onclick="reservationPage()" checked><label for="reservation">객실안내/예약</label>
			<input type="radio" id="lodgeInfo" name="pages" onclick="lodgeInfo()"><label
				for="lodgeInfo">숙소정보</label> <input type="radio" id="reviews"
				name="pages" onclick="reviewset()"><label for="reviews">리뷰</label>
		</div>
		<form action="reservation_Service.jsp" method="post">
			<div id="reservations">
				<div id="Revday_box">
					<button disabled></button>
					<input type="text" id="regervation" name="datefilter"
						value="<%=regervation%>" readonly> <input type="text"
						id="displayregervation" name="sd" value=<%=sd%> readonly>
					<input type ="hidden" id="diff" name="diff" value="<%=diff%>"
						readonly> <%@include file="/reservation/Datepicker.jsp"%>
				</div>
				<%
				int i = 0;
				for (RoomDTO r : rooms) {
				%>
				<div id="roomInfoTable">
					<div id="pic">
						<img src="/project/lodgmentImage/<%= LodgmentHostName %>/<%= r.getRoomName() %>/<%= r.getRoomName() %>.jpg" />
					</div>
					<p id="roomtype"><%=r.getRoomName()%>(<%=r.getRoomType()%>)
					</p>
					<div id="timeRoomInfo">
						<p style="font-weight: bold; height: 30px">대실</p>
						<p id="intime"><%=lodgment.getInTime()%>시 체크인
						</p>
						<p id="outtime"><%=lodgment.getOutTime()%>시 체크아웃
						</p>

						<p id="lentPrice">
							<%=r.getLentPrice()%>원
						</p>
						<!-- 대실이 있을시 / 없을시 if로 변롼 -->
						<%
						if (Integer.parseInt(r.getRoomCount()) > 0) {
						%>
						<input type="submit" id="lentbutton" name ="roomplan" value="대실예약"> 
						<input type="hidden" name="LodgmentHostName"value="<%=LodgmentHostName%>"> 
						<input type="hidden" name="LodgmentName"value="<%=lodgment.getLodgmentName()%>"> 
						 <input type="hidden" name="roomName" value="<%=r.getRoomName()%>">
						<input type="hidden" name="roomType" value="<%=r.getRoomType()%>">
						<input type="hidden" name="inTime" value="<%=Integer.parseInt(lodgment.getInTime())%>">
						<input type="hidden" name="outTime" value="<%=Integer.parseInt(lodgment.getOutTime())%>">
						
						<input type="hidden" name="lentPrice" value="<%=r.getLentPrice()%>">
						<input type="hidden" name="onenightPrice" value="<%=r.getOnenightPrice()%>">
						

						<%
						} else if (r.getRoomCount() == null || r.getRoomCount().isEmpty() || Integer.parseInt(r.getRoomCount()) == 0) {
						%>

						<a href=""><input type="button" id="lentbutton"
							value="숙소에 문의하세요" disabled></a>
						<%
						}
						%>
					</div>
					<div id="onenightInfo">
						<p style="font-weight: bold; height: 30px;">숙박</p>
						<p id="intime"><%=Integer.parseInt(lodgment.getOutTime()) + 2%>시
							체크인
						</p>
						<p id="outtime">
							익일<%=Integer.parseInt(lodgment.getOutTime()) + 15 - 24%>시 체크아웃
						</p>
						<!-- 대실이 있을시 / 없을시 if로 변롼 -->
						<p id="lentPrice">
							<%=r.getOnenightPrice()%>원
						</p>
						<%
						if (Integer.parseInt(r.getRoomCount()) > 0) {
						%>

						<input type="submit" id="onenightbutton" name ="roomplan" value="숙박예약"> 
						<%
						} else if (r.getRoomCount() == null || r.getRoomCount().isEmpty() || Integer.parseInt(r.getRoomCount()) == 0) {
						%>
						<a href=""><input type="button" id="onenightbutton"
							value="숙소에 문의하세요" disabled></a>
						<%}%>
					</div>
				</div>
				<%
i++;
}
%>

			</div>
		</form>
	</div>

	<div id="informations" style="display: none;">

		<div id="basic_info_box">
			<%
			if (lodgment.getWayToCome() != null || lodgment.getWayToCome().isEmpty() == false) {
			%>
			<div id="lodgeInfo">
				<p>
					오시는 길<br>
				</p>
				-
				<%=lodgment.getWayToCome()%>
			</div>

			<%
			}
			if (lodgment.getNearbyFacility() != null || lodgment.getNearbyFacility().isEmpty() == false) {
			%>
			<div id="lodgeInfo">
				<p>
					주변 정보<br>
				</p>
				-
				<%=lodgment.getNearbyFacility()%>
			</div>
			<%
			}
			if (lodgment.getLodgmentRule() != null || lodgment.getLodgmentRule().isEmpty() == false) {
			%>
			<div id="lodgeInfo">
				<p>
					이용안내<br>
				</p>
				-
				<%=lodgment.getLodgmentRule()%>
			</div>
			<%
			}
			if (lodgment.getDynamicCharge() != null || lodgment.getDynamicCharge().isEmpty() == false) {
			%>
			<div id="lodgeInfo">
				<p>
					현장결제안내<br>
				</p>
				-
				<%=lodgment.getDynamicCharge()%>
			</div>
			<%
			}
			if (lodgment.getParkingInfo() != null || lodgment.getParkingInfo().isEmpty() == false) {
			%>
			<div id="lodgeInfo">
				<p>
					주차장안내<br>
				</p>
				-
				<%=lodgment.getParkingInfo()%>
			</div>
			<%
			}
			if (lodgment.getChecklist() != null || lodgment.getChecklist().isEmpty() == false) {
			%>
			<div id="lodgeInfo">
				<p>
					확인 사항및 기타<br>
				</p>
				-
				<%=lodgment.getChecklist()%>
			</div>
			<%
			}
			%>

		</div>
	</div>

	<div id="reviewsA" style="display: none;">
		<P>준비중입니다.</P>
	</div>
</div>

<%@ include file="../index/main_footer.jsp"%>