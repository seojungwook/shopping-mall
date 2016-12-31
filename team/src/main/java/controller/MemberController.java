package controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.MemberDao;
import logic.Member;

@Controller
public class MemberController {
	
	@Autowired
	MemberDao dao;
	
	@RequestMapping("member/loginForm")
	public ModelAndView loginForm(){
		ModelAndView mav = new ModelAndView("member/loginForm");
		Member member = new Member();
		mav.addObject("member", member);
		
		return mav;
	}

	@RequestMapping("member/login")
	public ModelAndView login(@Valid Member member, BindingResult bindingResult, HttpSession session){
		ModelAndView mav = new ModelAndView("module/main");
		
		Member loginMember = dao.getUser(member.getId(), member.getPass());
		session.setAttribute("USER_KEY", loginMember);
		
		mav.addObject("loginMember", loginMember);
		mav.setViewName("redirect:../module/main.html");
		
		return mav;
		
	}
	
	@RequestMapping("member/logout")
	public ModelAndView logout(HttpSession session){
		ModelAndView mav = new ModelAndView();
		session.setAttribute("USER_KEY", null);
		return mav; 
	}
	
	@RequestMapping("member/joinForm")
	public ModelAndView joinForm(){
		ModelAndView mav = new ModelAndView();
		Member member = new Member();
		mav.addObject("member", member);
		return mav;
	}
	
	@RequestMapping("member/joinProcess")
	public ModelAndView Join( Member member, BindingResult bindingResult){
		ModelAndView mav = new ModelAndView("member/joinForm");
		
		/*if(bindingResult.hasErrors()){
			mav.getModel().putAll(bindingResult.getModel());
			return mav;
		}*/
		
		int result = dao.memberInsert(member);
		
		if(result > 0) {
			mav.setViewName("redirect:loginForm.html");
		} else {
			mav.setViewName("redirect:joinForm.html");
		}
		return mav;
	}
	
	
}
