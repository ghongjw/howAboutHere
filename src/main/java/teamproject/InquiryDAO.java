package teamproject;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class InquiryDAO {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	public InquiryDAO() {
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
	 CREATE TABLE more_inquiry(
	 num number(10) primary key not null,
	 email varchar2(100), 
	 category varchar2(50), 
	 inquiry varchar2(50), 
	 mobile varchar2(30), 
	 writetime varchar2(50),
	 content varchar2(1000),
	 answertext varchar2(1000),
	 success varchar2(30)
	 );
	 */
	
	/*
	   CREATE SEQUENCE inquiry_seq
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       MAXVALUE 9999
       NOCYCLE
       NOCACHE
       NOORDER;
	 */
	
	
	public void insert(InquiryDTO member) {
		String sql = "INSERT INTO more_inquiry VALUES(inquiry_seq.nextval,?,?,?,?,?,?,?,?)";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, member.getEmail());
			ps.setString(2, member.getCategory());
			ps.setString(3, member.getInquiry());
			ps.setString(4, member.getMobile());
			ps.setString(5, member.getWriteTime());
			ps.setString(6, member.getContent());
			ps.setString(7, member.getAnswertext());
			ps.setString(8, member.getSuccess());
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public ArrayList<InquiryDTO> list(String email){
		String sql = "SELECT * FROM more_inquiry WHERE email=? ORDER BY num DESC";
		ArrayList<InquiryDTO> members = new ArrayList<>();
		try {
			ps = con.prepareCall(sql);
			ps.setString(1, email);
			rs = ps.executeQuery();
			while(rs.next()) {
				InquiryDTO member = new InquiryDTO();
				member.setNum(rs.getInt("num"));
				member.setEmail(rs.getString("email"));
				member.setCategory(rs.getString("category"));
				member.setInquiry(rs.getString("inquiry"));
				member.setMobile(rs.getString("mobile"));
				member.setWriteTime(rs.getString("writetime"));
				member.setContent(rs.getString("content"));
				member.setAnswertext(rs.getString("answertext"));
				member.setSuccess(rs.getString("success"));
				members.add(member);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return members;
		
	}
	public ArrayList<InquiryDTO> allList(){
		String sql = "SELECT * FROM more_inquiry ORDER BY num DESC";
		ArrayList<InquiryDTO> members = new ArrayList<>();
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				InquiryDTO member = new InquiryDTO();
				member.setNum(rs.getInt("num"));
				member.setEmail(rs.getString("email"));
				member.setCategory(rs.getString("category"));
				member.setInquiry(rs.getString("inquiry"));
				member.setMobile(rs.getString("mobile"));
				member.setWriteTime(rs.getString("writetime"));
				member.setContent(rs.getString("content"));
				member.setAnswertext(rs.getString("answertext"));
				member.setSuccess(rs.getString("success"));
				members.add(member);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return members;
		
	}
	
	public void delete(int num) {
		String sql = "DELETE FROM more_inquiry WHERE num=?";
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public void updateAnswer(String answertext,String success,String content) {
		String sql = "UPDATE more_inquiry SET answertext=?,success=? WHERE content=?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, answertext);
			ps.setString(2, success);
			ps.setString(3, content);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
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
	

