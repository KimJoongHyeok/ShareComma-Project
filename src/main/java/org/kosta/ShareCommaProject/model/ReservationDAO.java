package org.kosta.ShareCommaProject.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
	
}
