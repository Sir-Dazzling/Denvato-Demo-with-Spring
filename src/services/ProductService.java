package services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import models.Product;
import models.ProductDAO;

@Service
public class ProductService 
{
	private ProductDAO productdao;
	
	@Autowired
	public void setProductdao(ProductDAO productdao) 
	{
		this.productdao = productdao;
	}
	
	public void createNewProduct(Product product) 
	{
		productdao.createNewProduct(product);
	}
	
	public void modifyProduct(Product product) 
	{
		productdao.modifyProductDetails(product);
	}
	
	public void deleteProduct(Product product) 
	{
		productdao.deleteProduct(product);
	}
	
	public List<Product> getProducts()
	{
		return productdao.getProducts();
	}
	
	public List<Product>getTrendingProducts()
	{
		return productdao.getTrendingProducts();
	}
	
	public List<Product>getShoes()
	{
		return productdao.getShoeProducts();
	}
	
	public List<Product>getClothes()
	{
		return productdao.getClothingProducts();
	}
	
	public List<Product>getCaps()
	{
		return productdao.getCapProducts();
	}
	
	
	public List<Product>getWatches()
	{
		return productdao.getWatchProducts();
	}
	
	
	
	
}
