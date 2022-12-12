package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import DTO.HostMemberDTO;

public class FindPwDAO {
	
	private Connection connect;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public FindPwDAO() {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		try {
			connect = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "oracle", "oracle");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public HostMemberDTO findPw(String email) {
		String findPwQuery = "SELECT * FROM hostMember WHERE email = ?";
				
		try {
			ps = connect.prepareStatement(findPwQuery);
			ps.setString(1, email);
			rs = ps.executeQuery();
			
			if (rs.next()) {
				HostMemberDTO host = new HostMemberDTO();
				host.setEmail(rs.getString("email"));
				host.setPw(rs.getString("pw"));
				
				return host;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return null;
	}
}
