package org.kosta.ShareCommaProject.model;

public class ReservationVO {

	private String checkIn;
	private String checkOut;
	private int countPerson;
	private String reservDate;
	private MemberVO memberVO; //누가 에약을 햇는지에 대한 정보
	private HouseVO houseVO;
	public ReservationVO(String checkIn, String checkOut, int countPerson, String reservDate, MemberVO memberVO,
			HouseVO houseVO) {
		super();
		this.checkIn = checkIn;
		this.checkOut = checkOut;
		this.countPerson = countPerson;
		this.reservDate = reservDate;
		this.memberVO = memberVO;
		this.houseVO = houseVO;
	}
	public ReservationVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getCheckIn() {
		return checkIn;
	}
	public void setCheckIn(String checkIn) {
		this.checkIn = checkIn;
	}
	public String getCheckOut() {
		return checkOut;
	}
	public void setCheckOut(String checkOut) {
		this.checkOut = checkOut;
	}
	public int getCountPerson() {
		return countPerson;
	}
	public void setCountPerson(int countPerson) {
		this.countPerson = countPerson;
	}
	public String getReservDate() {
		return reservDate;
	}
	public void setReservDate(String reservDate) {
		this.reservDate = reservDate;
	}
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	public HouseVO getHouseVO() {
		return houseVO;
	}
	public void setHouseVO(HouseVO houseVO) {
		this.houseVO = houseVO;
	}
	@Override
	public String toString() {
		return "ReservationVO [checkIn=" + checkIn + ", checkOut=" + checkOut + ", countPerson=" + countPerson
				+ ", reservDate=" + reservDate + ", memberVO=" + memberVO + ", houseVO=" + houseVO + "]";
	}
	
	
}
