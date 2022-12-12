<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="register.css">
<script type="text/javascript" src="register_agreement.js"></script>
</head>
<body>

<form action="register_agreement_service.jsp" metiod="post">
<h2>요기어때 약관 동의</h2>
<div id="wrap">
<input type="checkbox" id="checkAll" name="전체동의" onclick="checked()"><label for="a1" onclick="checked()"><span> </span></label>전체 동의<br><br>
<input type="checkbox" id="checkagree1" name="checkagree1" value="true" onclick="checked1()"><label for="a1" onclick="checked1()"><span></span></label><a href=>이용약관동의</a><span> (필수)</span><br><br>
<input type="checkbox" id="checkagree2" name="checkagree2" value="true" onclick="checked2()"><label for="a1" onclick="checked2()"><span></span></label><a href=>만 14세 이상 확인</a><span> (필수)</span><br><br>
<input type="checkbox" id="checkagree3" name="checkagree3" value="true" onclick="checked3()"><label for="a1" onclick="checked3()"><span></span></label><a href=>개인정보 수집 및 이용동의</a><span> (필수)</span><br><br>
<input type="checkbox" id="checkagree4" name="checkagree4" value="true" onclick="checked4()"><label for="a1" onclick="checked4()"><span></span></label><a href=>개인정보 수집 및 이용동의</a><br><br>
<input type="checkbox" id="checkagree5" name="checkagree5" value="true" onclick="checked5()"><label for="a1" onclick="checked5()"><span></span></label><a href=>마케팅알람 수신동의</a><br><br>
<input type="checkbox" id="checkagree6" name="checkagree6" value="true" onclick="checked6()"><label for="a1" onclick="checked6()"><span></span></label><a href=>위치기반 서비스 이용약관 동의</a><br><br>
<input type="submit" id="login_button" value="회원가입" disabled >

</div>
</form>
</body>
</html>