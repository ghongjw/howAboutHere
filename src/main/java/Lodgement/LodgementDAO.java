package Lodgement;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LodgementDAO {
	private Connection con;
	private PreparedStatement ps=null;
	private ResultSet rs = null;
	public LodgementDAO() {
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
	
	public LodgementDTO list(String HostName) {
		LodgementDTO lodgement = new LodgementDTO();
		String sql = "select * from "+HostName;
		
		System.out.print("hostName : " + HostName + "\n");
		
		try {
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			
			while(rs.next()){
				lodgement.setLodgmentName(rs.getString("LodgmentName"));
				lodgement.setLodgmentHostName(rs.getString("LodgmentHostName"));
				lodgement.setLodgmentType_2(rs.getString("LodgmentType_2"));
				lodgement.setLodgmentNumber(rs.getString("LodgmentNumber"));
				lodgement.setLodgmentAddress(rs.getString("LodgmentAddress"));
				lodgement.setConvenienceFacility(rs.getString("ConvenienceFacility"));
				lodgement.setIntroByHost(rs.getString("IntroByHost"));
				lodgement.setWayToCome(rs.getString("WayToCome"));
				lodgement.setNearbyFacility(rs.getString("NearbyFacility"));
				lodgement.setLodgmentRule(rs.getString("LodgmentRule"));
				lodgement.setDynamicCharge(rs.getString("DynamicCharge"));
				lodgement.setParkingInfo(rs.getString("ParkingInfo"));
				lodgement.setChecklist(rs.getString("Checklist"));
				lodgement.setInTime(rs.getString("InTime"));
				lodgement.setOutTime(rs.getString("OutTime"));
				lodgement.setDeadlineTime(rs.getString("DeadlineTime"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return lodgement;
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