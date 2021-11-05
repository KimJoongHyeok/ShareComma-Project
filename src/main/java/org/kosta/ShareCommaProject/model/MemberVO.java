package org.kosta.ShareCommaProject.model;

public class MemberVO {
	private String id;
	private String password;
	private String name;
	private String phone;
	private String nickName;
	private String regDate;
	private String status; //HOST,MEMBER,HUMAN
	public MemberVO() {
		super();
	}
	public MemberVO(String id, String password, String name, String phone, String nickName, String regDate,
			String status) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.phone = phone;
		this.nickName = nickName;
		this.regDate = regDate;
		this.status = status;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", password=" + password + ", name=" + name + ", phone=" + phone + ", nickName="
				+ nickName + ", regDate=" + regDate + ", status=" + status + "]";
	}
	
	
}
