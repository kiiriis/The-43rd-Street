package com.project.Controllers;

import java.io.IOException;
import java.util.Base64;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.project.Model.KitchenProducts;
import com.project.Service.KitchenService;
import com.project.helper.UrlManager;

@Controller
@RequestMapping
public class KitchenProductController {

	@Autowired
	private KitchenService kitchService;
	@Autowired
	private UrlManager manager;

	@RequestMapping("/admin/addKitchenItem")
	public String addProduct(@ModelAttribute("prodModel") KitchenProducts products, HttpServletRequest request) {
		if (!manager.adminCheck(request))
			return "redirect:/";
		return "addKitchenItem";
	}

	@RequestMapping("/saveKitchenProduct")
	public String saveKitchenProduct(@ModelAttribute("prodModel") KitchenProducts products,
			@RequestParam("prodFile") MultipartFile file, Model model) throws IOException {
		products.setImage(Base64.getEncoder().encodeToString(file.getBytes()));
		kitchService.saveKitchenProduct(products);
		return "redirect:/admin/tableView/kitchen";
	}

	@RequestMapping("/admin/tableView/kitchen")
	public String listProducts(Model model, HttpServletRequest request) {
		if (!manager.adminCheck(request))
			return "redirect:/";
		model.addAttribute("products", kitchService.getProducts());
		return "kitchenView";
	}

	@RequestMapping("/Kitchenproducts/delete")
	public String deleteProduct(@RequestParam("productId") int id) {
		kitchService.deleteProduct(id);
		return "redirect:/admin/tableView/kitchen";
	}

	@RequestMapping("/Kitchenproducts/update")
	public String updateProduct(@RequestParam("productId") int id, Model model) {
		KitchenProducts product = kitchService.getProductById(id);
		model.addAttribute("prodModel", product);
//		kitchService.deleteProduct(id);
		return "updateKitchenForm";
	}

	@RequestMapping("/kitchenPage")
	public String kitchenPage(Model model, HttpServletRequest request) {
		if (!manager.checkURL(request))
			return "redirect:/";
		List<KitchenProducts> products = kitchService.getProducts();
		model.addAttribute("products", products);
		return "kitchen-page";
	}
}
