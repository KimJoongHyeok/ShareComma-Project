package org.kosta.ShareCommaProject.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

public class MemberDAO {
	private static MemberDAO instance=new MemberDAO();
	private DataSource dataSource;
	private MemberDAO() {
		this.dataSource=DataSourceManager.getInstance().getDataSource();
	}
	public static MemberDAO getInstance() {
		return instance;
	}
	public void closeAll(PreparedStatement pstmt,Connection con) throws SQLException{
		if(pstmt!=null)
			pstmt.close();
		if(con!=null)
			con.close();
	}
	public void closeAll(ResultSet rs,PreparedStatement pstmt,Connection con) throws SQLException{
		if(rs!=null)
			rs.close();
		closeAll(pstmt, con);
	}
	public MemberVO login(String id, String password) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberVO mvo = null;
		try {
			con = dataSource.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("select member_id,member_password,member_name,member_phone, ");
			sql.append("member_nickname,to_char(member_regdate,'yyyy.mm.dd hh24:mi:ss'),member_status ");
			sql.append("from member ");
			sql.append("where member_id = ? and member_password = ? ");
			sql.append("and member_status != 'sleep' ");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				mvo = new MemberVO(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7));
			}
		}finally {
			closeAll(rs, pstmt, con);
		}
		return mvo;
	}
	public void registerMember(MemberVO mvo) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = dataSource.getConnection();
			String sql = "insert into member values(?,?,?,?,?,sysdate,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mvo.getId());
			pstmt.setString(2, mvo.getPassword());
			pstmt.setString(3, mvo.getName());
			pstmt.setString(4, mvo.getPhone());
			pstmt.setString(5, mvo.getNickName());
			pstmt.setString(6, mvo.getStatus());
			pstmt.executeUpdate();
		}finally {
			closeAll(pstmt, con);
		}
	}
	public void deleteMember(String id) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = dataSource.getConnection();
			String sql = "update member set member_status = 'sleep' where member_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
		}finally {
			closeAll(pstmt, con);
		}
	}
	public void updateMember(MemberVO mvo) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = dataSource.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("update member set member_password = ?,member_name = ?,member_phone = ?, ");
			sql.append("member_nickname = ? where member_id = ? ");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, mvo.getPassword());
			pstmt.setString(2, mvo.getName());
			pstmt.setString(3, mvo.getPhone());
			pstmt.setString(4, mvo.getNickName());
			pstmt.setString(5, mvo.getId());
			pstmt.executeUpdate();
			
		}finally {
			closeAll(pstmt, con);
		}
	}
	
	public boolean checkId(String id) throws SQLException {
		boolean result=false;
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=dataSource.getConnection();
			String sql="select count(*) from member where member_id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next() && rs.getInt(1)==1) 
				result=true; 
		}finally {
			closeAll(rs, pstmt, con);
		}
		return result; 
	}
	public void becomeHost(String id) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = dataSource.getConnection();
			String sql ="update member set member_status='HOST' where member_id= ? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
		}finally {
			closeAll(pstmt, con);
		}
	}
	public MemberVO getMemberById(String id) throws SQLException {	
		MemberVO mvo = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = dataSource.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("select member_id,member_password,member_name,member_phone, ");
			sql.append("member_nickname,to_char(member_regdate,'yyyy.mm.dd hh24:mi:ss'),member_status ");
			sql.append("from member ");
			sql.append("where member_id = ?");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				mvo = new MemberVO(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7));
			}
		}finally {
			closeAll(rs, pstmt, con);
		}
		return mvo;
	}
}
