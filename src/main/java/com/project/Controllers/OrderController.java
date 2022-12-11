package com.project.Controllers;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.Model.Cart;
import com.project.Model.Customer;
import com.project.Model.Orders;
import com.project.Service.CartService;
import com.project.Service.EmailClientService;
import com.project.Service.OrderService;
import com.project.helper.CartHelper;
import com.project.helper.CartViewHelper;
import com.project.helper.OrderHelper;
import com.project.helper.UrlManager;

@Controller
public class OrderController {

	@Autowired
	private OrderHelper oHelper;

	@Autowired
	private OrderService oService;

	@Autowired
	private CartService cService;

	@Autowired
	private CartHelper cHelper;

	@Autowired
	private CartViewHelper cViewHelper;

	@Autowired
	private UrlManager uManager;

	@Autowired
	private EmailClientService service;

	@RequestMapping("/cart/processOrder")
	public String processOrder(@RequestParam("totalBill") float totalBill, HttpServletRequest request) {
		Orders order = oHelper.setOrder(new Orders(), totalBill, request);
		oService.saveOrder(order);
		HttpSession session = request.getSession();
		int id = (int) session.getAttribute("custId");
		List<Cart> items = cService.findCartsByCustAndOrder(id, 0);
		cHelper.setCartOrder(items, order.getOrderId());
		cViewHelper.cancelCart(items);
		Customer cust = (Customer) session.getAttribute("sessionCustomer");
		String body = "Thank You for shopping with us, " + cust.getUserName()
				+ "\n\n Your order has been placed successfully and will be shipped to you in 1-2 business days\n\n\n\n Your total bill is Rs. "
				+ totalBill;
		service.sendMail(cust.getMail(), body, "Order Placed Successfully");
		return "redirect:/successPage";
	}

	@RequestMapping("/successPage")
	public String successPage(HttpServletRequest request) {
		if (!uManager.checkURL(request))
			return "redirect:/";
		return "success-page";
	}

	@RequestMapping("/admin/viewOrders")
	public String showAdminOrders(Model model, HttpServletRequest request) {
		if (!uManager.adminCheck(request))
			return "redirect:/";
		model.addAttribute("orders", oService.getOrders());
		return "admin-orders";
	}

	@RequestMapping("/viewOrders")
	public String showCustomerOrders(Model model, HttpServletRequest request) {
		if (!uManager.checkURL(request))
			return "redirect:/";
		HttpSession session = request.getSession();
		int id = (int) session.getAttribute("custId");
		model.addAttribute("orders", oService.findOrdersSorted(id));
		Map<Object, Object> maps = oHelper.showOrders(cService.getItemsByCustId(id), oService.findOrderByCust(id));
		model.addAttribute("custOrders", maps);
		return "orders-page";
	}

}