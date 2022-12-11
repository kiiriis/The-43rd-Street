package com.project.helper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.project.Model.Cart;
import com.project.Service.CartService;
import com.project.Service.GardenService;
import com.project.Service.KitchenService;
import com.project.Service.OfficeService;

@Component
public class CartViewHelper {

	@Autowired
	private KitchenService kService;

	@Autowired
	private GardenService gService;

	@Autowired
	private OfficeService oService;

	@Autowired
	private CartService cService;

	private int totalBill;

	public Map<Object, Object> getProds(List<Cart> cartItems) {
		Map<Object, Object> map = new HashMap<Object, Object>();
		if (totalBill != 0)
			setTotalBill(0);
		for (Cart tempCart : cartItems) {
			if (tempCart.getCategory() == 1 && tempCart.getOrderId() == 0) {

				map.put(kService.getProductById(tempCart.getProd()), tempCart);
				totalBill += (kService.getProductById(tempCart.getProd()).getPrice()) * (tempCart.getQuantity());

			}
			if (tempCart.getCategory() == 2 && tempCart.getOrderId() == 0) {

				map.put(gService.getProductById(tempCart.getProd()), tempCart);
				totalBill += (gService.getProductById(tempCart.getProd()).getPrice()) * (tempCart.getQuantity());

			}
			if (tempCart.getCategory() == 3 && tempCart.getOrderId() == 0) {

				map.put(oService.getProductById(tempCart.getProd()), tempCart);

				totalBill += (oService.getProductById(tempCart.getProd()).getPrice()) * (tempCart.getQuantity());

			}
		}
		setTotalBill(totalBill);
		return map;
	}

	public void cancelCart(List<Cart> items) {
		for (Cart temp : items) {
			cService.deleteCart(temp.getCart_id());
		}
	}

	public int getTotalBill() {
		return totalBill;
	}

	public void setTotalBill(int totalBill) {
		this.totalBill = totalBill;
	}
}
