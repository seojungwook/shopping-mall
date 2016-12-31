package dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import logic.Comment;
import logic.DealBoard;


public interface DealBoardDao {

	Integer dealBoardCount(Integer category, Integer dealcheck);
	DealBoard dealboardDetail(int num, Integer pageNum);
	void saleadd(DealBoard dealboard, HttpServletRequest request);
	void saledelete(int num, DealBoard dealboard);
	void saleupdate(DealBoard dealboard, HttpServletRequest request);
	List<DealBoard> getSalelist();
	List<DealBoard> getBuylist();
	List<DealBoard> dealboardList(String searchType, String searchContent, Integer category, Integer dealcheck, Integer pageNum);
	List<DealBoard> getDealBoardList(Integer pageNum, int limit, Integer category, Integer dealcheck);
	List<DealBoard> alldealboardList(String searchContent,Integer pageNum);
	Integer allDealBoardCount(String searchContent);
	String zzim(int num, int mNo);
	int mylistcount(int mNo);
	List<DealBoard> mylist(int num);
	void dealcheckUpdate(int num, int mNo);
	void addcomment(Comment comment);
	List<Comment> replyBoardList(int num, int ca);
	String replyCount(Integer category);
	void deleteReply(Comment comment);
	
}
