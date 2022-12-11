package com.project.Service;

import java.io.IOException;
import java.util.Base64;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.project.Model.GardenProducts;
import com.project.Repository.GardenRepository;

@Service
public class GardenService {
	@Autowired
	private GardenRepository gardenRep;

	
	public GardenProducts saveGardenProduct(GardenProducts products)
	{
		return gardenRep.save(products);
	}
	
	public List<GardenProducts> saveProducts(List<GardenProducts> products) {
		return gardenRep.saveAll(products);
	}

	// getting products
	public List<GardenProducts> getProducts() {
		return gardenRep.findAll();
	}

	public GardenProducts getProductById(int id) {
		return gardenRep.findById(id).orElse(null);
	}

	// deleting products
	public void deleteProduct(int id) {
		gardenRep.deleteById(id);
	}
}
