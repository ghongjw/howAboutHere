<%@page import="DTO.NoticeDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>공지사항</title>
	<link rel = "stylesheet" href = "niceChoice_notice.css">
	<script src = "niceChoice_notice.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	
	<%
		if (session.getAttribute("hostEmail") == null) {
			out.print("<script>location.href = '/project/HostHouseAuth/hosthouseauth.jsp';</script>");
			return;
		}
	
		// 공지사항 테이블 index
		int idx = 0;
		try {
			idx = Integer.parseInt(request.getParameter("idx"));
		} catch (Exception e) {
			idx = 1;
		}
		
		// 공지사항 테이블에 보여질 데이터 개수
		int viewCount = 10;
	
		NoticeDAO notice = new NoticeDAO();
		ArrayList<NoticeDTO> notices = notice.getNoticesByIndex(idx, viewCount);
		int dataCount = notice.dataCount();
		int mkIdx = 0;
		
		if (dataCount % viewCount != 0) {
			mkIdx = dataCount / viewCount + 1;
		} else {
			mkIdx = dataCount / viewCount;
		}
		
		if (idx > mkIdx) {%>
			<script>
				location.href = "/project/NiceChoice_Notice/niceChoice_notice.jsp";
			</script>
		<%}%>
	
	<script>
		$(function() {
			// 인덱스 클릭시 URL 요청 Event
			<% for (int cnt = 1; cnt <= mkIdx; cnt++) {%>
				$(".idx<%= cnt %>").on("click", function() {
					location.href = "/project/NiceChoice_Notice/niceChoice_notice.jsp?idx=<%=cnt%>";
				});
			<%}%>
			
			// 제목 클릭시 URL 요청 Event
			<% for (int cnt = 0; cnt < notices.size(); cnt++) {%>
				$(".noticeTitle_<%= cnt %>").on("click", function() {
					location.href = "/project/NiceChoice_Notice/niceChoice_noticeDetail.jsp?title=" + "<%= notices.get(cnt).getTitle() %>" + "&noticetext=" + "<%= notices.get(cnt).getNoticeText() %>";
				});
			<%}%>
		});
	</script>

</head>
<body>
	<%@ include file = "/NiceChoice/niceChoice_Header.jsp" %>
	<div class = "notice_center">
		<div class = "notice_table">
			<div>
				<span class = "notice_headerText">고객행복센터 > 공지사항</span>
			</div>
			
			<div style = "height : 40px; margin-top : 15px;"><!-- white Space --></div>
			
			<table class = "notice_table_detail">
				<tr class = "notice_table_detail_head">
					<th width = 10%>번호</th>
					<th>제목</th>
					<th width = 10%>등록일</th>
				</tr>
				<% for (int cnt = 0; cnt < notices.size(); cnt++) {%>
					<tr class = "noticeContent">
						<td style = "text-align : center;">
							<%= notices.get(cnt).getNum() %>
						</td>
						
						<td>
							<label class = "noticeTitle_<%= cnt %>">
								<%= notices.get(cnt).getTitle() %>
							</label>
						</td>
						
						<td>
							<%= notices.get(cnt).getNoticeTime() %>
						</td>
					</tr>
				<%} %>
			</table>
			
			<div class = "noticeBoardIndexArea">
				<div class = "noticeBoardIndex">
					<% for (int cnt = 1; cnt <= mkIdx; cnt++) {%>
						<span class = "idx<%= cnt %>">
							<%= cnt %>
						</span>
					<%} %>
				</div>
			</div>
		</div>
	</div>
	<%@ include file = "/NiceChoice/niceChoice_footer.jsp" %>
</body>
</html>