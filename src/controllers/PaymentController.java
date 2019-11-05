package controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import models.Delivery;
import services.CardService;

@Controller
public class PaymentController 
{
	private CardService cardservice;
	
	//Redirecting Authenticated User to Payment Page
	@RequestMapping("/pay")
	public String showPaymentPage(Model model, Delivery delivery) 
	{
		model.addAttribute("delivery", new Delivery());
		
		model.addAttribute("delivery",delivery);
		
		return "payment";
	}
	
	
	//Redirecting Authenticated User to Receipt Page
	@RequestMapping("/receipt")
	public String showReceiptPage(Model model, Delivery delivery) 
	{
		model.addAttribute("delivery", new Delivery());
		
		model.addAttribute("delivery",delivery);
		
		return "receipt";
	}
	
	@RequestMapping(value="/checkCredentials", method=RequestMethod.GET)
	public String showPosts(Model model,@RequestParam("cardname") String cardname,@RequestParam("cardnumber") String cardnumber,@RequestParam("cvv") int cvv,@RequestParam("exp_date") String exp_date) 
	{
		//Checking Credentials
		try 
		{
			cardservice.checkCredentials(cardname, cardnumber, cvv, exp_date);
			
			return "receipt";
		} 
		catch(Exception e) 
		{
			System.out.println(e.getClass());
			model.addAttribute("error","There were errors with your  purchase");
			
			return "payment";
		}
		
		
	}
	
	
}
