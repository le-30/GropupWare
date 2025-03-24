package employee.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import employee.model.EmployeeBean;
import employee.model.EmployeeDao;

@Controller
public class EmpListController {
		
		HttpServletRequest request;
		private final String command ="/lsh_list.erp";
		private final String gotoPage= "employee/emp_listForm";
		
		@Autowired
		EmployeeDao empdao;
		
		@RequestMapping(command)
		public ModelAndView doAction() {
			ModelAndView mav = new ModelAndView();
			
			List<EmployeeBean> lists = empdao.getAllEmployee();
			
			mav.addObject("lists",lists);
			mav.setViewName(gotoPage);
			
			return mav;
		}
}
