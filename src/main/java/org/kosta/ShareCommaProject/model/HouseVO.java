package org.kosta.ShareCommaProject.model;

public class HouseVO {
	private String houseId;
	private String houseName;
	private String houseAddress;
	private String houseContent;
	private String houseTimePosted;
	private String houseHits;
	private ImageVO imageVO;
	private MemberVO memberVO; //status = 'HOST' 
	public HouseVO() {
		super();
	}
	public HouseVO(String houseId, String houseName, String houseAddress, String houseContent, String houseTimePosted,
			String houseHits, ImageVO imageVO, MemberVO memberVO) {
		super();
		this.houseId = houseId;
		this.houseName = houseName;
		this.houseAddress = houseAddress;
		this.houseContent = houseContent;
		this.houseTimePosted = houseTimePosted;
		this.houseHits = houseHits;
		this.imageVO = imageVO;
		this.memberVO = memberVO;
	}
	public String getHouseId() {
		return houseId;
	}
	public void setHouseId(String houseId) {
		this.houseId = houseId;
	}
	public String getHouseName() {
		return houseName;
	}
	public void setHouseName(String houseName) {
		this.houseName = houseName;
	}
	public String getHouseAddress() {
		return houseAddress;
	}
	public void setHouseAddress(String houseAddress) {
		this.houseAddress = houseAddress;
	}
	public String getHouseContent() {
		return houseContent;
	}
	public void setHouseContent(String houseContent) {
		this.houseContent = houseContent;
	}
	public String getHouseTimePosted() {
		return houseTimePosted;
	}
	public void setHouseTimePosted(String houseTimePosted) {
		this.houseTimePosted = houseTimePosted;
	}
	public String getHouseHits() {
		return houseHits;
	}
	public void setHouseHits(String houseHits) {
		this.houseHits = houseHits;
	}
	public ImageVO getImageVO() {
		return imageVO;
	}
	public void setImageVO(ImageVO imageVO) {
		this.imageVO = imageVO;
	}
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	@Override
	public String toString() {
		return "HouseVO [houseId=" + houseId + ", houseName=" + houseName + ", houseAddress=" + houseAddress
				+ ", houseContent=" + houseContent + ", houseTimePosted=" + houseTimePosted + ", houseHits=" + houseHits
				+ ", imageVO=" + imageVO + ", memberVO=" + memberVO + "]";
	}
	
	
}
