<%@page import="teamproject.InquiryDTO"%>
<%@page import="teamproject.InquiryDAO"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/index/main_header.jsp" %>
<%	
    	String email = (String)session.getAttribute("email");
    	InquiryDAO inquiryDao = new InquiryDAO();
    	ArrayList<InquiryDTO> members = inquiryDao.list(email);
    	
    %>
	<div class="sub_top_wrap">
			<div class="sub_top bg_kong_3" onmouseover="listnone()">
				<h2>더보기</h2>
			</div>
		</div>
		<!-- //Sub Top -->
	
		<!-- Content  -->
		<div id="content" class="sub_wrap more_wrap"  onmouseover="listnone()">
	
			<!-- Nav -->
			<nav>
	    <ul>
	        <li><a href="moreshow.jsp"
	                >공지사항</a></li>
	        <li><a href="event.jsp"
	                >이벤트</a></li>
	        <li><a href="faq.jsp"
	                >자주 묻는 질문</a></li>
	        <li><a href="inquiry.jsp" class="active"
	                >1:1 문의</a></li>
	        <li><a href="terms.jsp"
	                >약관 및 정책</a></li>
	        <li><a href="employment.jsp"
	                >채용 약관</a></li>
	    </ul>
	</nav>
			<div class="align_rt">


			<!-- Inquiry -->
		<div class="inquiry">

			<!-- Tab -->
			<div class="tab">
				<span class="tab_btn active">나의 문의 내역</span>
				<span class="tab_btn ">새 문의 작성</span>
			</div>

			<!-- 리스트 -->
			<div class="tab_each" style="display:block">
					<%if(!members.isEmpty() && session.getAttribute("email") != null){ int i =0;
						for(InquiryDTO m : members){%>
					<ul class="show_list open_list" id="inquiry_list">
							<li>
								<a href="#" class="list_que">
									<p>
										<b><%=m.getCategory() %></b>
										<%=m.getInquiry() %>
										<b class="reply_chk">문의 등록</b>
										<%if(m.getAnswertext() != null){  %>
										<b class="reply_chk"><%=m.getSuccess()%></b>
										<%} %>
									</p>
									<span>작성일 <%=m.getWriteTime() %></span>
								</a>

								<div class="list_ans">
									<b class="title">문의내용</b>
									<div><%=m.getContent() %>
									</div>
									<%if(m.getAnswertext() != null){ %>
									<div>
									<b class="title">답변 내용</b>
									</div>
									<div><%=m.getAnswertext()%></div>
									<%} %>
									<input type="button" class="delbtn" value = "삭제" onclick='location.href="inquiryDeleteService.jsp?&num=<%=m.getNum()%>"'>
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
			<%} inquiryDao.disconnection();%>
			</div>
			<!-- 작성 -->
			<div class="tab_each">
				<form name="inq-form" method="post" action="inquiryService.jsp">
					<div class="alert_top">
						<p>여기어때 이용 중 불편하신 점을 문의주시면 <em>최대한 빠른 시일내에 답변 드리겠습니다.</em></p>
					</div>

					<section class="info_wrap">
						<b>카테고리유형</b>
						<select name="room_type" id="" class="select_type_2"  >
							<option value="">카테고리유형을 선택하세요</option>
							<option>모텔</option>
							<option>호텔·리조트</option>
							<option>펜션</option>
							<option>게스트하우스</option>
							<option>캠핑/글램핑</option>
							<option>한옥</option>
							<option>액티비티</option>
							<option>현금성(유상)포인트</option>
						</select>

						<b>문의유형</b>
						<select name="inq_type" id="inq_type" class="select_type_2"  >
							<option value="">문의유형을 선택하세요</option>
							<option>이벤트</option>
							<option>예약/결제</option>
							<option>혜택받기</option>
							<option>이용문의</option>
							<option>회원정보</option>
							<option>리뷰</option>
							<option>기타</option>
						</select>

						<div class="phone-block">
							<b>휴대폰 번호</b>
							<p class="inp_wrap"><input class="js-phone-number" data-type="phoneNumber" type="tel" maxlength="11" name="uphone" value="" placeholder="선택사항입니다."/></p>
						</div>

						<div class="email-block">
							<b>이메일</b>
							<p class="inp_wrap"><input data-email-validate class="js-email-string" type="email" value="" name="uemail" placeholder="선택사항입니다."/></p>
						</div>

					</section>

					<section class="text_wrap">
						<b>문의내용</b>
						<div>
							<textarea name="content" id="questionTextarea"
							placeholder = "문의하실 내용을 10자 이상 입력해 주세요."></textarea>
							
						</div>
					</section>

					<section class="agree_wrap">
						<div>
							<input type="checkbox" id="info_agree" name="checkOne" class="inp_chk_04" disabled>
							<label for="info_agree">개인정보수집. 이용동의</label>
							<btn class="view_contents">[내용보기]</btn>
						</div>
					</section>

					<section class="btn_wrap ">
					
					<!----------작성완료 버튼 클릭시 inquiryService로 데이터 전송 ----------->
								
						<button class="btn_red_fill" type="submit">작성 완료</button>
					</section>
				</form>
			</div>


		</div>
		<!-- //Notice -->

	</div>

</div>
<!-- //Content  -->

<%@ include file="/index/main_footer.jsp" %>	