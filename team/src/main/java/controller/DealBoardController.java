package controller;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.catalina.connector.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dao.DealBoardDao;
import logic.Comment;
import logic.DealBoard;
import logic.Member;

@Controller
public class DealBoardController {
	@Autowired
	private DealBoardDao dealBoardDao;
	
	@RequestMapping("dealboard/saleList_1")
	public ModelAndView saleList1(Integer pageNum, Integer category, Integer dealcheck, String searchContent){
		System.out.println("카테고리>>>"+category);
		if(category == 100)
		{
			return allsearch(searchContent, pageNum , category);
		}
		else
		{
			System.out.println("over here");
			if(pageNum == null)
				pageNum = 1;
			ModelAndView mav = new ModelAndView();
			int limit = 12;
			int listcount = dealBoardDao.dealBoardCount(category, dealcheck);
			List<DealBoard> dealboardlist = 
					dealBoardDao.getDealBoardList(pageNum,limit,category,dealcheck);
			int maxpage = (int)((double)listcount/limit + 0.95);
			int startpage = (((int)((double)pageNum / 12 + 0.95)) - 1) * 12 + 1;
			int endpage = startpage + 9;
			if(endpage > maxpage)
				endpage = maxpage;
			String msg = null;
			if(category==1) {
				msg="가전·TV·디카";
			} else if(category==2) {
				msg="컴퓨터·노트북";
			} else if(category==3) {
				msg="태블릿·모바일";
			} else if(category==4) {
				msg="아웃도어·스포츠·골프";
			} else if(category==5) {
				msg="자동차·용품";
			} else if(category==6) {
				msg="가구·침구·LED";
			} else if(category==7) {
				msg="유아·완구·식품";
			} else if(category==8) {
				msg="생활·주방·공구";
			} else if(category==9) {
				msg="패션·잡화·뷰티";
			} else if(category==10){
				msg="사무·취미·게임";
			} else {
				msg="검색결과";			
			}
			mav.addObject("listcount", listcount);
			mav.addObject("boardlist", dealboardlist);
			mav.addObject("pageNum", pageNum);
			mav.addObject("maxpage", maxpage);
			mav.addObject("startpage", startpage);
			mav.addObject("endpage", endpage);
			mav.addObject("msg", msg);
			mav.addObject("category", category);
			SimpleDateFormat sdate = new SimpleDateFormat("yyyy-MM-dd");
			String today = sdate.format(new Date());
			mav.addObject("today", today);
			return mav;
		}
	}
	
	@RequestMapping("dealboard/saleDetail")
	public ModelAndView saledetail(int num, Integer pageNum,HttpSession session, Integer category) {
		DealBoard dealboard = dealBoardDao.dealboardDetail(num, pageNum);
		Member member = (Member)session.getAttribute("USER_KEY");
		ModelAndView mav = new ModelAndView();
		mav.addObject("dealboard",dealboard);
		mav.addObject("pageNum", pageNum);
		String check = dealBoardDao.zzim(num,member.getmNo());
		mav.addObject("check",check);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		int ca = category;
		String replylistCount = dealBoardDao.replyCount(category);
	    List<Comment> replyList = dealBoardDao.replyBoardList(num, ca);
	    String today = sdf.format(new Date());
//	    mav.addObject("category",ca);
	    mav.addObject("today",today);
		mav.addObject("replylistCount",replylistCount);
	    mav.addObject("replyList",replyList);
		
		
		
		return mav;
	}
	@RequestMapping("dealboard/reply")
	   public ModelAndView addcomment(Comment comment, Integer pageNum){
	      
		dealBoardDao.addcomment(comment);
	      ModelAndView mav = new ModelAndView();
	      if(pageNum == null){
	      mav.setViewName("redirect:saleDetail.html?num="+comment.getNo()+"&pageNum=1&category="+comment.getCategory());
	      }else{	     
	    	  mav.setViewName("redirect:saleDetail.html?num="+comment.getNo()+"&pageNum="+pageNum+"&category="+comment.getCategory());
	      }
	      return mav;
	   }
	
	@RequestMapping("dealboard/replyDelete")
	   public ModelAndView replyDelete(Comment comment, Integer pageNum){
	      
		dealBoardDao.deleteReply(comment);
	      ModelAndView mav = new ModelAndView();
	      if(pageNum == null){
	    	  mav.setViewName("redirect:saleDetail.html?num="+comment.getNo()+"&url=2&category="+comment.getCategory());
	      }else{
	      mav.setViewName("redirect:saleDetail.html?num="+comment.getNo()+"&pageNum="+pageNum+"&category="+comment.getCategory());
	      }
	      return mav;
	   }
	@RequestMapping("dealboard/saleAdd")
	public ModelAndView saleadd() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("dealboard", new DealBoard());
		return mav;
	}
	@RequestMapping("dealboard/salewrite")
	public ModelAndView salewrite(HttpSession session, DealBoard dealboard,HttpServletRequest request, Integer category, Integer dealcheck, MultipartFile picture2) {
		ModelAndView mav = new ModelAndView("dealboard/saleAdd");
		Member member = (Member)session.getAttribute("USER_KEY");
		
		int mNo = member.getmNo();
		if(dealcheck==0) {
			dealboard.setBmemno(0);
			dealboard.setSmemno(mNo);
		}if(dealcheck==2){
			dealboard.setBmemno(mNo);
			dealboard.setSmemno(0);
		}
		
		dealBoardDao.saleadd(dealboard, request);
		mav.setViewName("redirect:/dealboard/saleList_1.html?category="+category+"&dealcheck="+dealcheck);
		
		if(!dealboard.getPicture2().isEmpty()) { 
			dealboard.setFileUrl2(dealboard.getPicture2().getOriginalFilename()); 
			imgProcess(dealboard.getPicture2(), request);
		} 
		if(!dealboard.getPicture3().isEmpty()) { 
			dealboard.setFileUrl3(dealboard.getPicture3().getOriginalFilename()); 
			imgProcess(dealboard.getPicture3(), request); 
		}
		if(!dealboard.getPicture4().isEmpty()) { 
			dealboard.setFileUrl4(dealboard.getPicture4().getOriginalFilename()); 
			imgProcess(dealboard.getPicture4(), request); 
		}
		if(!dealboard.getPicture5().isEmpty()) { 
			dealboard.setFileUrl5(dealboard.getPicture5().getOriginalFilename()); 
			imgProcess(dealboard.getPicture5(), request); 
		}
		return mav;
	}
	
	@RequestMapping("dealboard/saleDeleteForm")
	public ModelAndView saleDelete(Integer category, Integer pageNum, Integer dealcheck){
		ModelAndView mav = new ModelAndView();
		mav.addObject("category", category);
		mav.addObject("pageNum", pageNum);
		mav.addObject("dealcheck", dealcheck);
		return mav;
	}
	
	@RequestMapping("dealboard/saleDelete")
	public ModelAndView saledelete(int num, int pageNum, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		DealBoard dealboard = dealBoardDao.dealboardDetail(num, pageNum);
		Member member = (Member) session.getAttribute("USER_KEY");
		if(member.getmNo() == dealboard.getSmemno()) {
			dealBoardDao.saledelete(num, dealboard);
		}
		mav.setViewName("redirect:/dealboard/saleList_1.html?pageNum="+pageNum+"&category="+dealboard.getCategory()+"&dealcheck="+dealboard.getDealcheck());
		return mav;
	}
	
	@RequestMapping("dealboard/saleUpdateForm")
	public ModelAndView saleUpdateForm(int num, Integer pageNum, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		DealBoard dealboard = dealBoardDao.dealboardDetail(num, pageNum);
		mav.addObject("dealboard", dealboard);
		mav.addObject("pageNum", pageNum);
		return mav;
	}
	@RequestMapping("dealboard/saleUpdate")
	public ModelAndView saleupdate(DealBoard dealboard, HttpServletRequest request, Integer pageNum,String url) {
		ModelAndView mav = new ModelAndView();
		//update 부분
		if(dealboard.getFileUrl1()==null ) { //첨부파일 수정 안하는 경우
			dealboard.setFileUrl1(request.getParameter("file1_1")); //DB에 저장되어져 있는 첨부파일
		} else { //첨부파일 수정 하는 경우
			dealboard.setFileUrl1(dealboard.getPicture1().getOriginalFilename());
		}
		if(dealboard.getPicture2().isEmpty()) { 
			dealboard.setFileUrl2(request.getParameter("file2_1")); 
		} else { 
			dealboard.setFileUrl2(dealboard.getPicture2().getOriginalFilename());
		}
		if(dealboard.getPicture3().isEmpty()) { 
			dealboard.setFileUrl3(request.getParameter("file3_1")); 
		} else { 
			dealboard.setFileUrl3(dealboard.getPicture3().getOriginalFilename());
		}
		if(dealboard.getPicture4().isEmpty()) {
			dealboard.setFileUrl4(request.getParameter("file4_1")); 
		} else { 
			dealboard.setFileUrl4(dealboard.getPicture4().getOriginalFilename());
		}
		if(dealboard.getPicture5().isEmpty()) { 
			dealboard.setFileUrl5(request.getParameter("file5_1")); 
		} else { 
			dealboard.setFileUrl5(dealboard.getPicture5().getOriginalFilename());
		}
		dealBoardDao.saleupdate(dealboard, request);
		mav.setViewName("redirect:/dealboard/saleDetail.html?num="+dealboard.getNum()+"&pageNum="+pageNum+"&dealcheck="+dealboard.getDealcheck()+"&url="+url);
		return mav;
	}
	
	@RequestMapping("dealboard/fileimg")
	public String imgForm() {
		return "fileimg";
	}
	
	@RequestMapping("dealboard/fileimg2")
	public ModelAndView imgProcess(MultipartFile picture1, HttpServletRequest request) {
		String file1Path = request.getServletContext().getRealPath("/")+"file/";
		FileOutputStream fos = null;
		InputStream in = null;
		try {
			fos = new FileOutputStream(file1Path + picture1.getOriginalFilename());
			in = picture1.getInputStream();
			int data;
			while ((data = in.read()) != -1) {
				fos.write(data);
			}
			fos.close();
			in.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		ModelAndView mav = new ModelAndView("fileimg2");
		mav.addObject("picture1", picture1.getOriginalFilename());
		//request.setAttribute("file1",file1);
		return mav;
	}
	
	@RequestMapping("dealboard/filedown")
	public void filedown(String filename, HttpServletRequest request, HttpServletResponse response) {
		try {
			filename = new String(filename.getBytes("8859_1"),"euc-kr");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		String filepath = request.getServletContext().getRealPath("/")+"/file/"+filename;
		byte[] buf = new byte[4096];
		FileInputStream fis = null;
		OutputStream out = null;
		try {
			fis = new FileInputStream(filepath);
			out = response.getOutputStream(); //브라우저를 담당하는 응답객체
			response.setContentType("application/octet-stream");
			response.setHeader("Content-Disposition", "attachment; filename="
								  + new String(filename.getBytes("euc-kr"), "8859_1"));
			int readcnt = 0;
			while((readcnt = fis.read(buf)) != -1) {
				out.write(buf,0,readcnt); //out작성 : buf에 0번부터 readcnt까지
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (fis != null)
					fis.close();
				if(out != null) {
					out.flush();
					out.close();
				}
			} catch (IOException e) {}
		}
	}
	@RequestMapping("dealboard/salesearch")
	public ModelAndView search(String searchType, String searchContent, int pageNum, Integer category, Integer dealcheck) {
		ModelAndView mav = new ModelAndView();
		List<DealBoard> dealboardList = dealBoardDao.dealboardList(searchType,searchContent,category,dealcheck,pageNum);
		String msg = "검색 결과";
		int listcount = dealboardList.size();
		int limit = 10;
		int maxpage = (int)((double)listcount/limit + 0.95); 
		int startpage = (((int)((double)pageNum / 10 + 0.95)) - 1) * 10 + 1;
		int endpage = startpage + 9;
		if(endpage > maxpage)
			endpage = maxpage;
		mav.addObject("listcount", listcount);
		mav.addObject("boardlist", dealboardList);
		mav.addObject("pageNum", pageNum);
		mav.addObject("maxpage", maxpage);
		mav.addObject("startpage", startpage);
		mav.addObject("endpage", endpage);
		mav.addObject("category", category);
		mav.addObject("dealcheck", dealcheck);
		mav.addObject("msg", msg);
		mav.setViewName("dealboard/saleList_1");
		return mav;
	}
	@RequestMapping("dealboard/allsalesearch")
	public ModelAndView allsearch(String searchContent,Integer pageNum,Integer category){
		if(pageNum == null) {
			pageNum = 1;
		}
		int limit =12;
		String msg = "전체 검색 결과";
		ModelAndView mav = new ModelAndView();
		List<DealBoard> dealboardList = dealBoardDao.alldealboardList(searchContent,pageNum);
		int listcount = dealBoardDao.allDealBoardCount(searchContent);
		int maxpage = (int)((double)listcount/limit + 0.95); 
		int startpage = (((int)((double)pageNum / 10 + 0.95)) - 1) * 10 + 1;
		int endpage = startpage + 9;
		if(endpage > maxpage)
		{
			endpage = maxpage;
		}
		System.out.println("searchContent>>"+searchContent+",maxpage>>"+maxpage+",category>>"+category);
	   // mav.addObject("category",category);
		mav.addObject("msg",msg);
		mav.addObject("pageNum", pageNum);
		mav.addObject("listcount", listcount);
		mav.addObject("boardlist", dealboardList);
		mav.addObject("category",category);
		mav.addObject("maxpage", maxpage);
		mav.addObject("startpage", startpage);
		mav.addObject("endpage", endpage);
		//mav.addObject("dealcheck", dealcheck);
		mav.setViewName("dealboard/saleList_1");
		return mav;
	}
}
