package controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import models.Product;
import models.User;
import services.ProductService;

@Controller
public class PagesController 
{
	private ProductService productservice;
	
	@Autowired
	public void setProductservice(ProductService productservice) 
	{
		this.productservice = productservice;
	}

	
	//Redirecting Authenticated User to HomePage
	@RequestMapping(value = "/homepage**", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView homePage(Model model2) 
	{
		List<Product> product = productservice.getTrendingProducts();
		model2.addAttribute("product",product);
		
		ModelAndView model = new ModelAndView();
		model.setViewName("homepage");

		return model;

	}
	
	//Redirecting User to see all Products
	@RequestMapping("/allProducts")
	public String showAllProducts(Model model) 
	{
		try 
		{
			//Retrieving from  the database
			List<Product> product = productservice.getProducts();
			model.addAttribute("product",product);
			
			System.out.println(product);
		}
		catch(DataAccessException e) 
		{
			return "error";
		}
		return "all_products";
	}
	
	//Redirecting user to see Shoes
	@RequestMapping("/allShoes")
	public String showAllShoes(Model model) 
	{
		try 
		{
			//Retrieving shoes from database
			List<Product> product = productservice.getShoes();
			model.addAttribute("product",product);
			
			System.out.println(product);
			
		}
		catch(DataAccessException e) 
		{
			return "error";
		}
		
	
	
		return "shoes";
	}
	
	
	//Redirecting user to see Clothes
		@RequestMapping("/allClothes")
		public String showAllClothes(Model model) 
		{
			try 
			{
				//Retrieving shoes from database
				List<Product> product = productservice.getClothes();
				model.addAttribute("product",product);
				
				System.out.println(product);
				
			}
			catch(DataAccessException e) 
			{
				return "error";
			}
			
			return "clothes";
		}
		
		//Redirecting user to see Caps/Hats
				@RequestMapping("/allCaps_Hats")
				public String showAllCaps(Model model) 
				{
					try 
					{
						//Retrieving shoes from database
						List<Product> product = productservice.getCaps();
						model.addAttribute("product",product);
						
						System.out.println(product);
						
					}
					catch(DataAccessException e) 
					{
						return "error";
					}
					
					return "caps";
				}
				
				//Redirecting user to see Watches
				@RequestMapping("/allWatches")
				public String showAllWatches(Model model) 
				{
					try 
					{
						//Retrieving shoes from database
						List<Product> product = productservice.getWatches();
						model.addAttribute("product",product);
						
						System.out.println(product);
						
					}
					catch(DataAccessException e) 
					{
						return "error";
					}
					
					return "watches";
				}
}
