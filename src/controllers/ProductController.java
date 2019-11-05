package controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import models.Product;
import services.ProductService;

@Controller
public class ProductController 
{
	private ProductService productservice;


	@Autowired
	public void setProductservice(ProductService productservice) 
	{
		this.productservice = productservice;
	}

	//Inserting Product Details to database
	@RequestMapping(value="/docreate", method=RequestMethod.POST)
	public String doCreate(Model model, @Valid Product product, BindingResult result) 
	{
		if(result.hasErrors()) 
		{
			System.out.println("Form does not Validate");
			
			List<ObjectError> errors = result.getAllErrors();
			
			for(ObjectError error : errors) 
			{
				System.out.println(error.getDefaultMessage());
			}
			
			//To display error message on page.
			model.addAttribute("error","There were errors with your Product Addition Form");
			return "product_operations";
		}
		
		else 
		{
			//To check if a product details exists already in the Database.
			try 
			{
				productservice.createNewProduct(product);
				model.addAttribute("product",product);
				
				System.out.println(product);
				
				return "productCreated";
			} 
			catch(DuplicateKeyException e)
			{
				System.out.println(e.getClass());
				result.rejectValue("productid", "DuplicateKey.product.productid", "This Product Id already exists");
				result.rejectValue("productname", "DuplicateKey.product.productname", "This Product Name already exists");
				result.rejectValue("picture", "DuplicateKey.product.picture", "This Picture already exists");
				model.addAttribute("error","There were errors with your Product Addition Form");
				return "product_operations";
			}
		}
		
	}
	
	//Updating Product Details in Database
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public String modifyProduct(Model model, @Valid Product product, BindingResult result, @RequestParam("productid") String product_id) 
	{
	
		
			//To check if Product entered isn't found in Database
			try 
			{
				model.addAttribute("product",product);
				productservice.modifyProduct(product);
				
				System.out.println(product);
				
				return "modify_products";
			}
			catch(Exception e) 
			{
				System.out.println(e.getClass());
				model.addAttribute("error","There were errors with your Product Update Form or the Product you inputed for isnt found in the database");
				
				return "modify_products";
			}
			
		}
		 
	
	//Updating Product Details in Database
		@RequestMapping(value="/delete", method=RequestMethod.POST)
		public String deleteProduct(Model model, @Valid Product product, BindingResult result) 
		{
			
			try 
			{
				model.addAttribute("product",product);
				productservice.deleteProduct(product);
				model.addAttribute("msg", "Product Deleted Successfully");
				
				System.out.println(product);
				
				return "delete_product";
			}
			catch(Exception e) 
			{
				System.out.println(e.getClass());
				model.addAttribute("error","There were errors with your Product Delete Form or the Product you inputed for isnt found in the database");
				
				return "delete_product";
			}
			
		}
   
}
