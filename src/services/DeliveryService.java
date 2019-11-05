package services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import models.Delivery;
import models.DeliveryDAO;

@Service
public class DeliveryService 
{
	private DeliveryDAO deliverydao;

	@Autowired
	public void setDeliverydao(DeliveryDAO deliverydao) 
	{
		this.deliverydao = deliverydao;
	}
	
	public void insertDeliveryDetails(Delivery delivery) 
	{
		deliverydao.insertDeliveryDetails(delivery);
	}
	
}
