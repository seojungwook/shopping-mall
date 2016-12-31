package dao;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import dao.mapper.BoardMapper;
import logic.Board;
import logic.Comment;

@Repository
public class BoardDaoImpl implements BoardDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	private final String NS = "dao.mapper.BoardMapper.";

	@Override
	public int boardCount(Integer category) {
		return sqlSession.getMapper(BoardMapper.class).boardCount(category);
	}

	@Override
	public List<Board> getBoardList(Integer pageNum, int limit, Integer category) {
		int startrow = (pageNum - 1) * limit + 1;
		int endrow = startrow + limit - 1;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", startrow);
		map.put("end", endrow);
		map.put("category", category);
		
		List<Board> list = sqlSession.selectList(NS + "getBoard", map);
			
		return list;
	}

	@Override
	public Board selectOne(Integer num, Integer pageNum) {
		return sqlSession.getMapper(BoardMapper.class).selectOne(num);

	}

	@Override
	public void boardWrite(Board board, HttpServletRequest request, Integer category) {
		if(board.getPicture() != null && !board.getPicture().isEmpty()){
			upload(board.getPicture(),request);
		
		}
		board.setFileUrl(board.getPicture().getOriginalFilename());
		Integer i = sqlSession.getMapper(BoardMapper.class).getMaxNum();
		board.setNo(i + 1);
		board.setCategory(category);
		
		//board.setmNo(i);
		sqlSession.getMapper(BoardMapper.class).boardWrite(board);
	}
	
	@Override
	public void upload(MultipartFile upload, HttpServletRequest request) {
		String uploadPath = request.getServletContext().getRealPath("/")+"/upload/";
		FileOutputStream fos = null;
		try {
			fos = new FileOutputStream(uploadPath + upload.getOriginalFilename());
			//picture.getInputStream():파일의 내용을 읽기위한 스트림
			InputStream in = upload.getInputStream();
			int data;
			while ((data = in.read()) != -1) {
				fos.write(data);
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if(fos !=null){
				fos.flush();
				fos.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		
	}
	@Override
	public void readCntAdd(Integer num) {
		sqlSession.getMapper(BoardMapper.class).readCntAdd(num);
		
	}
	
	@Override
	public void delete(Board board) {
		sqlSession.getMapper(BoardMapper.class).delete(board);

	}

	@Override
	public void update(Board board, HttpServletRequest request) {
		
		sqlSession.getMapper(BoardMapper.class).update(board);

	}

	
	@Override
	public int searchCount(String searchtype, String searchContent, Integer category) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("searchtype",searchtype);
		map.put("searchContent",searchContent);
		map.put("category", category);
		return sqlSession.getMapper(BoardMapper.class).searchCount(map);
	}

	@Override
	public List<Board> search(String searchtype, String searchContent, Integer pageNum, Integer category) {
		Map<String,Object> map = new HashMap<String,Object>();
		int startrow = (pageNum -1) * 10 + 1;
		int endrow = startrow + 10 -1;
		map.put("category", category);
		map.put("start",startrow);
		map.put("end",endrow);
		map.put("searchtype",searchtype);
		map.put("searchContent",searchContent);
		return sqlSession.selectList(NS+"seojw",map);
	}

	@Override
	public int boardCount1(Integer category, int mno) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("category", category);
		map.put("mno", mno);
		return sqlSession.getMapper(BoardMapper.class).boardCount1(map);
		
	}

	@Override
	public List<Board> getBoardList1(Integer pageNum, int limit, Integer category,int mno) {
		int startrow = (pageNum - 1) * limit + 1;
		int endrow = startrow + limit - 1;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", startrow);
		map.put("end", endrow);
		map.put("category", category);
		map.put("mno",mno);
		List<Board> list = sqlSession.selectList(NS + "getBoard1", map);
			
		return list;
	}

	@Override
	public List<Board> getAdminBoardList(Integer pageNum, int limit, Integer category) {
		int startrow = (pageNum - 1) * limit + 1;
		int endrow = startrow + limit - 1;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", startrow);
		map.put("end", endrow);
		map.put("category", category);
		
		List<Board> list = sqlSession.selectList(NS + "getAdminBoard", map);
			
		return list;
	}
	
	@Override
	   public void addcomment(Comment comment) {
	      int cnum =sqlSession.getMapper(BoardMapper.class).maxcnum();
	      comment.setCommentno(++cnum);
	      sqlSession.getMapper(BoardMapper.class).addcomment(comment);
	   }

	@Override
	public String replyCount(Integer category) {
		// TODO Auto-generated method stub
		return sqlSession.getMapper(BoardMapper.class).replyCount(category);
	}

	@Override
	public List<Comment> replyBoardList(Integer no, Integer ca) {
		// TODO Auto-generated method stub
		Map<Object, Integer> map = new HashMap<Object, Integer>();
		map.put("no", no);
		map.put("ca", ca);
		return sqlSession.getMapper(BoardMapper.class).replyBoardList(map);
	}

	@Override
	public void deleteReply(Comment comment) {
		// TODO Auto-generated method stub
		sqlSession.getMapper(BoardMapper.class).deleteReply(comment);
	}
}
