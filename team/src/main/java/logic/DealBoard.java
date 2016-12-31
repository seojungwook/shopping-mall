package logic;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class DealBoard {
	private int num;
	private Integer bNo;
	private Integer category;
	private Integer dealcheck;
	private String iName;
	private Integer iprice;
	private Integer transport;
	private Integer smemno;
	private Integer bmemno;
	private String subject;
	private String content;
	private Integer readcnt;
	private Date regdate;
	private Integer mNo;
	private String nickname;
	
	private MultipartFile picture1;
	private MultipartFile picture2;
	private MultipartFile picture3;
	private MultipartFile picture4;
	private MultipartFile picture5;
	private String FileUrl1;
	private String FileUrl2;
	private String FileUrl3;
	private String FileUrl4;
	private String FileUrl5;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public Integer getbNo() {
		return bNo;
	}
	public void setbNo(Integer bNo) {
		this.bNo = bNo;
	}
	public Integer getCategory() {
		return category;
	}
	public void setCategory(Integer category) {
		this.category = category;
	}
	public Integer getDealcheck() {
		return dealcheck;
	}
	public void setDealcheck(Integer dealcheck) {
		this.dealcheck = dealcheck;
	}
	public String getiName() {
		return iName;
	}
	public void setiName(String iName) {
		this.iName = iName;
	}
	public Integer getIprice() {
		return iprice;
	}
	public void setIprice(Integer iprice) {
		this.iprice = iprice;
	}
	public Integer getTransport() {
		return transport;
	}
	public void setTransport(Integer transport) {
		this.transport = transport;
	}
	public Integer getSmemno() {
		return smemno;
	}
	public void setSmemno(Integer smemno) {
		this.smemno = smemno;
	}
	public Integer getBmemno() {
		return bmemno;
	}
	public void setBmemno(Integer bmemno) {
		this.bmemno = bmemno;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Integer getReadcnt() {
		return readcnt;
	}
	public void setReadcnt(Integer readcnt) {
		this.readcnt = readcnt;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Integer getmNo() {
		return mNo;
	}
	public void setmNo(Integer mNo) {
		this.mNo = mNo;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public MultipartFile getPicture1() {
		return picture1;
	}
	public void setPicture1(MultipartFile picture1) {
		this.picture1 = picture1;
	}
	public MultipartFile getPicture2() {
		return picture2;
	}
	public void setPicture2(MultipartFile picture2) {
		this.picture2 = picture2;
	}
	public MultipartFile getPicture3() {
		return picture3;
	}
	public void setPicture3(MultipartFile picture3) {
		this.picture3 = picture3;
	}
	public MultipartFile getPicture4() {
		return picture4;
	}
	public void setPicture4(MultipartFile picture4) {
		this.picture4 = picture4;
	}
	public MultipartFile getPicture5() {
		return picture5;
	}
	public void setPicture5(MultipartFile picture5) {
		this.picture5 = picture5;
	}
	public String getFileUrl1() {
		return FileUrl1;
	}
	public void setFileUrl1(String fileUrl1) {
		FileUrl1 = fileUrl1;
	}
	public String getFileUrl2() {
		return FileUrl2;
	}
	public void setFileUrl2(String fileUrl2) {
		FileUrl2 = fileUrl2;
	}
	public String getFileUrl3() {
		return FileUrl3;
	}
	public void setFileUrl3(String fileUrl3) {
		FileUrl3 = fileUrl3;
	}
	public String getFileUrl4() {
		return FileUrl4;
	}
	public void setFileUrl4(String fileUrl4) {
		FileUrl4 = fileUrl4;
	}
	public String getFileUrl5() {
		return FileUrl5;
	}
	public void setFileUrl5(String fileUrl5) {
		FileUrl5 = fileUrl5;
	}
	@Override
	public String toString() {
		return "DealBoard [num=" + num + ", bNo=" + bNo + ", category=" + category + ", dealcheck=" + dealcheck
				+ ", iName=" + iName + ", iprice=" + iprice + ", transport=" + transport + ", smemno=" + smemno
				+ ", bmemno=" + bmemno + ", subject=" + subject + ", content=" + content + ", readcnt=" + readcnt
				+ ", regdate=" + regdate + ", mNo=" + mNo + ", nickname=" + nickname + ", picture1=" + picture1
				+ ", picture2=" + picture2 + ", picture3=" + picture3 + ", picture4=" + picture4 + ", picture5="
				+ picture5 + ", FileUrl1=" + FileUrl1 + ", FileUrl2=" + FileUrl2 + ", FileUrl3=" + FileUrl3
				+ ", FileUrl4=" + FileUrl4 + ", FileUrl5=" + FileUrl5 + "]";
	}
	
}
