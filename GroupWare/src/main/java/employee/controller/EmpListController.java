package employee.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
		
		@RequestMapping(value = command, method = RequestMethod.GET)
		public ModelAndView doAction(@RequestParam(value="keyword",required= false)String keyword,
									 @RequestParam(value ="whatColumn", required =false)String whatColumn) {
			ModelAndView mav = new ModelAndView();
			Map<String,String> map = new HashMap<String,String>();
			map.put("whatColumn",whatColumn);
			map.put("keyword", "%"+keyword+"%");
			List<EmployeeBean> lists = empdao.getAllEmployee(map);
			
			mav.addObject("lists",lists);
			mav.setViewName(gotoPage);
			
			return mav;
		}
}
