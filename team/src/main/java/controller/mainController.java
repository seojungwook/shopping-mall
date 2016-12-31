package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.DealBoardDao;
import logic.DealBoard;

@Controller
public class mainController {
	@Autowired
	private DealBoardDao dealBoardDao;

	@RequestMapping("module/main")
	public ModelAndView main() {
		ModelAndView mav = new ModelAndView();
		List<DealBoard> salelist = dealBoardDao.getSalelist();
		List<DealBoard> buylist = dealBoardDao.getBuylist();
		mav.addObject("salelist", salelist);
		mav.addObject("buylist", buylist);
		return mav;
	}
}
