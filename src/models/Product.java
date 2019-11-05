package models;

import javax.validation.constraints.NotNull;

public class Product 
{
	@NotNull(message="The Product Id is Needed")
	private String productid;
	
	@NotNull(message="The Product Name is Needed")
	private String productname;
	
	@NotNull(message="The Product Category is Needed")
	private String category;
	
	@NotNull(message="The Product Price is Needed")
	private double price;
	
	@NotNull(message="The Product Quantity is Needed")
	private int quantity;
	
	@NotNull(message="The Product Picture Name is Needed")
	private String picture;
	
	@NotNull(message="The Product Trending status  is Needed")
	private Boolean trending;
	
	@NotNull(message="The Product Rating is Needed")
	private float rating;
	
	@NotNull(message="The Product Date is Needed")
	private String productdate;
	
	
	public Product() 
	{
		// Default Constructor
	}


	public Product(String productid, String productname, String category, double price, int quantity, String picture,
			Boolean trending, float rating, String productdate) 
	{;
		this.productid = productid;
		this.productname = productname;
		this.category = category;
		this.price = price;
		this.quantity = quantity;
		this.picture = picture;
		this.trending = trending;
		this.rating = rating;
		this.productdate = productdate;
	}


	public String getProductid() {
		return productid;
	}


	public void setProductid(String productid) {
		this.productid = productid;
	}


	public String getProductname() {
		return productname;
	}


	public void setProductname(String productname) {
		this.productname = productname;
	}


	public String getCategory() {
		return category;
	}


	public void setCategory(String category) {
		this.category = category;
	}


	public double getPrice() {
		return price;
	}


	public void setPrice(double price) {
		this.price = price;
	}


	public int getQuantity() {
		return quantity;
	}


	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}


	public String getPicture() {
		return picture;
	}


	public void setPicture(String picture) {
		this.picture = picture;
	}


	public Boolean getTrending() {
		return trending;
	}


	public void setTrending(Boolean trending) {
		this.trending = trending;
	}


	public float getRating() {
		return rating;
	}


	public void setRating(float rating) {
		this.rating = rating;
	}


	public String getProductdate() {
		return productdate;
	}


	public void setProductdate(String productdate) {
		this.productdate = productdate;
	}


	@Override
	public String toString() 
	{
		return "Product [productid=" + productid + ", productname=" + productname + ", category=" + category
				+ ", price=" + price + ", quantity=" + quantity + ", picture=" + picture + ", trending=" + trending
				+ ", rating=" + rating + ", productdate=" + productdate + "]";
	}
	
	

	

	
	
	
	
	
	
	
	
	
}
