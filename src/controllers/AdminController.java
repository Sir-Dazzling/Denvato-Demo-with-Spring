package controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import models.Product;
import models.User;
import services.ProductService;
import services.UserService;

@Controller
public class AdminController 
{
private ProductService productservice;
private UserService userservice;
	
	
	
	@Autowired
	public void setUserservice(UserService userservice) 
	{
		this.userservice = userservice;
	}
	
	@Autowired
	public void setProductservice(ProductService productservice) 
	{
		this.productservice = productservice;
	}

		//Redirecting Admin to Products Operations Page
		@RequestMapping("/productOperations")
		public String showProductOperations(Model model, Product product) 
		{
			model.addAttribute("product", new Product());
			
			model.addAttribute("product", product);
			
			return "product_operations";
		}
		
		//To redirect Admin to Product Modification Page
		@RequestMapping("/modifyProductDetails")
		public String showModifyProductsPage(Model model, Product product) 
		{
			model.addAttribute("product", new Product());
			
			model.addAttribute("product", product);
			
			return  "modify_products";
		}
		
		//To redirect Admin to Product Deletion Page
		@RequestMapping("/deleteProduct")
		public String showDeletionPage(Model model, Product product) 
		{
			model.addAttribute("product", new Product());
			
			model.addAttribute("product", product);
			
			return "delete_product";
		}
		
		//Redirecting Admin to User Operations Page
		@RequestMapping("/userOperations")
		public String showUserOperations(Model model, User user) 
		{
			model.addAttribute("user", new User());
			
			model.addAttribute("user",user);
			
			//Enabling Role of User
			user.setRole("user");
			user.setEnabled(true);
			
			return "user_operations";
		}
		
		
				
		//Redirecting Admin to User Delete Page
		@RequestMapping("/deleteUserAccount")
		public String showUserDeletePage(Model model, User user) 
		{
			model.addAttribute("user", new User());
					
			model.addAttribute("user",user);
					
			//Enabling Role of User
			user.setRole("user");
			user.setEnabled(true);
					
			return "delete_user";
		}
		
		//Enabling Admin to insert user details into database
		//Inserting User Details to database
		@RequestMapping(value="/adminRegisterUser", method=RequestMethod.POST)
		public String registerUser(Model model, User user, BindingResult result) 
		{		
			
			//Enabling Role of User
			user.setRole("user");
			user.setEnabled(true);
			
			
			try 
			{
				userservice.adminCreateUser(user);
				
				model.addAttribute("msg","Account Created Sucessfully");
				System.out.println(user);
			} 
			catch(Exception e) 
			{
				System.out.println(e.getClass());
			}
			
		
			
			return  "user_operations";
		}
		
		
		
		@RequestMapping(value="/deleteUser", method=RequestMethod.POST)
		public String deleteUser(Model model,  User user, BindingResult result) 
		{		
			
			//Enabling Role of User
			user.setRole("user");
			user.setEnabled(true);
			
			
			try 
			{
				model.addAttribute("user",user);
				userservice.adminDeleteUserAccount2(user);
				userservice.adminDeleteUserAccount(user);
				
				
				model.addAttribute("msg","Account Deleted Sucessfully");
				System.out.println(user);
				
				return  "delete_user";
			} 
			catch(Exception e) 
			{
				System.out.println(e.getClass());
				model.addAttribute("error","Error deleting Account");
				
				return  "delete_user";
			}
			
		
			
			
		}
}
