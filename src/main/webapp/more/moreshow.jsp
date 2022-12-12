<%@page import="teamproject.NoticeDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="teamproject.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/index/main_header.jsp" %>
<%
   	NoticeDAO noticeDao = new NoticeDAO();
    ArrayList<NoticeDTO> notices = noticeDao.allList();
   %>
<div class="sub_top_wrap">
		<div class="sub_top bg_kong_3" id="content" onmouseover="listnone()">
			<h2>더보기</h2>
		</div>
	</div>
	<div id="content" class="sub_wrap more_wrap" onmouseover="listnone()">

		<!-- Nav -->
		<nav>
    <ul>
        <li><a href="moreshow.jsp"
                class="active">공지사항</a></li>
        <li><a href="event.jsp"
                >이벤트</a></li>
        <li><a href="faq.jsp"
                >자주 묻는 질문</a></li>
        <li><a href="inquiry.jsp"
                >1:1 문의</a></li>
        <li><a href="terms.jsp"
                >약관 및 정책</a></li>
        <li><a href="employment.jsp"
                >채용 약관</a></li>
    </ul>
</nav>
		<div class="align_rt">

			<!-- Notice -->
			<div class="notice">

				<!-- Tab -->
				<div class="tab">
					<span class="tab_btn active">서비스 공지사항 <i class="ico_new">NEW</i></span>
					<!-- <span class="tab_btn">여기어때 언론보도 <i class="ico_new">NEW</i></span> -->
				</div>

				<!-- 공지사항  -->
				<div class="tab_each">
					<%if(notices != null) {
							for(NoticeDTO m : notices){%>
						<ul id="notices" class="show_list open_list">
	                        <li>
								<a href="#" id="notive_tab" class="list_que"><%=m.getTitle() %>
										<span><%=m.getNoticeTime() %>
	                                   		<i class="ico_new" v-if="row.new_icon_show == 'Y'">NEW</i>
	                                	</span>
								</a>
								<div v-html="row.ntcont" id ="ntcont" style="display:none"><%=m.getNoticetext() %></div>
								
							</li>
	                        
						</ul>
						<%}
							}%>

				</div>

				<!-- 보도 
				<div class="tab_each" style="display:none">
					<ul id="notice_release" class="show_list news_list">
                        <template v-for="row in result">
                            <li>
                                <a :href="row.ntrlink" target="_blank">
                                    <p>{{row.ntrtitle}}</p>
                                    <span>{{row.ntreg2}}
                                    <i class="ico_new" v-if="row.new_icon_show == 'Y'">NEW</i>
                                </span>
                                </a>
                            </li>
                        </template>
					</ul>

                    <div id="notice_release_pagination">
                        <my-pagination></my-pagination>
                    </div>
				</div>
				-->
			</div>
			<!-- //Notice -->

		</div>

	</div>
	<!-- //Content  -->
<%@ include file="/index/main_footer.jsp" %>	