package services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import models.CardDetailsDAO;

@Service
public class CardService 
{
	private CardDetailsDAO carddetailsdao;

	@Autowired
	public void setCarddetailsdao(CardDetailsDAO carddetailsdao) 
	{
		this.carddetailsdao = carddetailsdao;
	}
	
	public void checkCredentials(String cardname, String cardnumber, int cvv, String exp_date) 
	{
		carddetailsdao.checkCredentials(cardname, cardnumber, cvv, exp_date);
	}
	
}
