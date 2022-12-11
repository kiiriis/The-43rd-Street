package com.project.helper;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.project.Model.Cart;
import com.project.Service.CartService;

@Component
public class CartHelper {

	@Autowired
	private CartService cService;

	public Cart setCart(int quantity, int custId, int prod_id, int prod_cat) {
		Cart cart = new Cart();
		List<Cart> cart_items = cService.getItems();
		for (Cart temp : cart_items) {
			if (prod_id == temp.getProd() && prod_cat == temp.getCategory() && custId == temp.getCust() && temp.getOrderId() == 0) {
				cart.setCust(custId);
				cart.setCategory(prod_cat);
				cart.setProd(prod_id);
				cart.setQuantity(quantity + temp.getQuantity());
//				System.out.println("Before deleting");
				cService.deleteCart(temp.getCart_id());
//				System.out.println("After deleting");
				cService.saveCart(cart);
				return cart;
			}
		}
		cart.setCust(custId);
		cart.setCategory(prod_cat);
		cart.setQuantity(quantity);
		cart.setProd(prod_id);
		cService.saveCart(cart);
		return cart;

	}

	public void setCartOrder(List<Cart> items, int id) {
		for (Cart temp : items) {
			Cart cart = new Cart();
			cart.setCategory(temp.getCategory());
			cart.setCust(temp.getCust());
			cart.setOrderId(id);
			cart.setProd(temp.getProd());
			cart.setQuantity(temp.getQuantity());
			cService.saveCart(cart);
		}
	}
}
