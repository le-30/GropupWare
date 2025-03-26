package main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class RouterController {
	
	private final String command ="/router.erp";
	private final String gotoPage ="main/main";
	
	@RequestMapping(command)
	public String doAction(@RequestParam("page") String page) {
		System.out.println("page:"+page);
		if ("emp".equals(page)) {
		    return "redirect:/lsh_list.erp";
		}else if("dept".equals(page)){
			return "redirect:/dept_list.erp";
		}else if("cmmCode".equals(page)){
			return "redirect:/cmm_list.erp";
		}else if("authInfo".equals(page)) {
			return "redirect:/empAuthInfo.erp";
			
		}
		else {
		    return gotoPage;
		}
	}
}
