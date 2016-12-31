package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.DealBoardMapper;
import logic.Comment;
import logic.DealBoard;

@Repository
public class DealBoardDaoImpl implements DealBoardDao{
	@Autowired
	private SqlSessionTemplate sqlSession;
	private final String NS = "dao.mapper.DealBoardMapper.";

	@Override
	public Integer dealBoardCount(Integer category, Integer dealcheck) {
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("category", category);
		map.put("dealcheck", dealcheck);
		return sqlSession.getMapper(DealBoardMapper.class).dealBoardCount(map);
	}

	@Override
	public List<DealBoard> getDealBoardList(Integer pageNum, int limit, Integer category, Integer dealcheck) {
		int startrow = (pageNum - 1) * limit + 1;
		int endrow = startrow + limit - 1;
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", startrow);
		map.put("end", endrow);
		map.put("category", category);
		map.put("dealcheck", dealcheck);
		return sqlSession.selectList(NS + "getDealBoard", map);
	}
	@Override
	public DealBoard dealboardDetail(int num, Integer pageNum) {
		Map<String, Integer> paramMap = new HashMap<String, Integer>();
		int dealcheck = sqlSession.getMapper(DealBoardMapper.class).dealcheck(num);
		paramMap.put("dealcheck", dealcheck);
		paramMap.put("num", num);
		paramMap.put("pageNum", pageNum);
		return sqlSession.selectOne(NS + "getDealBoardDetail", paramMap);
	}
	private int getMaxBoardNum() {
		int i = sqlSession.getMapper(DealBoardMapper.class).maxNum();
		return ++i;
	}

	@Override
	public void saleadd(DealBoard dealboard, HttpServletRequest request) {
		int num = getMaxBoardNum();
		dealboard.setbNo(num);
		dealboard.setFileUrl2(dealboard.getPicture2().getOriginalFilename());
		dealboard.setFileUrl3(dealboard.getPicture3().getOriginalFilename());
		dealboard.setFileUrl4(dealboard.getPicture4().getOriginalFilename());
		dealboard.setFileUrl5(dealboard.getPicture5().getOriginalFilename());
		sqlSession.getMapper(DealBoardMapper.class).saleAdd(dealboard);
		
	}

	@Override
	public void saledelete(int num, DealBoard dealboard) {
		sqlSession.getMapper(DealBoardMapper.class).saledelete(num);
	}

	@Override
	public void saleupdate(DealBoard dealboard, HttpServletRequest request) {
		String s = "";
		if(dealboard.getFileUrl1().isEmpty()) {
			dealboard.setFileUrl1(s);
		}
		if(dealboard.getPicture2().isEmpty()) {
			dealboard.setFileUrl2(s);
		}
		if(dealboard.getPicture3().isEmpty()) {
			dealboard.setFileUrl3(s);
		}
		if(dealboard.getPicture4().isEmpty()) {
			dealboard.setFileUrl4(s);
		}
		if(dealboard.getPicture5().isEmpty()) {
			dealboard.setFileUrl5(s);
		}
		sqlSession.getMapper(DealBoardMapper.class).saleupdate(dealboard);
		
	}

	@Override
	public List<DealBoard> getSalelist() {
		return sqlSession.selectList(NS + "getSaleDealBoard");
	}

	@Override
	public List<DealBoard> getBuylist() {
		return sqlSession.selectList(NS + "getBuyDealBoard");
	}

	@Override
	public List<DealBoard> dealboardList(String searchType, String searchContent, Integer category, Integer dealcheck ,Integer pageNum) {
		Map<Object, Object> paramMap = new HashMap<Object, Object>();
		int limit =12;
		int startrow = (pageNum - 1) * limit + 1;
		int endrow = startrow + limit - 1;
		paramMap.put("start", startrow);
		paramMap.put("end", endrow);	
		paramMap.put("category", category);
		paramMap.put("dealcheck", dealcheck);
		paramMap.put("searchType", searchType);
		paramMap.put("searchContent", "'%"+searchContent+"%'");
		return sqlSession.selectList(NS+"searchList", paramMap);
	}

	@Override
	public List<DealBoard> alldealboardList(String searchContent,Integer pageNum) {
		Map<Object, Object> paramMap = new HashMap<Object, Object>();
		 int limit =12;
		int startrow = (pageNum - 1) * limit + 1;
		int endrow = startrow + limit - 1;
		paramMap.put("start", startrow);
		paramMap.put("end",endrow);
		paramMap.put("pageNum", pageNum);
		//map.put("category", category);
		//map.put("dealcheck", dealcheck);
		paramMap.put("searchContent", "'%"+searchContent+"%'");
		System.out.println("startrow>>"+startrow+"map>>"+paramMap.get("start")+",map>>"+paramMap.get("end"));
		System.out.println("endrow>>"+endrow);
		System.out.println(searchContent);
		return sqlSession.selectList(NS+"allsearchList", paramMap);
	}

	@Override
	public String zzim(int num,int mNo) {
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("num", num);
		map.put("mNo", mNo);
		String check = sqlSession.getMapper(DealBoardMapper.class).zzim(map);
		return check;
	}

	@Override
	public List<DealBoard> mylist(int mNo) {
		Map<String, Integer> paramMap = new HashMap<String, Integer>();
		paramMap.put("mNo", mNo);
		return sqlSession.getMapper(DealBoardMapper.class).mylist(paramMap);
	}

	@Override
	public int mylistcount(int mNo) {
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("mNo", mNo);
		return sqlSession.getMapper(DealBoardMapper.class).mylistcount(map);
	}
	@Override
	public void dealcheckUpdate(int num,int mNo) {
		Map<String, Integer> map = new HashMap<String,Integer>();
		int dealcheck = sqlSession.getMapper(DealBoardMapper.class).dealcheck(num);
		map.put("num", num);
		map.put("mNo", mNo);
		map.put("dealcheck", dealcheck);
		sqlSession.update(NS+"dealcheckUpdate",map);
		
	}
	@Override
	public void addcomment(Comment comment) {
		 int cnum =sqlSession.getMapper(DealBoardMapper.class).maxcnum();
	      comment.setCommentno(++cnum);
	      sqlSession.getMapper(DealBoardMapper.class).addcomment(comment);
	}

	@Override
	public List<Comment> replyBoardList(int num, int ca) {
		Map<Object, Integer> map = new HashMap<Object, Integer>();
		map.put("num", num);
		map.put("ca", ca);
		return sqlSession.getMapper(DealBoardMapper.class).replyBoardList(map);
	}
	@Override
	public String replyCount(Integer category) {
		return sqlSession.getMapper(DealBoardMapper.class).replyCount(category);
	}
	@Override
	public void deleteReply(Comment comment) {
		sqlSession.getMapper(DealBoardMapper.class).deleteReply(comment);
	}

	@Override
	public Integer allDealBoardCount(String searchContent) {
		Map<Object, Object> paramMap = new HashMap<Object, Object>();
		paramMap.put("searchContent", "'%"+searchContent+"%'");
		return sqlSession.selectOne(NS + "getDealBoardCount", paramMap);
	}

	
}
