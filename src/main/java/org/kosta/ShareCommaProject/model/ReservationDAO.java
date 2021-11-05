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
	
}
