<%@page import="teamproject.MemberDTO"%>
<%@page import="teamproject.MemberDAO"%>
<%@page import="java.util.regex.Pattern"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="Lodgement.RoomDAO"%>
<%@page import="UnloginReservation.UnloginReservationDAO"%>

<%
String email = (String) session.getAttribute("email");

request.setCharacterEncoding("UTF-8");
String Name = request.getParameter("Name");
String mobilePhone = request.getParameter("mobilePhone");
String LodgmentHostName = request.getParameter("LodgmentHostName");
String LodgmentName = request.getParameter("LodgmentName");
String roomType = request.getParameter("roomType");
String roomName = request.getParameter("roomName");
String datefilter = request.getParameter("datefilter");
String diff = request.getParameter("diff");
String strpoint = request.getParameter("point_test");

String strusingPoint =request.getParameter("inputpoint");
String strprice = request.getParameter("price");


System.out.println("name : "+Name);
System.out.println("mobilePhone : "+mobilePhone);
System.out.println("LodgmentHostName : "+LodgmentHostName);
System.out.println("LodgmentName : "+LodgmentName);
System.out.println("roomType : "+roomType);
System.out.println("roomName : "+roomName);
System.out.println("datefilter : "+datefilter);
System.out.println("strpoint : "+strpoint);
System.out.println("strusingPoint : "+strusingPoint);
System.out.println("strprice : "+strprice);

int point=0;
int price= 0;
int useingPoint=0;

if(strpoint != null){
point = Integer.parseInt(strpoint);
}
if(strusingPoint != null){
	useingPoint = Integer.parseInt(strusingPoint);
}
if(strprice != null){
	price = Integer.parseInt(strusingPoint);
}
/////////////결제가격에 5% 포인트부여/////////////////////
int givePoint = (int)((price+useingPoint)*0.05);
point = point+givePoint;

Pattern pattern = Pattern.compile("^[가-힣a-zA-Z]+$");
if (!pattern.matcher(Name).matches()) {
%><script>
	alert("잘못된 접근입니다. 이름");
	location.href="../main/main.jsp";
	</script>
<%
return;
}
Pattern pattern1 = Pattern.compile("^01(?:0|1|[6-9])(?:\\d{3}|\\d{4})\\d{4}$");
if (!pattern1.matcher(mobilePhone).matches()) {
%><script>
	alert("잘못된 접근입니다. 전화번호);
	location.href="../main/main.jsp";
	</script>
<%
return;
}
if (LodgmentHostName == null || LodgmentName == null 
		|| datefilter == null|| roomType == null || Name == null
		|| Name.isEmpty() || mobilePhone == null| diff == null 
		|| roomName == null) {
%><script>
alert("잘못된 접근입니다.");
location.href="../main/main.jsp";

</script>
<%
return;
}
MemberDAO memberDao = new MemberDAO();
UnloginReservationDAO urDao = new UnloginReservationDAO();
RoomDAO roomDao = new RoomDAO();
int reservationNum = 0;
String reserveCode = "";

//예약번호DB에있으면 다시생성
while (true) {
for (int i = 0; i < 6; i++) {
	reservationNum = (int) (Math.random() * 10);
	reserveCode += Integer.toString(reservationNum);
}
if (urDao.numExist(reserveCode)) {
	break;
}	
}

String msg = "";
String path = "";
///////////예약/////////////////////
MemberDTO member = memberDao.selectEmail(email);

String roomTableName = LodgmentHostName + "lodgmentRoom";

int roomCount = Integer.parseInt(roomDao.isRoomExsit(roomTableName, roomName, roomType));

if (roomCount > 0) {
	if (email == null || email.isEmpty()){
	roomDao.countdown(roomTableName, roomName, roomType);
	urDao.setReservation(reserveCode, mobilePhone, datefilter, Name, LodgmentName, "비회원");
	msg = "예약 완료! 예약 번호는" + reserveCode + "입니다";
	path = "../index/main.jsp";
	}else{
	if(point>member.getPoint()){
		msg ="포인트를 잘못입력하셨습니다.";
		%><script> history.back(); </script><%
	}else{
	urDao.setReservation(reserveCode, mobilePhone, datefilter, Name, LodgmentName, email);
	memberDao.setPoint(email,point);
	roomDao.countdown(roomTableName, roomName, roomType);
	msg = "예약 완료! 예약 번호는" + reserveCode + "입니다. 그리고 부여 포인트는 "+givePoint+"Point 입니다" ;
	path = "../index/main.jsp";
	}
}

}else {

	msg = "방이 이미 나갔어요!";
	path = "../main/main.jsp";
}


%><script> alert('<%= msg%>'); location.href='<%=path%>';
</script>
