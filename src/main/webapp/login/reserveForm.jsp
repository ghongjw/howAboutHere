<%@page import="java.util.ArrayList"%>
<%@page import="teamproject.UnloginReservationDTO"%>
<%@page import="teamproject.UnloginReservationDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../index/main_header.jsp" %>
    <%
    	String mobile = request.getParameter("mobile");
    	UnloginReservationDAO UnloginReservationDao = new UnloginReservationDAO();
    	ArrayList<UnloginReservationDTO> unloginReservations = UnloginReservationDao.renumList(mobile);
    	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="content" class="sub_wrap my_wrap" onmouseover="listnone()" style="margin-top: 50px;">
	<p class="sub_title">예약내역</p>

	<!-- Nav -->
    <nav>
        <ul>
            <li><a class="active" href="#">예약 내역</a></li>
        </ul>
    </nav>
    <div class="align_rt">
    	<div class="tab">
			<span class="tab_btn active">예약 내역</span>
		</div>
	    <div class="tab_each" style="display: block">
		<%for(UnloginReservationDTO m : unloginReservations) {%>
             <ul class="show_list open_list" id="inquiry_list">
				<li>
					<a href="#" class="list_que">
					
					
						<p>
							<b>예약번호 : <%=m.getReservationNum()%></b>
						</p>
						<span>예약일 <%=m.getReservationDate()%></span><!--날짜  -->
					</a>

					<div class="list_ans" style="background: #fafafa;">
						<b class="title">예약한 연락처 : <%=m.getMobile()%></b><br><!--연락처 -->
						<b class="title">예약자 이름 : <%=m.getUserName()%></b><br><!--이름 -->
						<b class="title">예약한 숙박이름 : <%=m.getHotelName()%></b><br><!--호텔명  -->
						<b class="title">예약날짜 : <%=m.getReservationDate()%></b><br><!--날짜  -->
						<input type="button" value="예약 취소" onclick="location.href='delreCheckMobile.jsp?mobile=<%=m.getMobile()%>'" style="cursor:pointer;border: revert;background-color:rgb(255, 0, 85);
						color:white;margin-left: 500px;margin-top: 50px;}">
						<div>
						</div>
						<br>
						
					</div>
				</li>
			</ul>
         <%}%>
         </div>
	</div>
</div>

</body>
</html>