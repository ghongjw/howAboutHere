<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>공지사항</title>
	<link rel = "stylesheet" href = "niceChoice_QA.css">
	<script src = "niceChoice_notice.js"></script>
	
	<%
		if (session.getAttribute("hostEmail") == null) {
			out.print("<script>location.href = '/project/HostHouseAuth/hosthouseauth.jsp';</script>");
			return;
		}
	%>
	
</head>
<body>
	<%@ include file = "/NiceChoice/niceChoice_Header.jsp" %>
	<div class = "QA_center">
		<div class = "QA_table">
			<div>
				<span class = "QA_headerText">고객행복센터 > 공지사항</span>
				
				<span class = "QA_function">
					<select class = "search_category">
						<option>전체</option>
						<option>제목</option>
						<option>내용</option>
					</select>
					<input type = "text" placeholder = "검색어를 입력해주세요." class = "searchArea">
				</span>
					<button type = "button" class = "searchBtn">검색</button>
			</div>
			
			<table class = "QA_table_detail">
				<tr class = "QA_table_detail_head">
					<th width = 10%>번호</th>
					<th>제목</th>
					<th width = 10%>등록일</th>
				</tr>
				<% for (int cnt = 0; cnt < 12; cnt++) {%>
					<tr>
						<td class = "asd">1</td>
						<td>1</td>
						<td class = "asd">1</td>
					</tr>
				<%} %>
			</table>
		</div>
	</div>
	<%@ include file = "/NiceChoice/niceChoice_footer.jsp" %>
</body>
</html>