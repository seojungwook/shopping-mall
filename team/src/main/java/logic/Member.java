package logic;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

public class Member {
	private int mNo;
	@Size(min=4, max=15, message="4자에서 15자까지 입력 가능합니다.")
	private String id; // 아이디
	@NotNull
	private String nickname; // 닉네임
	@Size(min=4, max=10, message="4자에서 10자까지 입력 가능합니다.")
	private String pass; // 비밀번호
	@NotNull
	private String name; // 이름
	private String postcode; // 우편번호
	private String address;
	private String address1; // 주소
	@NotNull
	private String address2; // 주소
	private String tel;
	private String tel1; // 전화번호
	private String tel2; // 전화번호
	@NotNull
	private String tel3; // 전화번호
	private String phone;
	private String pon1; // 핸드폰번호
	private String pon2; // 핸드폰번호
	@NotNull
	private String pon3; // 핸드폰번호
	@NotNull
	private String email; // 이메일
	private int point;
	private int mileage;
	private int grade;
	public int getmNo() {
		return mNo;
	}
	public void setmNo(int mNo) {
		this.mNo = mNo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getTel1() {
		return tel1;
	}
	public void setTel1(String tel1) {
		this.tel1 = tel1;
	}
	public String getTel2() {
		return tel2;
	}
	public void setTel2(String tel2) {
		this.tel2 = tel2;
	}
	public String getTel3() {
		return tel3;
	}
	public void setTel3(String tel3) {
		this.tel3 = tel3;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPon1() {
		return pon1;
	}
	public void setPon1(String pon1) {
		this.pon1 = pon1;
	}
	public String getPon2() {
		return pon2;
	}
	public void setPon2(String pon2) {
		this.pon2 = pon2;
	}
	public String getPon3() {
		return pon3;
	}
	public void setPon3(String pon3) {
		this.pon3 = pon3;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getMileage() {
		return mileage;
	}
	public void setMileage(int mileage) {
		this.mileage = mileage;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	@Override
	public String toString() {
		return "Member [mNo=" + mNo + ", id=" + id + ", nickname=" + nickname + ", pass=" + pass + ", name=" + name
				+ ", postcode=" + postcode + ", address=" + address + ", address1=" + address1 + ", address2="
				+ address2 + ", tel=" + tel + ", tel1=" + tel1 + ", tel2=" + tel2 + ", tel3=" + tel3 + ", phone="
				+ phone + ", pon1=" + pon1 + ", pon2=" + pon2 + ", pon3=" + pon3 + ", email=" + email + ", point="
				+ point + ", mileage=" + mileage + ", grade=" + grade + "]";
	}

	
}