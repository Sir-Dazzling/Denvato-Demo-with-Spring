package models;

public class CardDetails 
{
	private int card_id;
	private String cardname;
	private String cardnumber;
	private int cvv;
	private String exp_date;
	
	
	public CardDetails() 
	{
		//Default constructor
	}


	public CardDetails(int card_id, String cardname, String cardnumber, int cvv, String exp_date) {
		super();
		this.card_id = card_id;
		this.cardname = cardname;
		this.cardnumber = cardnumber;
		this.cvv = cvv;
		this.exp_date = exp_date;
	}


	public CardDetails(String cardname, String cardnumber, int cvv, String exp_date) {
		super();
		this.cardname = cardname;
		this.cardnumber = cardnumber;
		this.cvv = cvv;
		this.exp_date = exp_date;
	}


	public int getCard_id() {
		return card_id;
	}


	public void setCard_id(int card_id) {
		this.card_id = card_id;
	}


	public String getCardname() {
		return cardname;
	}


	public void setCardname(String cardname) {
		this.cardname = cardname;
	}


	public String getCardnumber() {
		return cardnumber;
	}


	public void setCardnumber(String cardnumber) {
		this.cardnumber = cardnumber;
	}


	public int getCvv() {
		return cvv;
	}


	public void setCvv(int cvv) {
		this.cvv = cvv;
	}


	public String getExp_date() {
		return exp_date;
	}


	public void setExp_date(String exp_date) {
		this.exp_date = exp_date;
	}


	@Override
	public String toString() {
		return "CardDetails [card_id=" + card_id + ", cardname=" + cardname + ", cardnumber=" + cardnumber + ", cvv="
				+ cvv + ", exp_date=" + exp_date + "]";
	}


	

}
