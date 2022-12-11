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
import com.project.Service.CartService;
import com.project.helper.CartHelper;
import com.project.helper.CartViewHelper;
import com.project.helper.UrlManager;

@Controller
public class CartController {

	@Autowired
	private CartHelper cartHelper;
	@Autowired
	private CartService cService;
	@Autowired
	private CartViewHelper cartViewHelper;
	@Autowired
	private UrlManager manager;

	@RequestMapping("/kitchenCart")
	public String addToKCart(Model model, @RequestParam(value = "quantity", defaultValue = "1") int quantity,
			@RequestParam("KproductId") int prod_id, @RequestParam(value = "KproductCategory") int prod_cat,
			HttpServletRequest request) {	
		System.out.println(prod_id);
		HttpSession session = request.getSession();
		int custId = (Integer) session.getAttribute("custId");
		Cart cart = cartHelper.setCart(quantity, custId, prod_id, prod_cat);
		model.addAttribute("cart", cart);
		return "redirect:kitchenPage";
	}

	@RequestMapping("/gardenCart")
	public String addToGCart(Model model, @RequestParam(value = "quantity", defaultValue = "1") int quantity,
			@RequestParam("GproductId") int prod_id, @RequestParam(value = "GproductCategory") int prod_cat,
			HttpServletRequest request) {
		HttpSession session = request.getSession();
		int custId = (Integer) session.getAttribute("custId");
		Cart cart = cartHelper.setCart(quantity, custId, prod_id, prod_cat);
		model.addAttribute("cart", cart);
		return "redirect:gardenPage";
	}

	@RequestMapping("/officeCart")
	public String addToOCart(Model model, @RequestParam(value = "quantity", defaultValue = "1") int quantity,
			@RequestParam("OproductId") int prod_id, @RequestParam(value = "OproductCategory") int prod_cat,
			HttpServletRequest request) {
		HttpSession session = request.getSession();
		int custId = (Integer) session.getAttribute("custId");
		Cart cart = cartHelper.setCart(quantity, custId, prod_id, prod_cat);
		model.addAttribute("cart", cart);
		return "redirect:officePage";
	}

	@RequestMapping("/viewCart")
	public String viewCart(Model model, HttpServletRequest request) {
		if(!manager.checkURL(request))
			return "redirect:/";
		HttpSession session = request.getSession();
		int id = (Integer) session.getAttribute("custId");
		List<Cart> cartItems = cService.getItemsByCustId(id);
		Map<Object, Object> map = cartViewHelper.getProds(cartItems);
		model.addAttribute("cartItems", map);
		model.addAttribute("totalBill", cartViewHelper.getTotalBill());
		return "cart-page";
	}

	@RequestMapping("/cart/delete")
	public String deleteItem(Model model, HttpServletRequest request, @RequestParam(value = "productId") int p_id,
			@RequestParam(value = "productCategory") int p_cat) {
		HttpSession session = request.getSession();
		int id = (Integer) session.getAttribute("custId");
		cService.deleteCartByCustom(cService.getCartCustom(id, p_id, p_cat));
		return "redirect:/viewCart";
	}
	
	@RequestMapping("/cancelOrder")
	public String cancelOrder(HttpServletRequest request) {
		HttpSession session = request.getSession();
		int id = (Integer) session.getAttribute("custId");
		List<Cart> items = cService.getItemsByCustId(id);
		cartViewHelper.cancelCart(items);
		return "redirect:/homePage";
	}

}
