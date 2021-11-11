package org.kosta.ShareCommaProject.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;


public class ReservationDAO {
	private static ReservationDAO instance= new ReservationDAO();
	private DataSource dataSource;
	private ReservationDAO() {
		this.dataSource=DataSourceManager.getInstance().getDataSource();
	}
	public static ReservationDAO getInstance() {
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
	
	public void reservateHouse(ReservationVO rvo) throws SQLException {
		HouseVO hvo =null;
		MemberVO mvo=null;
	 	Connection con=null;
		PreparedStatement pstmt=null;
		try {
			System.out.println("숙소예약 시작");
			System.out.println(rvo);
			con=dataSource.getConnection();
			String sql="insert into reservation values (to_date(?,'yyyy-mm-dd'),to_date(?,'yyyy-mm-dd'),sysdate,?,?,?)"; 
			pstmt=con.prepareStatement(sql);
	 		pstmt.setString(1, rvo.getCheckIn());
	 		pstmt.setString(2, rvo.getCheckOut());
	 		pstmt.setInt(3, rvo.getCountPerson());
	 		pstmt.setString(4, rvo.getHouseVO().getHouseId());
	 		pstmt.setString(5, rvo.getMemberVO().getId());
	 		pstmt.executeQuery();
			System.out.println("예약완료");
		}finally {
			closeAll(pstmt, con);
		}
		 
	}
	public ArrayList<ReservationVO> getReservationList(String id) throws SQLException {
		HouseVO hvo =null;
		MemberVO mvo=null;
		ReservationVO rvo=null;
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs= null;
		ArrayList< ReservationVO> list= new ArrayList<ReservationVO>();
		try {
			System.out.println("숙소리스트");
 
			con=dataSource.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("select to_char( r.check_in,'yyyy.mm.dd') as check_in,to_char(r.check_out,'yyyy.mm.dd')as check_out,to_char(r.reg_date,'yyyy.mm.dd')as reg_date ,r.count_people,r.house_id,r.member_id,h.house_name ");
			sql.append("from reservation r,house h  ");
			sql.append("where  r.house_id = h.house_id and r.member_id=? order by r.house_id asc ");
		  	pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				rvo=new ReservationVO();
				rvo.setCheckIn(rs.getString("check_in"));
				rvo.setCheckOut(rs.getString("check_out"));
				rvo.setReservDate(rs.getString("reg_date"));
				rvo.setCountPerson(rs.getInt("count_people"));
				hvo=new HouseVO();
				mvo=new MemberVO();
				mvo.setId(rs.getString("member_id"));
				rvo.setMemberVO(mvo);
				hvo.setHouseId(rs.getString("house_id"));
				hvo.setHouseName(rs.getString("house_name"));
				rvo.setHouseVO(hvo);
				list.add(rvo);
			}
			System.out.println(rvo);
		}finally {
			closeAll(rs, pstmt, con);
		}
		return list;
	}
	
}
