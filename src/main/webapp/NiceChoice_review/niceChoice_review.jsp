<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<link rel = "stylesheet" href = "niceChoice_review.css">
	
	<%
		if (session.getAttribute("hostEmail") == null) {
			out.print("<script>location.href = '/project/HostHouseAuth/hosthouseauth.jsp';</script>");
			return;
		}
	%>
</head>
<body>
	<%@ include file = "/NiceChoice/niceChoice_Header.jsp" %>
		<div class = "review_center">
			<div class = "review_table">
				<div class = "">
					<span class = "reviewText">리뷰 관리</span>
				</div>
				
				<div class = "review_scoreArea">
					<!-- width = 233 -->
					<span class = "review_scoreArea_Text">리뷰 평균 평점</span>
					<span>1234</span>
					<span class = "review_scoreArea_Text">리뷰 갯수</span>
					<span>5678</span>
				</div>
				
				<table>
					<tr>
						<th width = 15%>번호</th>
						<th width = 70%>제목</th>
						<th>평점</th>
					</tr>
					
					<tr>
						<td>존나</td>
						<td>하기 싫다</td>
						<td>Css TQ</td>
					</tr>

					<tr>
						<td>존나</td>
						<td>하기 싫다</td>
						<td>Css TQ</td>
					</tr>
					
					<tr>
						<td>존나</td>
						<td>하기 싫다</td>
						<td>Css TQ</td>
					</tr>
					
					<tr>
						<td>존나</td>
						<td>하기 싫다</td>
						<td>Css TQ</td>
					</tr>
					
					<tr>
						<td>존나</td>
						<td>하기 싫다</td>
						<td>Css TQ</td>
					</tr>
					
					<tr>
						<td>존나</td>
						<td>하기 싫다</td>
						<td>Css TQ</td>
					</tr>
					
					<tr>
						<td>존나</td>
						<td>하기 싫다</td>
						<td>Css TQ</td>
					</tr>
			</table>
			</div>
			<br><br>
		</div>
	<%@ include file = "/NiceChoice/niceChoice_footer.jsp" %>
</body>
</html>