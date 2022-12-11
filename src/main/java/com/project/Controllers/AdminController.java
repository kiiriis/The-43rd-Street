package com.project.Controllers;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.Service.CustomerService;
import com.project.helper.UrlManager;

@Controller
public class AdminController {

	@Autowired
	private UrlManager manager;
	
	@Autowired
	private CustomerService cService;

	@RequestMapping("/admin")
	public String adminPage(HttpServletRequest request) {
		if (!manager.adminCheck(request))
			return "redirect:/";
		return "admin";
	}

	@RequestMapping("/admin/viewCustomer")
	public String showCustomer(@RequestParam("customerId") int id, HttpServletRequest request,Model model) {
		if (!manager.adminCheck(request))
			return "redirect:/";
		model.addAttribute("customer", cService.getCustomerById(id));
		return "admin-cust-page";
	}
}
