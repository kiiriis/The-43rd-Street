package com.project.Service;

import java.io.IOException;
import java.util.Base64;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.project.Model.GardenProducts;
import com.project.Model.KitchenProducts;
import com.project.Repository.KitchenRepository;

@Service
public class KitchenService {
	@Autowired
	private KitchenRepository kitchenRep;

	public KitchenProducts saveKitchenProduct(KitchenProducts products)
	{
		return kitchenRep.save(products);
	}

	public List<KitchenProducts> saveProducts(List<KitchenProducts> products) {
		return kitchenRep.saveAll(products);
	}
	

	// getting products
	public List<KitchenProducts> getProducts() {
		return kitchenRep.findAll();
	}

	public KitchenProducts getProductById(int id) {
		return kitchenRep.findById(id).orElse(null);
	}

	// deleting products
	public void deleteProduct(int id) {
		kitchenRep.deleteById(id);
	}
}
