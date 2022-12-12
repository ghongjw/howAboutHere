package teamproject;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;






public class MemberDAO {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	public MemberDAO() {
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
CREATE TABLE member(
email varchar2(100), 이메일
pw varchar2(30), 비밀번호
nick varchar2(30), 닉네임
mobile varchar2(30), 전화번호
infoagree varchar2(10), 개인정보동의
marketingagree varchar2(10), 마케팅동의
positionagree varchar2(10), 위치정보동의
username varchar2(50), 회원이름
point varchar2(50) 포인트
);
	 
	 commit;
	 */
	public void Insert(MemberDTO member) {
		String sql = "INSERT INTO member VALUES(?,?,?,?,?,?,?,?,?)";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, member.getEmail());
			ps.setString(2, member.getPw());
			ps.setString(3, member.getNick());
			ps.setString(4, member.getMobile());
			ps.setString(5, member.getInfoagree());
			ps.setString(6, member.getMarketingagree());
			ps.setString(7, member.getPositionagree());
			ps.setString(8, member.getUsername());
			ps.setInt(9, member.getPoint());
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public MemberDTO selectEmail(String email) {
		String sql = "SELECT * FROM member WHERE email=?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, email);
			rs = ps.executeQuery();
			if(rs.next()) {
				MemberDTO member = new MemberDTO();
				member.setEmail(email);
				member.setPw(rs.getString("pw"));
				member.setNick(rs.getString("nick"));
				member.setMobile(rs.getString("mobile"));
				member.setInfoagree(rs.getString("infoagree"));
				member.setMarketingagree(rs.getString("marketingagree"));
				member.setPositionagree(rs.getString("positionagree"));
				member.setUsername(rs.getString("username"));
				member.setPoint(rs.getInt("point"));
				return member;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	public MemberDTO selectNick(String nick) {
		String sql = "SELECT * FROM member WHERE nick=?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, nick);
			rs = ps.executeQuery();
			if(rs.next()) {
				MemberDTO member = new MemberDTO();
				member.setEmail(rs.getString("email"));
				member.setPw(rs.getString("pw"));
				member.setNick(rs.getString("nick"));
				member.setMobile(rs.getString("mobile"));
				member.setInfoagree(rs.getString("infoagree"));
				member.setMarketingagree(rs.getString("marketingagree"));
				member.setPositionagree(rs.getString("positionagree"));
				member.setUsername(rs.getString("username"));
				member.setPoint(rs.getInt("point"));
				return member;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	public void updateNick(String chnick,String nick) {
		String sql = "UPDATE member SET nick=? WHERE nick=?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, chnick);
			ps.setString(2, nick);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	public void updatePw(String chpw,String email) {
		String sql = "UPDATE member SET pw=? WHERE email=?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, chpw);
			ps.setString(2, email);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	public void updateName(String name,String email) {
		String sql = "UPDATE member SET username=? WHERE email=?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, email);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	public void updateMobile(String mobile,String email) {
		String sql = "UPDATE member SET mobile=? WHERE email=?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, mobile);
			ps.setString(2, email);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	public void modify(String email,int point,String nick,String mobile) {
		String sql = "UPDATE member SET point=?,nick=?,mobile=? WHERE email=?";
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, point);
			ps.setString(2, nick);
			ps.setString(3, mobile);
			ps.setString(4, email);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	public void delete(String email) {
		String sql = "DELETE FROM member WHERE email=?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, email);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public List<MemberDTO> list(int begin, int end) {
		String sql = "SELECT B.* FROM (SELECT ROWNUM rn, A.* FROM (SELECT email,pw,mobile,nick,point FROM member)A)B WHERE rn >= ? AND rn <= ?";
		ArrayList<MemberDTO> members = new ArrayList<>();
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, begin);
			ps.setInt(2, end);
			rs = ps.executeQuery();
			while (rs.next()) {
				MemberDTO member = new MemberDTO();
				member.setEmail(rs.getString("email"));
				member.setPw(rs.getString("pw"));
				member.setMobile(rs.getString("mobile"));
				member.setNick(rs.getString("nick"));
				member.setPoint(rs.getInt("point"));
				members.add(member);
			}
		} catch (Exception e) {
		}
		return members;
	}
	public int count() {
		String sql = "SELECT count(*) as cnt FROM member";

		PreparedStatement ps = null;
		ResultSet rs = null;
		int count = 0;
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
		}
		return count;
	}
	//////////////회원결제용 ///////////////
	public int Point(String email) {
		int point=0;
		String sql = "select point from member where email = ?";
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, email);
			rs = ps.executeQuery();
			if (rs.next()) {
				point = rs.getInt("point");
			}
		} catch (Exception e) {
		}
		
		return point;
	}
	
	public void setPoint(String email,int point) {
		String sql = "update member set point = ? where email = ?";
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, point);
			ps.setString(2, email);
			ps.executeUpdate();
		} catch (Exception e) {
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
