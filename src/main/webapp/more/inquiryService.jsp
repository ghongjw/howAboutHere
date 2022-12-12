
<%@page import="teamproject.InquiryDTO"%>
<%@page import="teamproject.InquiryDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	
	
	
	//문의 작석 내용 데이터 가져오기----------------------------------------------------------------------
	request.setCharacterEncoding("UTF-8");
	String category = request.getParameter("room_type");
	String inquiry = request.getParameter("inq_type"); 
	String mobile = request.getParameter("uphone");
	String email = request.getParameter("uemail");
	String content = request.getParameter("content");
	//작성내용 검열----------------------------------------------------------------------------------
	
	if(category =="" || inquiry == ""){
		%><script>alert('카데고리 유형 또는 문의 유형을 선택해주세요.');location.href="inquiry.jsp";</script><%
		return;
	}
	if(content.length() <10 ){
		%><script>alert('문의내용을 10자리 이상 입력하세요');location.href="inquiry.jsp";</script><%
		return;
	}
	//비회원이 작성확인 클릭시 로그인페이지로 이동---------------------------------------------------
	if(session.getAttribute("email") == null){
		response.sendRedirect("../login/login.jsp");
		return;
	}
	//작성 내용 데이터베이스에 저장-----------------------------------------------------------------------
	String useremail = (String)session.getAttribute("email");
	InquiryDAO inquiryDao = new InquiryDAO();
	InquiryDTO inquiryDto = new InquiryDTO();
	inquiryDto.setCategory(category);
	inquiryDto.setInquiry(inquiry);
	inquiryDto.setMobile(mobile);
	inquiryDto.setEmail(useremail);
	inquiryDto.setContent(content);
	inquiryDto.setAnswertext("");
	inquiryDto.setSuccess("미답변");
	Date date = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String writeTime = sdf.format(date);
	inquiryDto.setWriteTime(writeTime);
	inquiryDao.insert(inquiryDto);
	
	inquiryDao.disconnection();
	
%>
<script>alert('문의가 등록되었습니다');location.href="inquiry.jsp";</script>