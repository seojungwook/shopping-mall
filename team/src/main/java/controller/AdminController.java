package controller;



import java.text.SimpleDateFormat;

import java.util.Date;
import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.BoardDao;
import dao.DealBoardDao;
import dao.MemberDao;
import dao.MileageDao;

import logic.Board;
import logic.Comment;


@Controller
public class AdminController {

	@Autowired
	BoardDao bDao;
	@Autowired
	MemberDao memDao;
	@Autowired
	DealBoardDao dDao;
	@Autowired
	MileageDao milDao;
	
	
	@RequestMapping("admin/main")
	public ModelAndView main(){
		ModelAndView mav = new ModelAndView();
		
		return mav;
	}
	
	@RequestMapping("admin/boardlist")
	public ModelAndView boardlist(Integer pageNum,Integer category){
		if (pageNum == null)
			pageNum = 1;
		ModelAndView mav = new ModelAndView();
		int limit = 10;// �������� �Խù���
		// ��ϵ� ��ü �Խñۼ�
		int listcount = bDao.boardCount(category);
		// �ش� �������� ��µ� �Խù� ������ ����
		List<Board> boardlist = null;

		boardlist = bDao.getAdminBoardList(pageNum, limit, category);
		
		// ��ü �������� ���� ����
		int maxpage = (int)((double) listcount / limit + 0.95);
		// ȭ�� �ϴ��� �������� ���� ������ ��ȣ
		int startpage = (((int)((double) pageNum / 10 + 0.9)) - 1) * 10 + 1;
		// ȭ�� �ϴ��� �������� �������� ��ȣ
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
		mav.addObject("gu",gu);
		return mav;
		
	}
	@RequestMapping("admin/detail")
	public ModelAndView detail(Integer no, Integer pageNum, String category) {
		ModelAndView mav = new ModelAndView("admin/detail");
		Board board = bDao.selectOne(no, pageNum);
		mav.addObject("board", board);
		mav.addObject("pageNum", pageNum);
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		int ca = Integer.parseInt(category);
	    List<Comment> replyList = bDao.replyBoardList(no, ca);
	    String today = sdf.format(new Date());
	   
	      mav.addObject("today",today);
	      mav.addObject("replyList",replyList);
		return mav;
	}
	
	@RequestMapping("admin/reply")
	   public ModelAndView addcomment(Comment comment, Integer pageNum){
	      
		bDao.addcomment(comment);
	      ModelAndView mav = new ModelAndView();
	      mav.setViewName("redirect:detail.html?no="+comment.getNo()+"&pageNum="+pageNum+"&category="+comment.getCategory());
	      return mav;
	   }
	
	@RequestMapping("admin/replyDelete")
	   public ModelAndView replyDelete(Comment comment, Integer pageNum){
	      
		bDao.deleteReply(comment);
	      ModelAndView mav = new ModelAndView();
	      mav.setViewName("redirect:detail.html?no="+comment.getNo()+"&pageNum="+pageNum+"&category="+comment.getCategory());
	      return mav;
	   }
}
