package logic;

import java.util.Date;

public class Mileage {
	 private int listno; //번호
     private int mNo;     //회원번호
     private String money;       
     private int mileage;     
     private int add_mileage;  
     private int using_mileage;     
     private int mileage_check;  
     private String nickname;
     private Date regdate;
	public int getListno() {
		return listno;
	}
	public void setListno(int listno) {
		this.listno = listno;
	}
	public int getmNo() {
		return mNo;
	}
	public void setmNo(int mNo) {
		this.mNo = mNo;
	}
	public String getMoney() {
		return money;
	}
	public void setMoney(String money) {
		this.money = money;
	}
	public int getMileage() {
		return mileage;
	}
	public void setMileage(int mileage) {
		this.mileage = mileage;
	}
	public int getAdd_mileage() {
		return add_mileage;
	}
	public void setAdd_mileage(int add_mileage) {
		this.add_mileage = add_mileage;
	}
	public int getUsing_mileage() {
		return using_mileage;
	}
	public void setUsing_mileage(int using_mileage) {
		this.using_mileage = using_mileage;
	}
	public int getMileage_check() {
		return mileage_check;
	}
	public void setMileage_check(int mileage_check) {
		this.mileage_check = mileage_check;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}      
	

}
