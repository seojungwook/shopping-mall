package dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import logic.Board;
import logic.Comment;

public interface BoardMapper {
	@Select("select count(*) from board2 where category=#{category}")
	int boardCount(Integer category);

	@Select("select b.no, b.subject,b.content,b.picture fileUrl,b.regDate, m.nickname , b.mNo from board2 b, member3 m where b.mno = m.mno and b.no = #{no}")
	Board selectOne(Integer no);

	@Insert("insert into board2 values(#{no},#{category},#{subject},#{content},0,sysdate,#{mNo},#{fileUrl})")
	void boardWrite(Board board);

	@Select("select nvl(max(no),0) from board2")
	Integer getMaxNum();

	@Update("update board2 set readcnt = readcnt+1 where no=#{no}")
	void readCntAdd(Integer no);

	@Insert("insert into board2 values(#{no},#{subject},#{content},#{fileUrl},sysdate,0,0)")
	void rewrite(Board board);

	@Delete("delete from board2 where no=#{no}")
	void delete(Board board);

	@Update("update board2 set content =#{content},subject=#{subject},picture=#{fileUrl} where no=#{no}")
	void update(Board board);

	@Select("select nvl(count(*),0) from board2 where category = #{category} and ${searchtype} like '%${searchContent}%'")
	int searchCount(Map<String, Object> map);
	
	@Select("select count(*) from board2 where category=#{category} and mNo=#{mno}")
	int boardCount1(Map<String, Object> map);
	
	@Insert("insert into comment2 values(#{commentno},#{no},#{content},#{mNo},#{category},sysdate)")
	   void addcomment(Comment comment);

	@Select("select nvl(max(commentno),0) from comment2")
	int maxcnum();

	@Select("select * from comment2 where bNo=#{no}")
	String replyCount(Integer category);

	@Select("select c.commentno, c.bno, c.content, c.mno, c.category, c.cdate, m.mno, m.nickname from comment2 c, member3 m where c.mno = m.mno and c.bNo=#{no} and c.category = #{ca} order by commentno desc")
	List<Comment> replyBoardList(Map<Object, Integer> map);

	@Delete("delete from comment2 where commentno=#{commentno}")
	void deleteReply(Comment comment);

}
