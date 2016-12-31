package controller;

import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.DealBoardDao;
import dao.MemberDao;
import dao.ZzimDao;
import exception.PassException;
import logic.Member;
import logic.Zzim;


@Controller
public class ZzimController {
   
	@Autowired
    ZzimDao zzimdao;
	@Autowired
	DealBoardDao ddao;
	@Autowired
	MemberDao mdao;
	
	@RequestMapping("zzim/zzimlist")
	public ModelAndView zzimlist(HttpSession session){

		ModelAndView mav = new ModelAndView();
		Member member = (Member)session.getAttribute("USER_KEY");
		if(member == null){
			throw new PassException("·Î±×ÀÎ ");
		}else{
			
			int mNo = member.getmNo();
			int countlist=zzimdao.listcount(mNo);
			List<Zzim>zzimlist = zzimdao.getlist(mNo);
			mav.addObject("zzimlist",zzimlist);
			mav.addObject("countlist",countlist);
			
			return mav;
		}
	}
		
		@RequestMapping("zzim/zzim")
		public ModelAndView zzim(HttpSession session, int num){
			ModelAndView mav = new ModelAndView();
			Member member = (Member)session.getAttribute("USER_KEY");
			int mno = member.getmNo();
			System.out.println(num);
			zzimdao.input(mno,num);
			mav.setViewName("redirect:/zzim/zzimlist.html");
			return mav;
		}
		
		@RequestMapping("zzim/zzimdel")
		public ModelAndView zzimdel(HttpSession session, int num){
			ModelAndView mav = new ModelAndView();
			Member member = (Member)session.getAttribute("USER_KEY");
			int mno = member.getmNo();
			zzimdao.delete(mno,num);
			mav.setViewName("redirect:/zzim/zzimlist.html");
			return mav;
			
		}
	
	}

