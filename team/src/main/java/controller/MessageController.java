package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.MemberDao;

@Controller
public class MessageController {
	@Autowired
	MemberDao mDao;
	
	@RequestMapping("message/message_main")
	public ModelAndView main(){
		ModelAndView mav = new ModelAndView("message_main");
		
		return mav;
	}
	
	@RequestMapping("message/sendcheck")
	public ModelAndView send(Integer no){
		
		String nickName = mDao.selectMessage(no);
		ModelAndView mav = new ModelAndView("message/send");
		System.out.println(nickName);
		mav.addObject("nickName", nickName);
		
		return mav;
	}
}
