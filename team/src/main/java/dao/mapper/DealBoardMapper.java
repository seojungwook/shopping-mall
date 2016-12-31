package dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import logic.Comment;
import logic.DealBoard;

public interface DealBoardMapper {

	@Select("select nvl(count(*),0) from deal_board where category=#{category} and dealcheck=#{dealcheck}")
	Integer dealBoardCount(Map<Object, Object> map);

	@Select("select nvl(max(bNo),0) from deal_board")
	int maxNum();

	@Insert("insert into deal_board(bNo, category, dealcheck, iName, iprice, transport, smemno, bmemno, subject, content, picture1, picture2, picture3, picture4, picture5, regdate, readcnt) "
			+ "values (#{bNo}, #{category}, #{dealcheck}, #{iName}, #{iprice}, 0, #{smemno}, #{bmemno}, #{subject}, #{content}, #{FileUrl1}, #{FileUrl2}, #{FileUrl3}, #{FileUrl4}, #{FileUrl5}, sysDate, 0)")
	void saleAdd(DealBoard dealboard);

	@Delete("delete from deal_board where bNo=#{bNo}")
	void saledelete(int num);
	
	@Update("update deal_board set subject=#{subject}, content=#{content}, iName=#{iName}, iprice=#{iprice}, transport=#{transport}, picture1=#{fileUrl1}, picture2=#{fileUrl2}, picture3=#{fileUrl3}, picture4=#{fileUrl4}, picture5=#{fileUrl5} where bNo=#{num}")
	void saleupdate(DealBoard dealboard);
	
	@Select("select * from zzim where bno = #{num} and mno = #{mNo}")
	String zzim(Map map);

	@Select("select nvl(count(*),0) from deal_board where dealcheck=1 and smemno=#{mNo}")
	int mylistcount(Map<Object, Object> map);

/*	@Update("update deal_board set dealcheck = 1 where bNo=#{num}")
	void dealcheckUpdate(int num);*/
	
	@Select("select dealcheck from deal_board where bno = #{num}")
	int dealcheck(int num);
	
	@Select("select * from (select d.bNo, d.category, d.dealcheck dealcheck, d.iName, d.iprice, d.transport, d.smemno, d.bmemno, d.subject, d.content, d.readcnt, d.regdate, d.picture1 fileurl1, d.picture2 fileurl2, d.picture3 fileurl3, d.picture4 fileurl4, d.picture5 fileurl5, m.nickname nickname" 
			+ " from deal_board d, member3 m"
			+ " where d.smemno = m.mno and dealcheck = 1 and smemno = #{mNo} order by d.bno desc)" 
			+ " union "
			+ " select * from (select d.bNo, d.category, d.dealcheck dealcheck, d.iName, d.iprice, d.transport, d.smemno, d.bmemno, d.subject, d.content, d.readcnt, d.regdate,   d.picture1 fileurl1, d.picture2 fileurl2, d.picture3 fileurl3, d.picture4 fileurl4, d.picture5 fileurl5, m.nickname nickname" 
			+ " from deal_board d, member3 m"
			+ " where d.bmemno = m.mno and dealcheck = 1 and bmemno = #{mNo} order by d.bno desc)")
	List<DealBoard> mylist(Map<String, Integer> paramMap);
	
	@Select("select c.commentno, c.bno, c.content, c.mno, c.category, "
			+ "c.cdate, m.mno, m.nickname from comment2 c, member3 m "
			+ "where c.mno = m.mno and c.bNo=#{num} and c.category = #{ca} order by commentno desc")
	List<Comment> replyBoardList(Map<Object, Integer> map);

	@Select("select nvl(count(*),0) from comment2 where bNo=#{no}")
	String replyCount(Integer category);
	
	@Insert("insert into comment2 values(#{commentno},#{no},#{content},#{mNo},#{category},sysdate)")
	void addcomment(Comment comment);

	@Select("select nvl(max(commentno),0) from comment2")
	int maxcnum();

	@Delete("delete from comment2 where commentno=#{commentno}")
	void deleteReply(Comment comment);
   
}
