<%@page import="teamproject.InquiryDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="teamproject.InquiryDAO"%>
<%@page import="teamproject.MemberDTO"%>
<%@page import="teamproject.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%
   	InquiryDAO inquiryDao = new InquiryDAO();
   	ArrayList<InquiryDTO> members = inquiryDao.allList();
   	
   %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>여행할때 요기어때</title>
    <link rel="shortcut icon" href="//image.goodchoice.kr/images/web_v3/favicon_170822.ico" type="image/x-icon">
    <link rel="stylesheet preload"href="https://static.goodchoice.kr/fonts/css/font.css"as="style"type="text/css"crossorigin>
    <link rel="stylesheet" href="../css/common.css" />
    <link rel="canonical" href="https://www.goodchoice.kr/">
    <link rel="stylesheet" href="../css/swiper.css" />
	<link rel="stylesheet" href="../css/main.css" />
	<link rel="stylesheet" href="../css/more.css">
	<link rel="stylesheet" href="../css/terms4.css">
	<link rel="stylesheet" href="https://static.goodchoice.kr/yg-webview/css/terms/terms-basic.css">
	<link rel="stylesheet" href="https://static.goodchoice.kr/yg-webview/css/terms/terms-basic-new.css">
	<link rel="stylesheet" href="../css/my.css"/>
	<link rel="stylesheet" href="../css/font.css"/>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript" src="../js/main_js.js"></script>
	<script type="text/javascript" src="../js/more.js"></script>
	<script type="text/javascript" src="../js/myinfo.js"></script>
	<style type="text/css">
	.anwbtn{
			margin-top: 50px;
			cursor: pointer;
		}
	.reply_ch{
		display: inline-block;
    	position: relative;
	    top: 1px;
	    border: 1px solid rgba(0,0,0,0.87);
	    color: rgba(0,0,0,0.87);
	    font-size: 16px;
	    color:white;
	    background-color: rgb(255, 0, 85);
	    outline : outset;
	}
	.delbtn{
		width:50px;
		height:30px;
		cursor:pointer;
		margin-left: 370px;
	}
	.anwbtn{
		width:50px;
		height:30px;
	}
	</style>
	
</head>
<body class="pc">
 <div class="wrap main_wrap show">
   <!-- Header -->
    <header>
         <section>
            <h1><a href="adminForm.jsp" title="저기어때">저기어때</a></h1>
         </section>
	</header>
	<!-- Content  -->
	<div id="content" class="sub_wrap more_wrap">

		<!-- Nav -->
		<nav>
		    <ul style="margin-top: 50px">
		        <li><a href="adminForm.jsp"
		                >공지사항 관리</a><br></li>
		        <li><a href="#" 
		                >숙박업소 관리</a><br></li>
		        <li><a href="boardForm.jsp" 
		                >회원 관리</a><br></li>
		        <li><a href="answer_inquiry.jsp"  class="active"
		                >1:1 문의 관리</a><br></li>
		        
		    </ul>
		</nav>
		<div class="align_rt"  style="margin-top: 50px">
	
	
				<!-- Inquiry -->
			<div class="inquiry">
	
				<!-- Tab -->
				<div class="tab">
					<span class="tab_btn active">회원 문의 내역</span>
				</div>
	
				<!-- 리스트 -->
				<div class="tab_each" style="display:block">
						<%if(!members.isEmpty()){ int i =0;
						for(InquiryDTO m : members){%>
					<ul class="show_list open_list" id="inquiry_list">
							<li>
								<a href="#" class="list_que">
									<p>
										<b><%=m.getCategory() %></b>
										<%=m.getInquiry() %>
										<b class="reply_chk"><%=m.getEmail()%> 님의 문의</b><b class="reply_ch"><%=m.getSuccess()%></b>
									</p>
									<span>작성일 <%=m.getWriteTime() %></span>
								</a>

								<div class="list_ans">
									<b class="title">문의내용</b>
									<div><%=m.getContent() %>
									</div>
									<br>
									<form action="answerService.jsp?&content=<%=m.getContent()%>" method="post">
									<b class="title">답변작성</b>
									<div><textarea rows="20" cols="50" name="answertext"></textarea></div>
									<input type="submit" class="anwbtn" value = "답변">
									<input type="button" class="delbtn" value = "삭제" onclick='location.href="answerDeleteService.jsp?&num=<%=m.getNum()%>"'>
									</form>
								</div>
							</li>
					</ul>
							<%} %>	
								<%} else{%>
									<!-- 리스트 없을때 -->
					<div class="list_none" style="display: block;">
						등록된 1:1 문의가 없습니다.
						<b>여기어때는 회원님들의 소중한 의견에 귀기울여<br/>신속하고 정확하게 답변드리도록 하겠습니다.</b>
					</div>
			<%}inquiryDao.disconnection(); %>
			</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
 