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
import com.project.Model.OfficeProducts;
import com.project.Service.OfficeService;
import com.project.helper.UrlManager;

@Controller
@RequestMapping
public class OfficeProductController {
	@Autowired
	private OfficeService officeService;
	@Autowired
	private UrlManager manager;

	@RequestMapping("/admin/addOfficeItem")
	public String addProduct(@ModelAttribute("prodModel") KitchenProducts products, HttpServletRequest request) {
		if (!manager.adminCheck(request))
			return "redirect:/";
		return "addOfficeItem";
	}

	@RequestMapping("/saveOfficeProduct")
	public String saveProduct(@ModelAttribute("prodModel") OfficeProducts products,
			@RequestParam("prodFile") MultipartFile file, Model model) throws IOException {
		products.setImage(Base64.getEncoder().encodeToString(file.getBytes()));
		officeService.saveOfficeProduct(products);
		return "redirect:/admin/tableView/office";
	}

	@RequestMapping("/admin/tableView/office")
	public String listProducts(Model model, HttpServletRequest request) {
		if (!manager.adminCheck(request))
			return "redirect:/";
		model.addAttribute("products", officeService.getProducts());
		return "officeView";
	}

	@RequestMapping("/Officeproducts/delete")
	public String deleteProduct(@RequestParam("productId") int id) {
		officeService.deleteProduct(id);
		return "redirect:/admin/tableView/office";
	}

	@RequestMapping("/Officeproducts/update")
	public String updateProduct(@RequestParam("productId") int id, Model model) {
		OfficeProducts product = officeService.getProductById(id);
		model.addAttribute("prodModel", product);
//		officeService.deleteProduct(id);
		return "updateOfficeForm";
	}

	@RequestMapping("/officePage")
	public String kitchenPage(Model model, HttpServletRequest request) {
		if (!manager.checkURL(request))
			return "redirect:/";
		List<OfficeProducts> products = officeService.getProducts();
		model.addAttribute("products", products);
		return "office-page";
	}
}
