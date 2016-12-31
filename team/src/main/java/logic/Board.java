package logic;

import java.text.SimpleDateFormat;
import java.util.Date;
import javax.validation.constraints.NotNull;
import org.springframework.web.multipart.MultipartFile;


public class Board {
	@NotNull
	private int no;
	@NotNull
	private Integer category;
	@NotNull
	private String subject;
	@NotNull
	private String content;
	@NotNull
	private String nickname;
	@NotNull
	private int readCnt;
	@NotNull
	private Date regDate;
	private int mNo;
	private MultipartFile picture;
	private String fileUrl;

    public String getFormat() {;
    
  		SimpleDateFormat sdate = new SimpleDateFormat("yyy-MM-dd");
  		return sdate.format(regDate);
  	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public Integer getCategory() {
		return category;
	}

	public void setCategory(Integer category) {
		this.category = category;
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

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public int getReadCnt() {
		return readCnt;
	}

	public void setReadCnt(int readCnt) {
		this.readCnt = readCnt;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	public MultipartFile getPicture() {
		return picture;
	}

	public void setPicture(MultipartFile picture) {
		this.picture = picture;
	}

	public String getFileUrl() {
		return fileUrl;
	}

	public void setFileUrl(String fileUrl) {
		this.fileUrl = fileUrl;
	}

}
