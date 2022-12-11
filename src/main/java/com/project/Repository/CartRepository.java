package com.project.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.project.Model.Cart;

@Repository
public interface CartRepository extends JpaRepository<Cart, Integer> {
	public List<Cart> findCartByCust(int id);
	public Cart findCartByCustAndProdAndCategory(int id,int p_id,int p_cat);
	public List<Cart> findCartByCustAndOrderId(int custId,int orderId);
	public void deleteByCust(int id);
}
