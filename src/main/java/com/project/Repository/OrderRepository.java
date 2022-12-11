package com.project.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.project.Model.Orders;

@Repository
public interface OrderRepository extends JpaRepository<Orders, Integer> {
	public List<Orders> findOrdersByCustomer(int id);
	public List<Orders> findByCustomerOrderByOrderDateDesc(int id);
	public List<Orders> findAllByOrderByOrderDateDesc();
}
