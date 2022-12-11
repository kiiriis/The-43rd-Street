package com.project.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.Model.Cart;
import com.project.Repository.CartRepository;

@Service
public class CartService {
	@Autowired
	private CartRepository cartRepo;

	public void saveCart(Cart cart) {
		cartRepo.save(cart);
	}

	public List<Cart> getCarts() {
		return cartRepo.findAll();
	}

	public Cart getCartById(int id) {
		return cartRepo.findById(id).orElse(null);
	}

	public void deleteCart(int id) {
		cartRepo.deleteById(id);
	}

	public List<Cart> getItems() {
		return cartRepo.findAll();
	}
	
	public List<Cart> getItemsByCustId(int id)
	{
		return cartRepo.findCartByCust(id);
	}
	
	public void deleteCartByCustom(Cart cart)
	{
		cartRepo.delete(cart);
	}
	
	public Cart getCartCustom(int id, int p_id, int cat)
	{
		return cartRepo.findCartByCustAndProdAndCategory(id, p_id, cat);
	}
	public List<Cart> findCartsByCustAndOrder(int custId , int orderId)
	{
		return cartRepo.findCartByCustAndOrderId(custId, orderId);
	}
}
