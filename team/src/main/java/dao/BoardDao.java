package dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import logic.Board;
import logic.Comment;

public interface BoardDao {

	int boardCount(Integer category);

	List<Board> getBoardList(Integer pageNum, int limit, Integer category);

	Board selectOne(Integer num, Integer pageNum);

	void delete(Board board);

	void update(Board board, HttpServletRequest request);

//	void rewrite(Board board);

	int searchCount(String searchtype, String searchContent ,Integer category);

	List<Board> search(String searchtype, String searchContent, Integer pageNum ,Integer category);
	
	void readCntAdd(Integer num);

	void upload(MultipartFile upload, HttpServletRequest request);

	void boardWrite(Board board, HttpServletRequest request, Integer category);

	int boardCount1(Integer category, int mno);

	List<Board> getBoardList1(Integer pageNum, int limit, Integer category,int mno);

	List<Board> getAdminBoardList(Integer pageNum, int limit, Integer category);

	String replyCount(Integer category);

	List<Comment> replyBoardList(Integer no, Integer ca);

	void deleteReply(Comment comment);

	void addcomment(Comment comment);
	

}
