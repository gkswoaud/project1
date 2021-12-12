package shopdb;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberDAO {

	private static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
	private static final String JDBC_URL = "jdbc:mysql://localhost:3306/shopdb?useUnicode=true&characterEncoding=euckr";
	private static final String USER = "root";
	private static final String PASSWD = "1234";


	private Connection con = null;
	private PreparedStatement pstmt = null;


	public MemberDAO() {

		try {
			Class.forName(JDBC_DRIVER);
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}


	public void connect() {
		try {

			con = DriverManager.getConnection(JDBC_URL, USER, PASSWD);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


	public void disconnect() {

		try{
			if(pstmt != null)	
				pstmt.close();	
		 
			if(con != null)
				con.close();
		
		} catch(SQLException e){
			e.printStackTrace();
		}
	}


	public boolean insertDB(MemberEntity member) {
		boolean success = false; 
		connect();
		String sql ="insert into member values(?, ?, ?, ?, ?, ? )";		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPasswd());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getJnum());
			pstmt.setString(5, member.getCnum());
			pstmt.setString(6, member.getAnum());
			int rows = pstmt.executeUpdate();
			if(rows == 1) success = true; 
		} catch (SQLException e) {
			e.printStackTrace();
			return success;
		}
		finally {
			disconnect();
		}
		return success;
	}
	

	
	
	public boolean isPasswd(String id, String passwd) {
		boolean success = false;
		connect();		
		String sql ="select passwd from member where id=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			String orgPasswd = rs.getString(1);
			if ( passwd.equals(orgPasswd) ) success = true; 
			rs.close();			
		} catch (SQLException e) {
			e.printStackTrace();
			return success;
		}
		finally {
			disconnect();
		}
		return success;
	}	
	

	
	public MemberEntity getMember(String id) {	
		connect();
		String SQL = "select * from member where id = ?";
		MemberEntity member = new MemberEntity();
		
		try {
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();			
			rs.next();
			member.setId( rs.getString("id") );
			member.setPasswd ( rs.getString("passwd") );
			member.setName ( rs.getString("name") );
			member.setJnum(rs.getString("jnum"));
			member.setCnum(rs.getString("cnum"));
			member.setAnum(rs.getString("anum"));
			rs.close();			
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		finally {
			disconnect();
		}
		return member;
	}
	
	

	
}
