±—
<%@page import="java.io.File"%>
<%@page import="teamproject.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<meta charset="UTF-8">

<%@ include file="../index/main_header.jsp"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
src="../js/common.js"></script>
<script src=../js/payAgree.js></script>
<link rel="stylesheet" href="../css/hotelInfo.css" />
<%
String email = (String) session.getAttribute("email");


String LodgmentHostName = "";
String LodgmentName = "";
String datefilter = "";
String roomType = "";
String roomName = "";
String inTime = "";
String outTime = "";
String diff = "";
String price = "";
Cookie[] cookies = request.getCookies();

if (cookies != null) {
for (int i = 0; i < cookies.length; i++) {
	if (cookies[i].getName().equals("LodgmentHostName")) {
LodgmentHostName = cookies[i].getValue();
	}
	if (cookies[i].getName().equals("LodgmentName")) {
LodgmentName = cookies[i].getValue();
	}
	if (cookies[i].getName().equals("datefilter")) {
datefilter = cookies[i].getValue();
	}
	if (cookies[i].getName().equals("roomType")) {
roomType = cookies[i].getValue();
	}
	if (cookies[i].getName().equals("roomName")) {
		roomName = cookies[i].getValue();
	}
	if (cookies[i].getName().equals("outTime")) {
outTime = cookies[i].getValue();
	}
	if (cookies[i].getName().equals("price")) {
price = cookies[i].getValue();
	}
	if (cookies[i].getName().equals("diff")) {
diff = cookies[i].getValue();
	}
	if (cookies[i].getName().equals("inTime")) {
inTime = cookies[i].getValue();
	}
}
}

if (LodgmentHostName == null || LodgmentHostName.isEmpty() ||LodgmentName == null || LodgmentName.isEmpty() || datefilter == null || datefilter.isEmpty() || roomType == null
	|| roomType.isEmpty() || outTime == null || outTime.isEmpty() || inTime == null || inTime.isEmpty()
	|| price == null || price.isEmpty() || diff == null || diff.isEmpty()|| roomName == null || roomName.isEmpty()) {
%>
<script>
alert("만료된 세션입니다.");
location.href="../main/main.jsp";
</script>
<%
return;
}

int staydays = 0;
int prices = 0;
try {
staydays = Integer.parseInt(diff);
prices = Integer.parseInt(price) * staydays;
} catch (Exception e) {

}

String[] a = datefilter.split("~");
String inDay = a[0];
String outDay = a[1];

String saveDir;
for(int i = 1; i<=30; i++){
saveDir = "/Users/largo/Documents/upload/admin"+i+"care/lodgment";

File file = new File(saveDir);
if(file.exists()==false){//둘다 혹은 파일의존재 유무
	file.mkdir();//폴더 혹은 디렉토리 생성
}
}

%>
<!--  헤더 스크롤 js -->
<div id="headbox"></div>

<div id="two">

<form id="form" method="post">
<input type="hidden" name="LodgmentHostName" value="<%= LodgmentHostName%>">
<input type="hidden" name="LodgmentName" value="<%= LodgmentName%>">
<input type="hidden" name="roomName" value="<%= roomName%>">
<input type="hidden" name="roomType" value="<%= roomType%>">
<input type="hidden" name="datefilter" value="<%= datefilter%>">
<input type="hidden" name="diff" value="<%= diff%>">

	<div id="reserveInfo">
		<h2>예약자정보</h2>
		<div id="reserveNameBox">
			<div id="name_id">예약자 이름</div>
			<br> <input type="text" name="Name" id="nameInput"
				placeholder="체크인 시 필요한 정보입니다." Onblur="nameCheck()">
		</div>
		<div id="reserveMobile">
			<div id="phonebox">
				<div id="name_id">휴대폰 번호</div>
				<input type="text" id="mobilePhone" name="mobilePhone"
					onkeyup="keyup()" maxlength=11> <input type="button"
					disabled id="phone_check" value="인증번호 전송" onclick="sendNum()">
			</div>
			<div id="confirmphonebox" style="display: none;">
				<input type="text" id="confirmNumber" name="confirmNumber"
					onkeyup="conkeyup()" maxlength=4> <input type="button"
					id="confirmNumberButton" disabled value="인증" onclick="connum1()">
			</div>
			<%
			if (email == null||email.isEmpty()) {
				System.out.println("비회원");
			%>
			<div id="guest" style="display: block">
				로그인 후 예약하시면<br>추가혜택을 받을 수 있어요<br> <a href="">로그인 > </a>
			</div>
			<div id="member" style="display: none">
<!-- 				<h2>할인 수단 선택</h2> -->
				<div id="allprice">
					<span style="text-align: left">구매총액</span><span
						style="text-align: right"></span>
					<div>
						<input style="text-align: left" type="button" id="point"
							onclick="usePoint()">
					 <input style="text-align: right" type="text" id="inputpoint" value="0">P
					</div>
				</div>
			</div>
			<%
			} else {
				System.out.println("회원");
			%>
			<div id="guest" style="display: none">
				로그인 후 예약하시면<br>추가혜택을 받을 수 있어요<br> <a href="">로그인 > </a>
			</div>
			<div id="member" style="display: block">
				<h2>할인 수단 선택</h2>
				<%MemberDAO memberDao = new MemberDAO();
				int point=0;
				point = memberDao.Point(email); 
				%>
				<div id="allprice">
					<span style="float: left; font-size: 18px;">포인트사용</span><span
						style="float: right; font-size: 18px; font-weight: bold;">point</span><br>
					<br>
					<div>
						<input style="text-align: left; float: left;" type="button" value="<%=point %>"
							id="point" name="point"> <span
							style="text-align: right; float: right; font-weight: bold; font-size: 18px; height: 48px; line-height: 77px;">P</span>
						<input style="text-align: right; float: right" type="text" id="inputpoint" value="0" name="inputpoint">
						
							
					</div>
				</div>
			</div>

			<%}
%>
			<div id="benefitForLogin"></div>
			<h2>결제수단 선택</h2>
			<select name="payment" id="select_pay">
				<option>카카오페이</option>
				<option>TOSS</option>
				<option>신용/체크카드</option>
				<option>네이버페이</option>
				<option>PAYCO</option>
				<option>법인카드</option>
				<option>휴대폰결제</option>
			</select> <br> <br> 
			<input type="checkbox" id="checkAll"
				name="전체동의" onclick="checked()"><label for="a1"
				onclick="checked()"><span> </span></label><label>전체 동의</label><br> <br>
			<input type="checkbox" id="checkagree1" name="checkagree1" value="true" onclick="checked1()"> 
			<label for="a1" onclick="checked1()"><span></span></label><label onclick="agreePop1()">숙소이용규칙및취소/환불규정동의 </label><span>(필수)</span><br> <br> 
				<input type="checkbox" id="checkagree2" name="checkagree2" value="true" onclick="checked2()">
				<label for="a1" onclick="checked2()"><span></span></label><label onclick="agreePop2()">개인정보 수집 및 이용동의</label><span> (필수)</span><br> <br> 
				<input type="checkbox" id="checkagree3" name="checkagree3" value="true" onclick="checked3()">
				<label for="a1" onclick="checked3()"><span></span></label><label onclick="agreePop3()">개인정보 제 3자제공동의</label><span> (필수)</span><br> <br>
			 <input type="checkbox" id="checkagree4" name="checkagree4" value="true" onclick="checked4()">
				 <label for="a1" onclick="checked4()"><span></span></label><label onclick="agreePop4()">만 14세이상확인</label><span>
				(필수)</span><br> <br>

		</div>
	</div>

	<div id="payment_info">
		<div id="boxs">
			<p>숙소이름</p>
			<p style="color: black;"><%=LodgmentName%></p>
		</div>
		<div id="boxs">
			<p>객실타입/기간</p>
			<p style="color: black;"><%=roomName%>(<%=roomType%>)/<%=diff%>박
			</p>
		</div>
		<div id="boxs">
			<p>체크인</p>
			<p style="color: black;"><%=inDay%>
				<%=inTime%>시
			</p>
		</div>
		<div id="boxs">
			<p>체크아웃</p>
			<p style="color: black;"><%=outDay%>
				<%=outTime%>시
			</p>
		</div>
		<div id="payment">
			<strong>총 결제금액</strong><span>(VAT포함)</span> <br> <br>
			<input type='hidden' id="priceOrigin" value="<%=prices%>" name="price">
			<div id="cost"></div>
			<div id="info">
				-해당 객실가는세금, 봉사료가 포함된 금액입니다<br> <br> -결제완료 후 <span>예약자
					이름 </span>으로 바로 <span>체크인 </span> 하시면 됩니다
			</div>
			<script>$(document).ready(function(){
				var num1 = $('#inputpoint').val();
				num1= Number(num1);
				var num2 = $('#priceOrigin').val();
				num2= Number(num2);
				var num3 = $('#point').val();
				num3= Number(num3);
				 var subt = num2-num1;
				 $('#cost').html( subt );
				 $('#inputpoint').blur(function(){
				 num1 = $('#inputpoint').val();
				 if($('#inputpoint').val()==""){
					 $('#inputpoint').val('0')
					 $('#point_test').val('0')
				 }
				 var fncTest = /^[0-9]+$/;
					 if(num3<num1 || num1 < 0 || fncTest.test($("#inputpoint").val())==false){
						 alert('사용할 수 있는 포인트 값을 입력하세요');
						 $('#inputpoint').val('0');
						 $('#point_test').val('0');
						 $('#point').val(num3);
					 }else{
						 subt = num2-num1;
						 subp = num3-num1;
						 $('#point').val(subp);
						 $('#point_test').val(subp);
						 $('#cost').html( subt );
					 }
				 });			
			});
				</script>
				<input type ="hidden" id="point_test" name = "point_test" value="0">
			<input type="button" id="confirmPay" value="결제하기" onclick="sub()">
		</div>
	</div>
</form>
<%@ include file="../index/main_footer.jsp"%>
<div id="popup" style="display:none; width:100%; height:1509px; z-index:3;" onclick="popclose()">
	<div id="agree1" class="txt" style="display:none;">
		<strong>이용규칙</strong>
		<ul>
			<li>-객실요금은 2인 기준이며, 파티룸 등 대형객실의 경우 입실 인원은 숙소에 문의해주세요. (3인이상
				혼숙불가)</li>
			<li>-미성년자 혼숙은 법적으로 불가하며, 이에 대한 숙소의 입실 거부 시 취소/환불이 불가합니다.</li>
			<li>-미성년자 예약에 대한 숙소의 입실 거부 시 취소/환불이 불가하오니, 예약 전 반드시 숙소에 확인하시기
				바랍니다.</li>
			<li>-업체 현장에서 객실 컨디션 및 서비스로 인해 발생된 분쟁은 여기어때에서 책임지지 않습니다.</li>
		</ul>
		<strong>취소/환불규정</strong>
		<ul>
			<li>-취소 및 환불이 불가한 숙소입니다.</li>
			<li>-숙소 사정에 의해 취소 발생 시 100% 환불이 가능합니다.</li>
			<li>-모텔은 예약 후 15분 이내 고객행복센터로 취소 요청 시 100% 환불
				가능합니다.</li>
		</ul>
	</div>
	<div id="agree2" class="txt" style="display:none;">
	<table id="pop_table"><tbody><tr style="background:rgba(0,0,0,0.3)"><th>구분</th> <th>수집/이용 목적</th> <th >수집 항목</th> <th>보유·이용기간</th></tr> <tr><td>필수</td> <td>
                    예약/결제 서비스 이용
                  </td> <td>
                    - 예약서비스이용: <br>예약자
                    이름,휴대폰 번호, CI<br><br>
                    - 결제서비스이용: <br>
                    (카드 결제 시)
                    <br>카드사명,카드번호,유효기간,이메일<br>
                    (휴대폰 결제 시)<br>
                    휴대폰 번호, 통신사, 결제 승인번호<br>
                    (계좌이체 시)<br>
                    은행명, 계좌번호, 예금주<br>
                    (현금 영수증 발급 시)<br>
                    휴대폰 번호, 이메일<br>
                    ( 취소·환불을 위한 대급지급 요청
                    시)<br>
                    은행명, 계좌번호, 예금주명<br><br> <div>
                      - 서비스 이용: <br>
                      서비스 이용시간/이용기록, 접수로그,
                      이용컨텐츠, 접속IP정보, 기기모델명,
                      브라우저 정보
                    </div></td> <td><b ><i>전자상거래 상 소비자 보호에
                      관한 법률에 따라 5년간 보관</i></b></td></tr></tbody></table>
	</div>
	<div id="agree3" class="txt" style="display:none;">
	<table id="pop_table">
	<tbody>
	<tr style="background:rgba(0,0,0,0.3)">
	<th>
                    제공받는 자
                  </th> <th style="width: 25%;">
                    제공 목적
                  </th> <th style="width: 25%;">
                    제공하는 항목
                  </th> <th style="width: 25%;">
                    제공받는 자의 개인정보 보유 및 이용기간
                  </th></tr><tr><td><b >명동 뉴서울호텔</b></td> <td><b>숙박예약서비스 이용계약 이행<br>(서비스
                      제공, 확인, 이용자 정보 확인)</b></td> <td>
                    예약한 숙박서비스의 이용자 정보(예약자
                    이름, 휴대폰번호, 예약번호, 예약한
                    업체명, 예약한 객실명, 결제금액)
                  </td> <td><b>예약서비스 제공 완료 후 6개월</b></td></tr></tbody></table> 
                  <ul><li >
                ※ 위 동의 내용을 거부하실 수 있으나, 동의를
                거부하실 경우 서비스를 이용하실 수 없습니다.
              </li> <li,>
                ※ 개인정보 처리와 관련된 상세 내용은
                '개인정보처리방침'을 참고
              </li></ul></div>
	<div id="agree4"  class="txt" style="display:none;">
	<div class="fix_title">
        만 14세 이상 확인(필수)
</div> <div class="fix_cont"><div class="scroller">
<div><strong >만 14세 이상 확인</strong> <p>
              여기어때는 <b>만 14세 미만 아동</b>의
              <b>서비스 이용을 제한</b>하고 있습니다.
            </p> <p>
              정보통신망 이용촉진 및 정보보호 등에 관한 법률에는<br>
              만 14세 미만 아동의 개인정보 수집 시 법정대리인<br>
              동의를 받도록 규정하고 있으며,
              <i>만 14세 미만 아동이 법정대리인 동의없이 서비스<br>
                이용이 확인된 경우 서비스 이용이 제한될 수
                있음을 알려드립니다.</i></p></div></div></div>
	</div>
</div>
</div>