package logic;

import java.util.Date;

public class Message {

	private int sendNo;
	private int receiveNo;
	private String subject;
	private String content;
	private Date regdate;
	private int readCheck;
	private String nickName;
	
	public int getSendNo() {
		return sendNo;
	}
	public void setSendNo(int sendNo) {
		this.sendNo = sendNo;
	}
	public int getReceiveNo() {
		return receiveNo;
	}
	public void setReceiveNo(int receiveNo) {
		this.receiveNo = receiveNo;
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
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getReadCheck() {
		return readCheck;
	}
	public void setReadCheck(int readCheck) {
		this.readCheck = readCheck;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	
	@Override
	public String toString() {
		return "Message [sendNo=" + sendNo + ", receiveNo=" + receiveNo + ", subject=" + subject + ", content="
				+ content + ", regdate=" + regdate + ", readCheck=" + readCheck + ", nickName=" + nickName + "]";
	}
}
