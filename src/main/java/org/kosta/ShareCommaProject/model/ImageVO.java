package org.kosta.ShareCommaProject.model;

public class ImageVO {
	private HouseVO houseVO;
    private String orgName;
    private String fileName;
    private String filePath;
    private String fileSize;
	public ImageVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ImageVO(HouseVO houseVO, String orgName, String fileName, String filePath, String fileSize) {
		super();
		this.houseVO = houseVO;
		this.orgName = orgName;
		this.fileName = fileName;
		this.filePath = filePath;
		this.fileSize = fileSize;
	}
	public HouseVO getHouseVO() {
		return houseVO;
	}
	public void setHouseVO(HouseVO houseVO) {
		this.houseVO = houseVO;
	}
	public String getOrgName() {
		return orgName;
	}
	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public String getFileSize() {
		return fileSize;
	}
	public void setFileSize(String fileSize) {
		this.fileSize = fileSize;
	}
	@Override
	public String toString() {
		return "ImageVO [houseVO=" + houseVO + ", orgName=" + orgName + ", fileName=" + fileName + ", filePath="
				+ filePath + ", fileSize=" + fileSize + "]";
	}
	
	
}
