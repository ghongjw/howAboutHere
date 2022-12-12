package teamproject;

public class UnloginReservationDTO {
	private String reservationNum;
	private String mobile;
	private String reservationDate;
	private String userName;
	private String hotelName;
	
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getReservationDate() {
		return reservationDate;
	}
	public void setReservationDate(String reservationDate) {
		this.reservationDate = reservationDate;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getHotelName() {
		return hotelName;
	}
	public void setHotelName(String hotelName) {
		this.hotelName = hotelName;
	}
	public String getReservationNum() {
		return reservationNum;
	}
	public void setReservationNum(String reservationNum) {
		this.reservationNum = reservationNum;
	}
}
