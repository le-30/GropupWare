package message.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import employee.model.EmployeeBean;
import employee.model.EmployeeDao;
import message.model.MessageBean;
import message.model.MessageDao;

@Controller
public class MessageWriteController {
	private final String command = "ymh_messageinsert.erp";
	private String getPage = "message/MessageWriteForm";
	private final String gotoPage ="redirect:/main.erp?page=send";
	
	@Autowired
	MessageDao mdao;
	
	@Autowired
	EmployeeDao edao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doAction(HttpServletRequest request) {
		
		List<EmployeeBean> list = edao.getAllEmployee(null);
		
		request.setAttribute("list", list);
		
		return getPage;
	}
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	public ModelAndView doAction(@ModelAttribute("mb") @Valid MessageBean mb,BindingResult result,
								HttpServletRequest request) {
		
		System.out.println("write");
//		System.out.println("title : " + mb.getMsg_title());
//		System.out.println("contnet : " + mb.getMsg_content());
//		System.out.println("receive_emp_no : " + mb.getReceive_emp_no());
//		System.out.println("send_emp_no : " + mb.getSend_emp_no());
		
		List<EmployeeBean> list = edao.getAllEmployee(null);
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("list",list);
		
		if(result.hasErrors()) {
			mav.setViewName(getPage);
			return mav;
		}
		
		String[] emp_no_arr = null;
		
		if(mb.getReceive_emp_no() != null) {
			
			String input = mb.getReceive_emp_no();
			emp_no_arr = input.split("\\s*,\\s*"); // 공백과 콤마 제거 후 배열로 변환
			
		}

//		System.out.println("emp_no_arr.length : " + emp_no_arr.length);
		
		int cnt = -1;
		
		
		for(int i=0;i<emp_no_arr.length;i++) {
		
			mb.setReceive_emp_no(emp_no_arr[i]);
			
			cnt = mdao.SendMessage(mb); 
	
			mav.setViewName(gotoPage);
		}
		
		if(cnt == -1) {
			mav.setViewName(getPage);
		}
		
		return mav;
	}
	
}
