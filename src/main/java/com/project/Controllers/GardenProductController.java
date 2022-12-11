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

import com.project.Model.GardenProducts;
import com.project.Model.KitchenProducts;
import com.project.Service.GardenService;
import com.project.helper.UrlManager;

@Controller
@RequestMapping
public class GardenProductController {

	@Autowired
	private GardenService gardenService;
	@Autowired
	private UrlManager manager;

	@RequestMapping("/admin/addGardenItem")
	public String addProduct(@ModelAttribute("prodModel") KitchenProducts products, HttpServletRequest request) {
		if (!manager.adminCheck(request))
			return "redirect:/";
		return "addGardenItem";
	}

	@RequestMapping(path = "/saveGardenProduct")
	public String saveProduct(@ModelAttribute("prodModel") GardenProducts products,
			@RequestParam("prodFile") MultipartFile file, Model model) throws IOException {
//		gardenService.saveProduct(file, products.getName(), products.getDescription(), products.getPrice());
		products.setImage(Base64.getEncoder().encodeToString(file.getBytes()));
		gardenService.saveGardenProduct(products);
		return "redirect:/admin/tableView/garden";
	}

	@RequestMapping("/admin/tableView/garden")
	public String listProducts(Model model, HttpServletRequest request) {
		if (!manager.adminCheck(request)) {
			return "redirect:/";
		}
		model.addAttribute("products", gardenService.getProducts());
		return "gardenView";
	}

	@RequestMapping("/Gardenproducts/delete")
	public String deleteProduct(@RequestParam("productId") int id) {
		gardenService.deleteProduct(id);
		return "redirect:/admin/tableView/garden";
	}

	@RequestMapping("/Gardenproducts/update")
	public String updateProduct(@RequestParam("productId") int id, Model model) {
		GardenProducts product = gardenService.getProductById(id);
		model.addAttribute("prodModel", product);
//		model.addAttribute("prodId", id);
//		gardenService.deleteProduct(id);
		return "updateGardenForm";
	}
	@RequestMapping("/gardenPage")
	public String kitchenPage(Model model, HttpServletRequest request) {
		if (!manager.checkURL(request))
			return "redirect:/";
		List<GardenProducts> products = gardenService.getProducts();
		model.addAttribute("products", products);
		return "garden-page";
	}

}
