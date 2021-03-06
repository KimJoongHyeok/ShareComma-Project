package org.kosta.ShareCommaProject.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

 
public class ImageDAO {
	private static ImageDAO instance = new ImageDAO();
	private DataSource dataSource;

	private ImageDAO() {
		dataSource = DataSourceManager.getInstance().getDataSource();
	}

	public static ImageDAO getInstance() {
		System.out.println("ImageDAO 객체생성");
		return instance;
	}

	public void closeAll(Connection con, PreparedStatement pstmt) throws SQLException {
		if (pstmt != null)
			pstmt.close();
		if (con != null)
			con.close();
	}

	public void closeAll(Connection con, PreparedStatement pstmt, ResultSet rs) throws SQLException {
		if (rs != null)
			rs.close();
		closeAll(con, pstmt);
	}
	
	public void insertImage(HouseVO hvo,String orgname, String filename, String filepath, long fileSize)
			throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = dataSource.getConnection();
			String sql = "insert into house_image  values (seq_house_image.nextval,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql); 
			
			pstmt.setString(1, hvo.getHouseId());
			pstmt.setString(2, orgname);
			pstmt.setString(3, filename);
			pstmt.setString(4, filepath);
			pstmt.setLong(5, fileSize);
	 
			pstmt.executeUpdate();
		} finally {
			closeAll(con, pstmt);
			
		}
		System.out.println("이미지 업로드");
	}

	public ImageVO getImage(HouseVO hvo) throws SQLException {
	
		ImageVO Ivo = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			System.out.println("getImage()시작");
			con = dataSource.getConnection();
			String sql="select  orgname,filename,filepath from house_image where house_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, hvo.getHouseId());
			
			rs = pstmt.executeQuery();
			if (rs.next()) {
				Ivo=new ImageVO(hvo,rs.getString(1),rs.getString(2),rs.getString(3),null);
				System.out.println(Ivo);
			}
		} finally {
			closeAll(con, pstmt, rs);
		}
		return Ivo;
	}
	
	
	public void updateImage(HouseVO hvo, String orgname, String filename, String filepath, long fileSize)
			throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = dataSource.getConnection();
			String sql = "update house_image set orgname =?, filename=?, filepath=?, filesize=? where house_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, orgname);
			pstmt.setString(2, filename);
			pstmt.setString(3, filepath);
			pstmt.setLong(4, fileSize);
			pstmt.setString(5, hvo.getHouseId());
			
			pstmt.executeUpdate();
		} finally {
			closeAll(con, pstmt);
			
		}
		System.out.println("이미지 업데이트");
	}
	
}
