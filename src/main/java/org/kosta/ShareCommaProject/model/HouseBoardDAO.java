package org.kosta.ShareCommaProject.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

public class HouseBoardDAO {
	private static HouseBoardDAO instance = new HouseBoardDAO();
	private DataSource dataSource;

	private HouseBoardDAO() {
		this.dataSource = DataSourceManager.getInstance().getDataSource();
	}

	public static HouseBoardDAO getInstance() {
		return instance;
	}

	public void closeAll(PreparedStatement pstmt, Connection con) throws SQLException {
		if (pstmt != null)
			pstmt.close();
		if (con != null)
			con.close();
	}

	public void closeAll(ResultSet rs, PreparedStatement pstmt, Connection con) throws SQLException {
		if (rs != null)
			rs.close();
		closeAll(pstmt, con);
	}
	


	public void registHouse(HouseVO hvo) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = dataSource.getConnection();
			String sql = "insert into house values(seq_house.nextval,?,?,?,sysdate,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, hvo.getHouseName());
			pstmt.setString(2, hvo.getHouseAddress());
			pstmt.setString(3, hvo.getHouseContent());
			pstmt.setString(4, hvo.getMemberVO().getId());
			pstmt.executeUpdate();
		} finally {
			closeAll(pstmt, con);
		}
	}

}
