package com.project.helper;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.project.Model.Cart;
import com.project.Model.Orders;
import com.project.Service.GardenService;
import com.project.Service.KitchenService;
import com.project.Service.OfficeService;

@Component
public class OrderHelper {

	@Autowired
	private KitchenService kService;

	@Autowired
	private GardenService gService;

	@Autowired
	private OfficeService oService;

	public Orders setOrder(Orders order, float totalBill, HttpServletRequest request) {
		HttpSession session = request.getSession();
		int id = (int) session.getAttribute("custId");
		Date date = new Date(System.currentTimeMillis());
		order.setOrderDate(date);
		order.setCustomer(id);
		order.setTotalBill(totalBill);
		return order;
	}

	public Map<Object, Object> showOrders(List<Cart> cartItems, List<Orders> orders) {
		Map<Object, Object> map = new HashMap<Object, Object>();
		List<Cart> tempcarts = new ArrayList<Cart>();
//		List<Orders> temporders = new ArrayList<Orders>();
//		List<Map<Object, Object>> maps = new ArrayList<Map<Object, Object>>();
		for (Orders order : orders) {
			for (Cart cart : cartItems) {
				if (cart.getOrderId() == order.getOrderId()) {
					tempcarts.add(cart);
				}
			}
			mapOrders(tempcarts,map);
		}
		return map;
	}

	public Map<Object, Object> mapOrders(List<Cart> carts,Map<Object, Object> map) {
		for (Cart temp : carts) {
			if (temp.getCategory() == 1)
				map.put(temp,kService.getProductById(temp.getProd()));
			if (temp.getCategory() == 2)
				map.put(temp,gService.getProductById(temp.getProd()));
			if (temp.getCategory() == 3)
				map.put(temp,oService.getProductById(temp.getProd()));
		}
		return map;
	}
}
