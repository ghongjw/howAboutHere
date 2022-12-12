package Lodgement;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class RoomDAO {
	private Connection con;
	private PreparedStatement ps = null;
	private ResultSet rs = null;

	public RoomDAO() {
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

	public ArrayList<RoomDTO> list(String tablename){
		String sql = "select * from "+ tablename;
		ArrayList<RoomDTO> rooms = new ArrayList<>();
		try {
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()) {
				RoomDTO  roomDto =new RoomDTO();
				roomDto.setRoomName(rs.getString("roomName"));
				roomDto.setRoomType(rs.getString("roomType"));
				roomDto.setRoomCount(rs.getString("roomCount"));
				roomDto.setCapacity(rs.getString("capacity"));
				roomDto.setRoomIntro(rs.getString("roomIntro"));
				roomDto.setConvenienceFacility(rs.getString("convenienceFacility"));
				roomDto.setLentPrice(rs.getString("lentPrice"));
				roomDto.setOnenightPrice(rs.getString("onenightPrice"));
				rooms.add(roomDto);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return rooms;
	}
	public String isRoomExsit(String roomTableName, String roomName, String roomType){
		String sql = "select roomCount from "+roomTableName+" where roomName = ? and roomType = ?";
		String Roomcount = "";
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1, roomName);
			ps.setString(2, roomType);
			rs=ps.executeQuery();
			while(rs.next()) {
				Roomcount=rs.getString("roomCount");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}return Roomcount;
		
	}
	public void countdown(String roomTableName, String roomName, String roomType) {
		String room=isRoomExsit(roomTableName, roomName, roomType);
		int roomcount = Integer.parseInt(room)-1;
		room = Integer.toString(roomcount);
		String sql = "Update "+roomTableName+" set roomCount = ? where roomName = ? and roomType = ?";
		System.out.println("roomName:" +roomType);
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1,room);
			ps.setString(2,roomName);
			ps.setString(3,roomType);
			ps.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public void disconnection() {

		try {
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}
			if (con != null) {
				con.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}