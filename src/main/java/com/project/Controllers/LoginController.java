package com.project.Controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.Model.Customer;
import com.project.Service.CustomerService;
import com.project.helper.CustomerAuth;
import com.project.helper.UrlManager;

@Controller
public class LoginController {
	@Autowired
	private CustomerService custService;
	private CustomerAuth custAuth = new CustomerAuth();
	@Autowired
	private UrlManager manager;

	@RequestMapping("/")
	public String signUp(@ModelAttribute("custLogin") Customer customer, HttpSession session) {
		if (session.getAttribute("sessionCustomer") != null) {
			return "redirect:homePage";
		}
		return "login-page";
	}

	@RequestMapping("/processLogin")
	public String processUser(@ModelAttribute("custLogin") Customer customer, HttpServletRequest request,
			HttpSession session) {
		if (custAuth.isAdmin(customer.getUserName(), customer.getPassword())) {
			session = request.getSession(true);
			session.setAttribute("admin", customer);
			return "redirect:/admin";
		}
		if (custAuth.authCustomer(customer.getUserName(), customer.getPassword(), custService.getCustomers())) {
			Customer tempCust = custService.findCust(customer.getUserName());
			session = request.getSession(true);
			session.setAttribute("sessionCustomer", tempCust);
			session.setAttribute("custId", tempCust.getId());
			System.out.println(tempCust.getId());
			return "redirect:/homePage";
		}

		return "redirect:/";
	}

	@RequestMapping("/homePage")
	public String homePage(HttpServletRequest request) {
		if (!manager.checkURL(request))
			return "redirect:/";
		return "home-page";
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("sessionCustomer");
		session.removeAttribute("custId");
		session.removeAttribute("admin");
		session.invalidate();
		return "redirect:/";
	}
}
