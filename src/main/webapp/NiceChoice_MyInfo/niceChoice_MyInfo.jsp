<%@page import="DTO.LodgmentDTO"%>
<%@page import="DTO.HostMemberDTO"%>
<%@page import="DAO.MyInfoLookupDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	
	<link rel = "stylesheet" href = "niceChoice_MyInfo.css">
	<script src = "niceChoice_MyInfo.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	
	<%
		if (session.getAttribute("hostEmail") == null) {
			out.print("<script>location.href = '/project/HostHouseAuth/hosthouseauth.jsp'</script>");
			return;
		}
	
		MyInfoLookupDAO myInfoDao = new MyInfoLookupDAO();
		String hostEmail = (String)session.getAttribute("hostEmail");
		
		HostMemberDTO host = myInfoDao.hostInfoLookup(hostEmail);
		LodgmentDTO lodgment = myInfoDao.lodgmentInfoLookup(hostEmail);
		
		String[] lodgmentType_1 = new String[30];
		String lodgmentType_2 = "";
		
 		lodgmentType_1 = new String[100];
 		lodgmentType_2 = lodgment.getLodgmentType_2();
 		
 		if (lodgment.getLodgmentType_1() != null)
 			lodgmentType_1 = lodgment.getLodgmentType_1().split(" ");
 		else
 			lodgmentType_1 = null;
		
		// 휴대폰번호
		String phone_FirstNumber = "", phone_MiddleNumber = "", phone_LastNumber = "";		
		if (host.getPhoneNumber() != null) {
			for (int cnt = 0; cnt < host.getPhoneNumber().length(); cnt++) {
				if (cnt < 3) {
					phone_FirstNumber += host.getPhoneNumber().charAt(cnt);
				} else if (3 <= cnt && cnt < 7) {
					phone_MiddleNumber += host.getPhoneNumber().charAt(cnt); 
				} else
					phone_LastNumber += host.getPhoneNumber().charAt(cnt);
			}
		}

		// 대표번호
		String main_FirstNumber = "", main_MiddleNumber = "", main_LastNumber = "";
		if (host.getMainNumber() != null) {
			if (host.getMainNumber().startsWith("02")) {
				for (int cnt = 0; cnt < host.getMainNumber().length(); cnt++) {
					if (cnt < 2)
						main_FirstNumber += host.getMainNumber().charAt(cnt);
					else if (2 <= cnt && cnt < 6)
						main_MiddleNumber += host.getMainNumber().charAt(cnt);
					else 
						main_LastNumber += host.getMainNumber().charAt(cnt);
				}
			} else { // middle number가 3자리일수도, 4자리일수도 있다. 전체 문자열 길이로 판별해서 다시 작업
				for (int cnt = 0; cnt < host.getMainNumber().length(); cnt++) {
					if (cnt < 3)
						main_FirstNumber += host.getMainNumber().charAt(cnt);
					else if (3 <= cnt && cnt < 7)
						main_MiddleNumber += host.getMainNumber().charAt(cnt);
					else 
						main_LastNumber += host.getMainNumber().charAt(cnt);
				}
			}
		}
		
		// 나머지 정보
		String accountHolder = "", accountNumber = "";
		String lodgmentName = "", lodgmentHostName = "", lodgmentNumber = "", lodgmentAddress = "";
		
		if (host.getAccountHolder() != null && host.getAccountNumber() != null) {
			accountHolder = host.getAccountHolder();
			accountNumber = host.getAccountNumber();
		} 
		if (lodgment.getLodgmentName() != null && lodgment.getLodgmentHostName() != null && lodgment.getLodgmentNumber() != null && lodgment.getLodgmentAddress() != null) {
			lodgmentName = lodgment.getLodgmentName();
			lodgmentHostName = lodgment.getLodgmentHostName();
			lodgmentNumber = lodgment.getLodgmentNumber();
			lodgmentAddress = lodgment.getLodgmentAddress();
		}
		
	%>
	<script>
		// document load시 회원정보 setting
		$(function() {
			$(document).ready(function() {
				
				<% if (lodgmentType_1 != null) {
					for (int cnt = 0; cnt < lodgmentType_1.length; cnt++) {%>
						$("input[value=<%= lodgmentType_1[cnt] %>]").prop("checked", true);
					<%
					}%>
				<%}%>
				
				$("input[value='<%= lodgmentType_2 %>']").prop("checked", true);
				
				// 등록된 휴대폰 번호 document load시 value setting
				$("#" + "<%= phone_FirstNumber %>").prop("selected", true);
				$("#middlePhoneNumber").val("<%= phone_MiddleNumber %>");
				$("#lastPhoneNumber").val("<%= phone_LastNumber %>");
				
				// 등록된 대표 번호 document load시 value setting
				$("#" + "<%= main_FirstNumber %>").prop("selected", true);
				$("#middleMainNumber").val("<%= main_MiddleNumber %>");
				$("#lastMainNumber").val("<%= main_LastNumber %>");
				
				// 등록된 은행 value setting
				$("#" + "<%= host.getBank() %>").prop("selected", true);
				$(".nameInputArea").val("<%= accountHolder %>");
				$(".bankAccountInputArea").val("<%= accountNumber %>");
				
				$("#lodgmentName").val("<%= lodgmentName %>");
				$("#hostName").val("<%= lodgmentHostName %>");
				$(".bmNumberInputArea").val("<%= lodgmentNumber %>");
				$(".houseAddressInputArea").val("<%= lodgmentAddress %>");
			});
		});
	</script>
</head>
<body>
	<%@ include file = "/NiceChoice/niceChoice_Header.jsp" %>
	<div class = "myInfo_center">
		<div class="todo_Area">
			<div class="first">
				<img src="/project/Img/first.png" class="firstImg"> <br>
				마이페이지 <br> 업체 정보 등록
			</div>

			<div class="second">
				<img src="/project/Img/second.png" class="secondImg"> <br>
				소개 작성
			</div>

			<div class="third">
				<img src="/project/Img/third.png" class="thirdImg"> <br>
				이용규칙 관리
			</div>

			<div class="fourth">
				<img src="/project/Img/fourth.png" class="fourthImg"> <br>
				객실 관리
			</div>
		</div>
		
		<div style = "height : 18px;"> <!-- white Space Area --> </div>
		
		<div class = "updateMyInfo">
			<form id = "lodgmentRegForm" method = "POST">
				<table align = center class = "myInfoTable">
					<tr>
						<th rowspan = "3" class = "infoTableHeaderText">호스트정보</th>
						<td>
							<span class = "infoTableSubHeader">
								이메일
							</span>
							
							<span class = "memberEmail">
								<%= session.getAttribute("hostEmail") %>
							</span>
						</td>
					</tr>
					
					<tr>
						<td>
							<span class = "infoTableSubHeader">
								휴대폰 번호
							</span>
							
							<span class = "phoneNumberInputArea">
								<select class = "firstNumberSelector" id = "frontPhoneNumber" name = "frontPhoneNumber">
									<option value = "010" id = "010">010</option><option value = "011" id = "011">011</option><option value = "016" id = "016">016</option>
									<option value = "017" id = "017">017</option><option value = "018" id = "018">018</option><option value = "019" id = "019">019</option>
								</select>
								<input type = "text" class = "phoneNumberInputArea_2" id = "middlePhoneNumber" name = "middlePhoneNumber" maxlength = "4">
								<input type = "text" class = "phoneNumberInputArea_2" id = "lastPhoneNumber" name = "lastPhoneNumber" maxlength = "4">
							</span>
						</td>
					</tr>
					
					<tr>
						<td>
							<span class = "infoTableSubHeader">
								대표 번호
							</span>
							
							<span class = "mainNumberInputArea">
								<select class = "mainNumberSelector" id = "frontMainNumber" name = "frontMainNumber">
									<option value = "02" id = "02">02</option><option value = "031" id = "031">031</option><option value = "032" id = "032">032</option><option value = "033" id = "033">033</option>
									<option value = "010" id = "010">010</option><option value = "011" id = "011">011</option><option value = "016" id = "016">016</option><option value = "017" id = "017">017</option>
									<option value = "018" id = "018">018</option><option value = "019" id = "019">019</option>
								</select>
								<input type = "text" class = "mainNumberInputArea_2" id = "middleMainNumber" name = "middleMainNumber" maxlength = "4">
								<input type = "text" class = "mainNumberInputArea_2" id = "lastMainNumber" name = "lastMainNumber" maxlength = "4">
							</span>
						</td>
					</tr>
					
					<tr>
						<th rowspan = "6" class = "infoTableHeaderText">
							예약 정산<br>
							입금 계좌 정보
						</th>
					</tr>
					
					<tr>
						<td>
							<label class = "calcInfoText">* 사업자 등록상 같은 예금명, 계좌번호로 등록해주시기 바랍니다.</label>
						</td>
					</tr>
					
					<tr>
						<td>
							<span>
								<label class = "infoTableSubHeader">
									거래 은행
								</label>
								
								<select class = "bankSelector" id = "bank" name = "bank">
									<option value = "kb" id = "kb">국민은행</option><option value = "we" id = "we">우리은행</option><option value = "nonghyup" id = "nonghyup">농협은행</option><option value = "jaeil" id = "jaeil">제일은행</option>
								</select>
							</span>
						</td>
					</tr>
					
					<tr>
						<td>
							<span>
								<label class = "infoTableSubHeader">예금주</label>
								<input type = "text" class = "nameInputArea" placeholder = "이름을 입력하세요." id = "accountHolder" name = "accountHolder">
							</span>
						</td>
					</tr>
					
					<tr>
						<td>
							<span>
								<label class = "infoTableSubHeader">계좌 번호</label>
								<input class = "bankAccountInputArea" type = "text" placeholder = "숫자만 입력하세요." id = "accountNumber" name = "accountNumber">
							</span>
						</td>
					</tr>
					
					<tr>
						<td>
							<span class = "depositInfoArea">
								<label class = "depositInfoText">주 정산의 경우 익주 수요일에, 월정산의 경우, 익월 첫째주 수요일에 정산 입금됩니다.<br>
								자세한 사항은 영업담당자 또는 고객행복센터에 문의해 주시기 바랍니다.</label>
							</span>
						</td>
					</tr>
					
					<tr>
						<th rowspan = "7" class = "infoTableHeaderText">사업자 등록 정보</th>
						<td>
							<span class = "infoTableSubHeader">
								상호명(법인명)
							</span>
							<input type = "text" class = "hostRegistNameInputArea" placeholder = "사업자 등록증상 상호명" id = "lodgmentName" name = "lodgmentName">
						</td>
					</tr>
					
					<tr>
						<td>
							<label class = "nameInfoText">* 게스트하우스 이름은 별도로 기입이 가능하오니 필히 사업자 상호, 등록번호를 입력해주시기 바랍니다.</label>
						</td>
					</tr>
					
					<tr>
						<td>
							<label class = "infoTableSubHeader">등록증상 대표명</label>
							<input type = "text" class = "bmNameInputArea" placeholder = "대표자 명을 입력하세요." id = "hostName" name = "lodgmentHostName">
						</td>
					</tr>
					
					<tr>
						<td>
							<label class = "infoTableSubHeader" style = "position : relative; bottom : 10px;">업태</label>
							 
							<span class = "houseType">
								<label><input type = "checkbox" id = "lodgmentType_1" name = "lodgmentType_1" value = "숙박">숙박</label> 
								<label><input type = "checkbox" id = "lodgmentType_1" name = "lodgmentType_1" value = "기타">기타</label> 
								<label><input type = "checkbox" id = "lodgmentType_1" name = "lodgmentType_1" value = "음식및숙박">음식 및 숙박</label><br>
								<label><input type = "checkbox" id = "lodgmentType_1" name = "lodgmentType_1" value = "부동산">부동산</label> 
								<label><input type = "checkbox" id = "lodgmentType_1" name = "lodgmentType_1" value = "음식">음식</label> 
								<label><input type = "checkbox" id = "lodgmentType_1" name = "lodgmentType_1" value = "서비스">서비스</label>
							</span>
						</td>
					</tr>
					
					<tr>
						<td class = "td">
							<div>
								<span class = "infoTableSubHeader">
									업종
								</span>
								
								<span class = "houseType_2">
									<label><input type = "radio" id = "lodgmentType_2" name = "lodgmentType_2" value = "모텔">모텔</label>
									<label><input type = "radio" id = "lodgmentType_2" name = "lodgmentType_2" value = "호텔/리조트">호텔/리조트</label> 
									<label><input type = "radio" id = "lodgmentType_2" name = "lodgmentType_2" value = "펜션">펜션</label>
									<label><input type = "radio" id = "lodgmentType_2" name = "lodgmentType_2" value = "게스트하우스">게스트하우스</label> <br>
									<label><input type = "radio" id = "lodgmentType_2" name = "lodgmentType_2" value = "캠핑/글램핑">캠핑/글램핑</label>
								</span>
							</div>
						</td>
					</tr>
					
					<tr>
						<td>
							<label class = "infoTableSubHeader">사업자 등록번호</label>
							<input type = "text" class = "bmNumberInputArea" placeholder = "숫자만 입력하세요." id = "lodgmentNumber" name = "lodgmentNumber">
						</td>
					</tr>
					
					<tr>
						<td>
							<label class = "infoTableSubHeader">업체 주소</label>
							<span>
								<input type = "text" class = "houseAddressInputArea" placeholder = "사업자 등록증상 업체 주소를 입력하세요." id = "lodgmentAddress" name = "lodgmentAddress">
							</span>
						</td>
					</tr>
				</table>
				<div class = "regBtnArea">
					<button type = "button" class = "regBtn" onclick = "verify()">저장 후 다음단계</button>
				</div>
			</form>
		</div>
	</div>
	<%@ include file = "/NiceChoice/niceChoice_footer.jsp" %>
</body>
</html>