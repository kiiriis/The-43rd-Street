package com.project.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.Model.Orders;
import com.project.Repository.OrderRepository;

@Service
public class OrderService {
	
	@Autowired
	private OrderRepository orderRep;
	
	public void saveOrder(Orders order)
	{
		orderRep.save(order);
	}
	
	public List<Orders> getOrders()
	{
		return orderRep.findAllByOrderByOrderDateDesc();
	}
	
	public List<Orders> findOrderByCust(int id)
	{
		return orderRep.findOrdersByCustomer(id);
	}
	
	public List<Orders> findOrdersSorted(int id)
	{
		return orderRep.findByCustomerOrderByOrderDateDesc(id);
	}
	

}
