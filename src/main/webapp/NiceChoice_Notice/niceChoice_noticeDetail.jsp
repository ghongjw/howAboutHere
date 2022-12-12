<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel = "stylesheet" href = "/project/NiceChoice_Notice/niceChoice_noticeDetail.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

	<%
		if (session.getAttribute("hostEmail") == null) {%>
			<script>
				location.href = "/project/NiceChoice/niceChoice_Main.jsp";
			</script>
		<%
		}%>
		
	<%	
		request.setCharacterEncoding("UTF-8");
		String title = request.getParameter("title"), noticeText = request.getParameter("noticetext");
	%>

<script>
	$(function() {
		$(".listBtn").on("click", function() {
			location.href = "/project/NiceChoice_Notice/niceChoice_notice.jsp";
		})
	});
</script>
</head>
<body>
	<%@ include file = "/NiceChoice/niceChoice_Header.jsp" %>
	
	<div class = "noticeDetailCenter">
		<div class = "noticeDetail">
			<div>
				<label>
					고객행복센터 > 공지사항
				</label>
			</div>
			
			<div>
				<table>
					<tr>
						<th style = "background : #eaeaea;">제목</th>
						<td> <%= title %> </td>
					</tr>
					
					<tr>
						<td colspan = 2>
							<%= noticeText %>
						</td>
					</tr>
				</table>
			</div>
			
			<div class = "buttonArea">
				<button type = "button" class = "listBtn">목록보기</button>
			</div>
		</div>
	</div>
	
	<%@ include file = "/NiceChoice/niceChoice_footer.jsp" %>
</body>
</html>