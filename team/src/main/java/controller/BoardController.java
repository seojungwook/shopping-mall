package controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.MenuElement;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.BoardDao;
import dao.MemberDao;
import exception.PassException;
import logic.Board;
import logic.Comment;
import logic.Member;

@Controller
public class BoardController {
 @Autowired
  BoardDao dao;
 @Autowired
  MemberDao mdao;
 
	@RequestMapping("board/list")
	public ModelAndView list(Integer pageNum,Integer category,HttpSession session) {
		//System.out.println( org.springframework.core.SpringVersion.getVersion() ); 
		if (pageNum == null)
			pageNum = 1;
		ModelAndView mav = new ModelAndView();
		
		String msg = null;
		if(category.equals("11")){
			msg="자유 게시판";
		}if(category.equals("12")){
			msg="Q&A";
		}if(category.equals("13")){
			msg="나눔 게시판";
		}if(category.equals("15")){
			msg="고객 센터";
		}if(category.equals("14")){
			msg="고객 센터";
			int limit = 10;// 페이지당 게시물수
			// 등록된 전체 게시글수
			
			Member member1 = (Member)session.getAttribute("USER_KEY");
			if(member1 == null){
			 throw new PassException("로그인해");
			}
			int mno = member1.getmNo();
			int listcount = dao.boardCount1(category,mno);
			List<Board> boardlist = dao.getBoardList1(pageNum,limit,category,mno);
			int maxpage = (int)((double) listcount / limit + 0.95);
			// 화면 하단의 페이지의 시작 페이지 번호
			int startpage = (((int)((double) pageNum / 10 + 0.9)) - 1) * 10 + 1;
			// 화면 하단의 페이지의 끝페이지 번호
			int endpage = startpage + 9;
			if (endpage > maxpage) {
				endpage = maxpage;
			}

			SimpleDateFormat sdate = new SimpleDateFormat("yyyy-MM-dd");
			String today = sdate.format(new Date());
			
			
			String gu="list";
			mav.addObject("category",category);
			mav.addObject("today", today);
			mav.addObject("pageNum", pageNum);
			mav.addObject("maxpage", maxpage);
			mav.addObject("startpage", startpage);
			mav.addObject("endpage", endpage);
			mav.addObject("listcount", listcount);
			mav.addObject("boardlist", boardlist);
			mav.addObject("msg", msg);
			mav.addObject("gu",gu);
			return mav;
			
		}
		int limit = 10;// 페이지당 게시물수
		// 등록된 전체 게시글수
		int listcount = dao.boardCount(category);
		// 해당 페이지에 출력된 게시물 데이터 저장
		List<Board> boardlist = null;

		boardlist = dao.getBoardList(pageNum, limit, category);
		
		// 전체 페이지의 갯수 저장
		int maxpage = (int)((double) listcount / limit + 0.95);
		// 화면 하단의 페이지의 시작 페이지 번호
		int startpage = (((int)((double) pageNum / 10 + 0.9)) - 1) * 10 + 1;
		// 화면 하단의 페이지의 끝페이지 번호
		int endpage = startpage + 9;
		if (endpage > maxpage) {
			endpage = maxpage;
		}

		SimpleDateFormat sdate = new SimpleDateFormat("yyyy-MM-dd");
		String today = sdate.format(new Date());
		
		
		String gu="list";
		mav.addObject("category",category);
		mav.addObject("today", today);
		mav.addObject("pageNum", pageNum);
		mav.addObject("maxpage", maxpage);
		mav.addObject("startpage", startpage);
		mav.addObject("endpage", endpage);
		mav.addObject("listcount", listcount);
		mav.addObject("boardlist", boardlist);
		mav.addObject("msg", msg);
		mav.addObject("gu",gu);
		return mav;
	}
	@RequestMapping("board/detail")
	public ModelAndView detail(Integer no, Integer pageNum, String category) {
		ModelAndView mav = new ModelAndView("board/detail");
		Board board = dao.selectOne(no, pageNum);
		mav.addObject("board", board);
		mav.addObject("pageNum", pageNum);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		int ca = Integer.parseInt(category);
	    List<Comment> replyList = dao.replyBoardList(no, ca);
	    String today = sdf.format(new Date());
	   
	      mav.addObject("today",today);
	      mav.addObject("replyList",replyList);
		return mav;
	}
	
	@RequestMapping("board/reply")
	   public ModelAndView addcomment(Comment comment, Integer pageNum){
	      
		dao.addcomment(comment);
	      ModelAndView mav = new ModelAndView();
	      mav.setViewName("redirect:detail.html?no="+comment.getNo()+"&pageNum="+pageNum+"&category="+comment.getCategory());
	      return mav;
	   }
	
	@RequestMapping("board/replyDelete")
	   public ModelAndView replyDelete(Comment comment, Integer pageNum){
	      
		dao.deleteReply(comment);
	      ModelAndView mav = new ModelAndView();
	      mav.setViewName("redirect:detail.html?no="+comment.getNo()+"&pageNum="+pageNum+"&category="+comment.getCategory());
	      return mav;
	   }
	
	@RequestMapping("board/add")
	public ModelAndView add(HttpServletRequest request ,Integer category) {
		ModelAndView mav = new ModelAndView("board/add");
		mav.addObject("board", new Board());
		    return mav;
	}
	@RequestMapping("board/write")
	public ModelAndView write(@Valid Board board, BindingResult bindingResult, HttpServletRequest request,Integer category) {
		ModelAndView mav = new ModelAndView("board/add");
//		if (bindingResult.hasErrors()) {
//			mav.getModel().putAll(bindingResult.getModel());
//			return mav;
//		}
	dao.boardWrite(board, request,category);
		mav.setViewName("redirect:/board/list.html?category="+category);
		return mav;
	}
	@RequestMapping("board/deletef")
	public ModelAndView deletef(Integer no, Integer pageNum,String category) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("no", no);
		mav.addObject("pageNum", pageNum);
		return mav;
	}
	
	@RequestMapping("board/delete")//member에서 비밀번호 가져와야함 
	public ModelAndView delete(Integer no, Integer pageNum, String inputpass,HttpSession session, String category) {
		ModelAndView mav = new ModelAndView("board/deletef");
        Member member = (Member)session.getAttribute("USER_KEY");
		Board board = dao.selectOne(no, pageNum);
		mav.addObject("pageNum", pageNum);
		if(member.getGrade() !=9){
		if (member.getmNo() == board.getmNo()&& member.getPass().equals(inputpass)) {	
			dao.delete(board);
			mav.setViewName("redirect:/board/list.html?pageNum" + pageNum+"&category="+category);

		} else {

			mav.setViewName("board/deletef");
			throw new PassException("비밀번호 오류");
		}
		}else{
			dao.delete(board);
			mav.setViewName("redirect:/board/list.html?pageNum" + pageNum+"&category="+category);
		}
		return mav;
	}
//	맴버와 비교해서 비밀번호 조회한다 .
	@RequestMapping("board/modify")
	public ModelAndView modify(Board board, HttpServletRequest request, Integer no, Integer pageNum,
			BindingResult bindingResult, HttpSession session, String category) {
		ModelAndView mav = new ModelAndView("board/modifyf");
		//Board boarddb = dao.selectOne(no, pageNum);
		Member member =(Member)session.getAttribute("USER_KEY");
		
		Member memberdb = mdao.getUser(member.getId(), member.getPass());
		if (bindingResult.hasErrors()) {
			mav.getModel().putAll(bindingResult.getModel());
			return mav;
		}
		if (member.getPass().equals(memberdb.getPass())){
			mav.addObject("no", no);
			mav.addObject("pageNum", pageNum);
			mav.setViewName("redirect:/board/list.html?pageNum="+pageNum+"&category="+category);
			// 새로운 첨부 파일이 없을때
			if (board.getPicture().isEmpty()) {
				board.setFileUrl(request.getParameter("picture2"));
				dao.update(board, request);
			} else {
				board.setFileUrl(board.getPicture().getOriginalFilename());
				dao.update(board, request);
			}
			return mav;
		} else {
			mav.setViewName("board/modifyf");
			throw new PassException("비밀번호 오류");
		}

	}
	
	@RequestMapping("board/modifyf")
	public ModelAndView modifyf(Integer no, Integer pageNum, String category) {
		ModelAndView mav = new ModelAndView("board/modifyf");
		Board board = dao.selectOne(no, pageNum);
		mav.addObject("board", board);
		mav.addObject("no", no);
		mav.addObject("pageNum", pageNum);
		return mav;
	}
	
	@RequestMapping("board/search")
	public ModelAndView search(String searchtype, String searchContent,Integer pageNum,Integer category) {
		if (pageNum == null)
			pageNum = 1;
		ModelAndView mav = new ModelAndView();
		List<Board> boardlist = new ArrayList<Board>();
		int listcount = dao.searchCount(searchtype, searchContent ,category);
		
		int maxpage = (int)((double) listcount / 10 + 0.95);
		// 화면 하단의 페이지의 시작 페이지 번호
		int startpage = (((int)((double) pageNum / 10 + 0.9)) - 1) * 10 + 1;
		// 화면 하단의 페이지의 끝페이지 번호 
		int endpage = startpage + 9;
		if (endpage > maxpage) {
			endpage = maxpage;
		}
		boardlist = dao.search(searchtype,searchContent,pageNum,category);
		
		SimpleDateFormat sdate = new SimpleDateFormat("yyyy-MM-dd");
		String today = sdate.format(new Date());
		String msg = "검색";
		String gu="search";
		mav.addObject("today", today);
		mav.addObject("pageNum", pageNum);
		mav.addObject("maxpage", maxpage);
		mav.addObject("startpage", startpage);
		mav.addObject("endpage", endpage);
		mav.addObject("listcount", listcount);
		mav.addObject("boardlist", boardlist);
		mav.addObject("searchtype",searchtype);
		mav.addObject("searchContent",searchContent);
		mav.addObject("msg", msg);
		mav.addObject("gu",gu);
		mav.setViewName("board/list");
		return mav;
	}
	
	@RequestMapping("board/filedown")
	public void filedown(String filename,HttpServletRequest request,HttpServletResponse response) {
		try {
			filename = new String(filename.getBytes("8859_1"), "euc-kr");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		String filepath = request.getServletContext().getRealPath("/") 
				+ "/upload/" + filename;
		byte[] buf = new byte[4096];
		FileInputStream fis = null;
		OutputStream out = null;
		try {
			fis = new FileInputStream(filepath);
			out = response.getOutputStream();// 브라우져를 담당하는 응답 객체
			response.setContentType("application/octet-stream");
			response.setHeader("Content-Disposition",
					"attachment; filename=" + 
			new String(filename.getBytes("euc-kr"), "8859_1"));
			int readcnt = 0;
			while ((readcnt = fis.read(buf)) != -1) {
				out.write(buf, 0, readcnt);
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (fis != null)
					fis.close();
				if (out != null) {
					out.flush();
					out.close();
				}
			} catch (IOException e) {
			}
		}
	}
}
