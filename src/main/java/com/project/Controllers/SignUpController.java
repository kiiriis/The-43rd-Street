package com.project.Controllers;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.Model.Customer;
import com.project.Service.CustomerService;
import com.project.Service.EmailClientService;
import com.project.helper.CustomerAuth;

@Controller
public class SignUpController {
	@Autowired
	private CustomerService custService;
	@Autowired
	private EmailClientService service;
	private CustomerAuth custAuth = new CustomerAuth();

	@RequestMapping("/signup")
	public String signup(@ModelAttribute("custModel") Customer customer) {
		return "signup-page";
	}

	@RequestMapping("/saveCustomer")
	public String saveCustomer(@ModelAttribute("custModel") Customer customer) throws MessagingException {
		if (custAuth.authSignup(customer.getUserName(), customer.getMail(), custService.getCustomers())) {
			return "redirect:/signup";
		} else {
			
			custService.saveCustomer(customer);	
			service.sendMailWithAttachment(customer.getMail(), "Hey "+customer.getUserName()+"! \nWelcome to The 43rd Street Pvt Ltd, we wish you a very happy shopping!",
					"The 43rd Street private limited", "C:\\Users\\makad\\Desktop\\1.gif");
			return "redirect:/";
		}
	}

}
