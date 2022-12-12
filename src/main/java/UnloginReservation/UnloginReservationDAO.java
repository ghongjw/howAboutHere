package UnloginReservation;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import Lodgement.RoomDTO;

public class UnloginReservationDAO {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;

	public UnloginReservationDAO() {
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "oracle";
		String password = "oracle";

		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void setReservation(String reservationNum, String mobile, String reservationDate, String username, String hotelname, String email) {
		String sql = "insert into unlogre values(?,?,?,?,?,?)";
		
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1,reservationNum);
			ps.setString(2,mobile);
			ps.setString(3,reservationDate);
			ps.setString(4,username);
			ps.setString(5,hotelname);
			ps.setString(6,email);
			ps.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public boolean numExist(String num) {
String sql = "select count(reservationnum) from unlogre where reservationnum = ?";
		boolean check=false;
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1,num);
			rs=ps.executeQuery();
			if(rs.next()) {
				int row = rs.getInt(1);
				if (row==0) {
					check=true;
				}
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return check;
	}
	/*
	 * CREATE TABLE unlogre( reservationnum number(10), 예약번호 mobile varchar2(30),
	 * 전화번호 reservationDate varchar2(50), 예약날짜 username varchar2(50), 이름 hotelname
	 * varchar2(50) 숙소이름 );
	 */

}
