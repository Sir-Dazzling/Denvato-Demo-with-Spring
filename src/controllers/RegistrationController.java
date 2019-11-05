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

import models.User;
import services.UserService;

@Controller
public class RegistrationController 
{
	private UserService userservice;

	@Autowired
	public void setUserservice(UserService userservice) 
	{
		this.userservice = userservice;
	}

	//Redirecting to Register Page
	@RequestMapping("/signup")
	public String showRegisterPage(Model model, User user) 
	{
		model.addAttribute("user", new User());
		
		model.addAttribute("user",user);
		
		//Enabling Role of User
		user.setRole("user");
		user.setEnabled(true);
		return "register";
	}
	
	//Inserting User Details to database
	@RequestMapping(value="/registerUser", method=RequestMethod.POST)
	public String registerUser(Model model, @Valid User user, BindingResult result) 
	{		
		if(result.hasErrors()) 
		{
			
			System.out.println("Form does not Validate");
			
			List<ObjectError> errors  = result.getAllErrors();
			
			for(ObjectError error : errors) 
			{
				System.out.println(error.getDefaultMessage());
			}
			
			//To display error message on page.
			
			model.addAttribute("error","There were errors with your Registration Form");
			
			return "register";
		}
		
		else 
		{
			
			//Enabling Role of User
			user.setRole("user");
			user.setEnabled(true);
			
			//To check if a user name exists already in the Database.
			try 
			{
				userservice.createUser(user);
			} 
			catch (DuplicateKeyException e) 
			{
				System.out.println(e.getClass());
				result.rejectValue("username", "DuplicateKey.user.username", "This username already exists");
				model.addAttribute("error","There were errors with your Registration Form");
				return "register";
			}
			
			System.out.println("Form Validated");
			
			
			model.addAttribute("msg","Account Created Sucessfully");
			System.out.println(user);
			return "login";
		}
		
		
		
	}
	
}
