package models;

public class Delivery 
{
	private int id;
	private String fullname;
	private String mobilenumber;
	private String email;
	private String town_city;
	private String delivery_destination_type;
	
	public Delivery() 
	{
		// TODO Auto-generated constructor stub
	}

	public Delivery(int id, String fullname, String mobilenumber, String email, String town_city,
			String delivery_destination_type)
	{
		this.id = id;
		this.fullname = fullname;
		this.mobilenumber = mobilenumber;
		this.email = email;
		this.town_city = town_city;
		this.delivery_destination_type = delivery_destination_type;
	}

	public Delivery(String fullname, String mobilenumber, String email, String town_city,
			String delivery_destination_type) 
	{
		this.fullname = fullname;
		this.mobilenumber = mobilenumber;
		this.email = email;
		this.town_city = town_city;
		this.delivery_destination_type = delivery_destination_type;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getMobilenumber() {
		return mobilenumber;
	}

	public void setMobilenumber(String mobilenumber) {
		this.mobilenumber = mobilenumber;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTown_city() {
		return town_city;
	}

	public void setTown_city(String town_city) {
		this.town_city = town_city;
	}

	public String getDelivery_destination_type() {
		return delivery_destination_type;
	}

	public void setDelivery_destination_type(String delivery_destination_type) {
		this.delivery_destination_type = delivery_destination_type;
	}

	@Override
	public String toString() 
	{
		return "Delivery [id=" + id + ", fullname=" + fullname + ", mobilenumber=" + mobilenumber + ", email=" + email
				+ ", town_city=" + town_city + ", delivery_destination_type=" + delivery_destination_type + "]";
	}
	
	
	
}
