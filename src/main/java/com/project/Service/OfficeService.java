package com.project.Service;

import java.io.IOException;
import java.util.Base64;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.project.Model.GardenProducts;
import com.project.Model.OfficeProducts;
import com.project.Repository.OfficeRepository;

@Service
public class OfficeService {

	@Autowired
	private OfficeRepository officeRep;
	
	public OfficeProducts saveOfficeProduct(OfficeProducts products)
	{
		return officeRep.save(products);
	}

	public List<OfficeProducts> saveProducts(List<OfficeProducts> products) {
		return officeRep.saveAll(products);
	}

	// getting products
	public List<OfficeProducts> getProducts() {
		return officeRep.findAll();
	}

	public OfficeProducts getProductById(int id) {
		return officeRep.findById(id).orElse(null);
	}

	// deleting products
	public void deleteProduct(int id) {
		officeRep.deleteById(id);
	}

}
