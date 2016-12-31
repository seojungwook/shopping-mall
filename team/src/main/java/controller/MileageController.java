package controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.catalina.connector.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.MileageDao;
import logic.Mileage;

@Controller
public class MileageController {
	@Autowired
	public MileageDao mileDao; 
	
	@RequestMapping("mileage/mileageBoard")
	public ModelAndView list(Integer pageNum){
		if(pageNum == null) pageNum=1;
		ModelAndView mav = new ModelAndView();
		int limit = 10; //�������� �Խù� ��
		//��ϵǾ����ִ� ��ü �Խù� ����
		int listcount = mileDao.mileCount();
		//�ش� �������� ��µ� �Խù� ������ ����
		List<Mileage> milelist = mileDao.getMileList(pageNum,limit);
		//��ü �������� ���� ����
		int maxpage = (int)((double)listcount/limit + 0.95);
		//ȭ�� �ϴ��� �������� ����������
		int startpage = (((int)((double)pageNum/10 + 0.9)) -1) * 10 +1;
		int endpage = startpage + 9;
		
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String today = df.format(new Date());
		
		if(endpage > maxpage) endpage = maxpage;
		mav.addObject("pageNum",pageNum);
		mav.addObject("maxpage",maxpage);
		mav.addObject("startpage",startpage);
		mav.addObject("endpage",endpage);
		mav.addObject("listcount",listcount);
		mav.addObject("milelist", milelist);
		mav.addObject("today",today);
		
		return mav;
		
		
	}
	@RequestMapping("mileage/mileageDetail")
	public ModelAndView detail(Integer num, Integer pageNum){
		Mileage mileage = mileDao.mileDetail(num);
		ModelAndView mav = new ModelAndView();
		mav.addObject("mileage",mileage);
		mav.addObject("pageNum",pageNum);
		return mav;
		
	}
	@RequestMapping("mileage/mileageWrite")
	public ModelAndView mileageWrite(Integer num){
	
	ModelAndView mav = new ModelAndView();
	mav.addObject("mileage",new Mileage());
	return mav;

	}
	@RequestMapping("mileage/mileageApply")
	public ModelAndView add(@Valid Mileage mileage,
			BindingResult bindingResult,
			HttpServletRequest request){
		ModelAndView mav= new ModelAndView("mileage/mileageWrite");
					
			
	
		if(bindingResult.hasErrors()){ 
			mav.getModel().putAll
						(bindingResult.getModel());
			return mav;
		}
			mileDao.mileWrite(mileage, request); 
			mav.setViewName("redirect:/mileage/mileageBoard.html");
			return mav;
		
	}

	@RequestMapping("mileage/delete")
	public ModelAndView delete(Mileage mileage){
		ModelAndView mav= new ModelAndView("mileage/mileageBoard");
		mileDao.mileDelete(mileage.getListno());
		
		return mav;
	}
}
