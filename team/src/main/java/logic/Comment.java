package logic;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Comment {
   private int commentno;                        
   private int no;                              
   private String content;                          
   private int mNo;                                 
   private String category; 
   private Date cdate;
   private String nickname;
   
   public String getFormat() {
         SimpleDateFormat sdate = new SimpleDateFormat("yyyy-MM-dd");
         return sdate.format(cdate);
      }
   
   public int getNo() {
      return no;
   }
   public void setNo(int no) {
      this.no = no;
   }
   public String getContent() {
      return content;
   }
   public void setContent(String content) {
      this.content = content;
   }
   public int getmNo() {
      return mNo;
   }
   public void setmNo(int mNo) {
      this.mNo = mNo;
   }
   public String getCategory() {
      return category;
   }
   public void setCategory(String category) {
      this.category = category;
   }
   public Date getCdate() {
      return cdate;
   }
   public void setCdate(Date cdate) {
      this.cdate = cdate;
   }
   public int getCommentno() {
      return commentno;
   }
   public void setCommentno(int commentno) {
      this.commentno = commentno;
   }
   public String getNickname() {
      return nickname;
   }
   public void setNickname(String nickname) {
      this.nickname = nickname;
   }
   
}