package controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import models.Delivery;
import services.DeliveryService;

@Controller
public class CartCheckoutController 
{

	private DeliveryService deliveryservice;
	
	
	
	@Autowired
	public void setDeliveryservice(DeliveryService deliveryservice) 
	{
		this.deliveryservice = deliveryservice;
	}

	//Redirecting Authenticated User to Checkout Page
	@RequestMapping("/check_out")
	public String showCheckOutPage(Model model, Delivery delivery) 
	{
		model.addAttribute("delivery", new Delivery());
		
		model.addAttribute("delivery",delivery);
		
		return "checkout";
	}
		
	//Inserting Delivery Details into database
	@RequestMapping(value="/insertDeliveryDetails", method=RequestMethod.POST)
	public String insertDeliveryDetails(Model model,  @Valid Delivery delivery, BindingResult result) 
	{
		//To check if a product details exists already in the Database.
		try 
		{
			deliveryservice.insertDeliveryDetails(delivery);
			model.addAttribute("delivery",delivery);
			
			System.out.println(delivery);
			
			return "payment";
		} 
		catch(Exception e)
		{
			System.out.println(e.getClass());
			model.addAttribute("error","There were errors with your  Delivery Form");
			return "checkout";
		}
		
	}
	
}
