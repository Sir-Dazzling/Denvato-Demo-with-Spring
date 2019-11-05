package controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import models.User;

@Controller
public class LoginController
{
	
	//To display Firstpage which is Login Page
	@RequestMapping("/")
	public String showLoginPage(Model model,User user) 
	{
		model.addAttribute("user", new User());
		model.addAttribute("user",user);
		
		//Enabling Role of User
		user.setRole("user");
		user.setEnabled(true);
	
		return "login";
	}
	
	//Authenticating Users via Login Form
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout,HttpServletRequest request) 
	{

		ModelAndView model = new ModelAndView();
		if (error != null) 
		{
			model.addObject("error", "Invalid username and password!");
		}

		if (logout != null) 
		{
			model.addObject("msg", "You've been logged out successfully.");
			HttpSession session = request.getSession();
			session.removeAttribute("username");
			session.invalidate();
		}
			model.setViewName("login");
			return model;

	}
	
	/*Redirecting Authenticated user to Admin Page*/
	@RequestMapping(value = "/admin**", method = RequestMethod.GET)
	public ModelAndView adminPage(Model model2) 
	{	
		
		ModelAndView model = new ModelAndView();
		model.setViewName("admin");
		return model;

	}
	
		//for 403 access denied page
		@RequestMapping(value = "/403", method = RequestMethod.GET)
		public ModelAndView accesssDenied()
		{

			ModelAndView model = new ModelAndView();
			
			//check if user is login
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			if (!(auth instanceof AnonymousAuthenticationToken)) 
			{
				UserDetails userDetail = (UserDetails) auth.getPrincipal();
				System.out.println(userDetail);
			
				model.addObject("username", userDetail.getUsername());
				
			}
			
			model.setViewName("403");
			return model;

		}
	
		
		
		
		
}
