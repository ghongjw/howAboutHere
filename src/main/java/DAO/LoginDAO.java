package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginDAO {
	
	private Connection connect;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public LoginDAO() {
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
	
	public boolean verifyAccount(String email, String pw) {
		String verifyAccountQuery = "SELECT * FROM hostMember WHERE email = ?";
		
		try {
			ps = connect.prepareStatement(verifyAccountQuery);
			ps.setString(1, email);
			rs = ps.executeQuery();
			
			if (rs.next()) {
				if (rs.getString("pw").equals(pw))
					return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return false;
	}
}
