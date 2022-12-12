package teamproject;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
	/*
	 CREATE TABLE unlogre(
	 reservationnum varchar2(30),
	 mobile varchar2(30),
	 reservationDate varchar2(50), 
	 username varchar2(50), 
	 hotelname varchar2(50) 
	 );
	 */
	public void insert(UnloginReservationDTO unloginReservation) {
		String sql = "INSERT INTO unlogre VALUES(?,?,?,?,?)";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1,unloginReservation.getReservationNum());
			ps.setString(2,unloginReservation.getMobile());
			ps.setString(3,unloginReservation.getReservationDate());
			ps.setString(4,unloginReservation.getUserName());
			ps.setString(5,unloginReservation.getHotelName());
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public UnloginReservationDTO selectMobile(String mobile) {
		String sql = "SELECT * FROM unlogre WHERE mobile=?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, mobile);
			rs = ps.executeQuery();
			if(rs.next()) {
				UnloginReservationDTO UnloginReservation = new UnloginReservationDTO();
				UnloginReservation.setMobile(mobile);
				UnloginReservation.setReservationNum(rs.getString("reservationnum"));
				UnloginReservation.setReservationDate(rs.getString("reservationDate"));
				UnloginReservation.setUserName(rs.getString("username"));
				UnloginReservation.setHotelName(rs.getString("hotelname"));
				return UnloginReservation;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	public void deleteRe(String mobile) {
		String sql = "DELETE FROM unlogre WHERE mobile=?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, mobile);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void setReservation(int reservationNum, String mobile, String reservationDate, String username, String hotelname) {
		String sql = "insert into unlogre values(?,?,?,?,?)";
		
		try {
			ps=con.prepareStatement(sql);
			ps.setInt(1,reservationNum);
			ps.setString(2,mobile);
			ps.setString(3,reservationDate);
			ps.setString(4,username);
			ps.setString(5,hotelname);
			ps.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public ArrayList<UnloginReservationDTO> renumList(String mobile) {
		String sql = "SELECT * From unlogre WHERE mobile=?";
		ArrayList<UnloginReservationDTO> unloginReservations = new ArrayList<>();
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, mobile);
			rs = ps.executeQuery();
			while (rs.next()) {
				UnloginReservationDTO unloginReservation = new UnloginReservationDTO();
				unloginReservation.setMobile(mobile);
				unloginReservation.setReservationNum(rs.getString("reservationnum"));
				unloginReservation.setReservationDate(rs.getString("reservationDate"));
				unloginReservation.setUserName(rs.getString("username"));
				unloginReservation.setHotelName(rs.getString("hotelname"));
				unloginReservations.add(unloginReservation);
			}
		} catch (Exception e) {
		}
		return unloginReservations;
	}
	public boolean numExist(int num) {
String sql = "select count(reservationnum) from unlogre where reservationnum = ?";
		boolean check=false;
		try {
			ps=con.prepareStatement(sql);
			ps.setInt(1,num);
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
	public void disconnection() {
		try {
			if (con != null)
				con.close();
			if (ps !=null)
				ps.close();
			if (rs != null)
				rs.close();
		} catch (Exception e) {
		}
	}
}
