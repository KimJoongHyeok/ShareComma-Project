package org.kosta.ShareCommaProject.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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

	public String registHouse(HouseVO hvo) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		String hid=null;
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
		return hid;
	}

	public HouseVO getHouseById(String id) throws SQLException {
		// TODO Auto-generated method stub
		HouseVO hvo = new HouseVO();
		MemberVO mvo = null;
		ImageVO ivo = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			System.out.println(id + "search 시작");
			con = dataSource.getConnection();
			String sql = "select h.*,m.member_name,m.member_nickname,m.member_phone,hm.image_id,hm.filepath from house h inner join member m on m.member_id =h.member_id left outer join house_image hm on h.house_id=hm.house_id and h.house_id=?";
			// 검색결과
			// 하우스(id,name,address,content,house_time_posted)멤버(id,name,phone,nickname,)
			// 이미지 (id,houseid,orgname,filename,filepath,filesize)
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				hvo.setHouseId(rs.getString(1));
				hvo.setHouseName(rs.getString(2));
				hvo.setHouseAddress(rs.getString(3));
				hvo.setHouseContent(rs.getString(4));
				hvo.setHouseTimePosted(rs.getString(5));
				hvo.setHouseHits(null);
				// mvo=new
				// MemberVO(rs.getString(6),null,rs.getString(7),rs.getString(8),rs.getString(9),null,null);
				hvo.setMemberVO(null);
				// ivo=new
				// ImageVO(null,rs.getString(11),rs.getString(12),rs.getString(13),rs.getString(14));
				hvo.setImageVO(null);

			}
			System.out.println("test1 단계 성공");
		} finally {
			closeAll(rs, pstmt, con);
		}
		return hvo;
	}
	public String getHouseId() throws SQLException {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String hid=null;
		try {
		    con = dataSource.getConnection();
			String sql = "select max(house_id) from house";			
			pstmt = con.prepareStatement(sql);	
			rs = pstmt.executeQuery();
			if (rs.next())hid=rs.getString(1); 			 
		} finally {
			closeAll(rs, pstmt, con);
		}
		return hid;
	}

	public void updateHouse(HouseVO hvo) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			System.out.println(
					hvo.getHouseId() + hvo.getHouseAddress() + hvo.getHouseContent() + hvo.getHouseName() + "업데이트 시작");
			con = dataSource.getConnection();
			String sql = "update house set house_name =?, house_address=?, house_content=? where house_id=?";
			// 입력값 하우스(name,address,content,id)
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, hvo.getHouseName());
			pstmt.setString(2, hvo.getHouseAddress());
			pstmt.setString(3, hvo.getHouseContent());
			pstmt.setString(4, hvo.getHouseId());
			pstmt.executeQuery();
			System.out.println("sql실행완료");
		} finally {
			closeAll(pstmt, con);
		}
		System.out.println("하우스 업데이트 완료");

	}

	public ArrayList<HouseVO> getHouseList() throws SQLException {
		ArrayList<HouseVO>list = new ArrayList<HouseVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = dataSource.getConnection();
			String sql="select h.house_id,h.house_name,h.house_address,h.house_content,\r\n"
					+ "			to_char(h.house_time_posted,'yyyy.mm.dd'),m.member_name,hi.filename,hi.filepath\r\n"
					+ "from house h \r\n"
					+ "inner join member m on m.member_id =h.member_id \r\n"
					+ "left outer join house_image hi on h.house_id=hi.house_id\r\n"
					+ "order by h.house_id asc";
//			StringBuilder sql = new StringBuilder();
//			sql.append("select h.house_id,h.house_name,h.house_address,h.house_content, ");
//			sql.append("to_char(h.house_time_posted,'yyyy.mm.dd'),m.member_name,hi.filename,hi.filepath ");
//			sql.append("from house h  ");
//			sql.append("inner join member m on m.member_id =h.member_id  ");
//			sql.append("order by h.house_id asc");
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				HouseVO hvo = new HouseVO();
				hvo.setHouseId(rs.getString("house_id"));
				hvo.setHouseName(rs.getString("house_name"));
				hvo.setHouseAddress(rs.getString("house_address"));
				hvo.setHouseContent(rs.getString("house_content"));
				//hvo.setHouseTimePosted(rs.getString("house_time_posted"));
				hvo.setHouseHits(null);
				MemberVO mvo = new MemberVO();
				ImageVO ivo=new ImageVO();
				mvo.setName(rs.getString("member_name"));
				ivo.setFileName(rs.getString("filename"));
				ivo.setFilePath(rs.getString("filepath"));
				
				hvo.setMemberVO(mvo);
				hvo.setImageVO(ivo);
				
				
				list.add(hvo);
			}
		}finally {
			closeAll(pstmt, con);
		}
		return list;
	}

}
