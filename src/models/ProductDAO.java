package models;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Component;

@Component
public class ProductDAO 
{

	NamedParameterJdbcTemplate jdbc;

		//Setting DataSource
		@Autowired
		public void setDataSource(DataSource jdbc) 
		{
			this.jdbc = new NamedParameterJdbcTemplate(jdbc);
		}

		
		
		@Autowired
		public ProductDAO() 
		{
			System.out.println("The ProductDAO has been created successfully");
		}
		
		//Adding New Product
		public boolean createNewProduct(Product product) 
		{
			MapSqlParameterSource params = new MapSqlParameterSource();
			params.addValue("product_id", product.getProductid());
			params.addValue("product_name", product.getProductname());
			params.addValue("category", product.getCategory());
			params.addValue("price", product.getPrice());
			params.addValue("quantity", product.getQuantity());
			params.addValue("picture", product.getPicture());
			params.addValue("trending", product.getTrending());
			params.addValue("rating", product.getRating());
			params.addValue("create_date", product.getProductdate());
			
			//to return true/false
			return jdbc.update("insert into products(product_id,product_name,category,price,quantity,picture,trending,rating,create_date) values(:product_id,:product_name,:category,:price,:quantity,:picture,:trending,:rating,:create_date)", params) == 1 ;
		}
		
		//Modifying/Updating Product Details in Database
		public boolean modifyProductDetails(Product product) 
		{
			MapSqlParameterSource params = new MapSqlParameterSource();
			params.addValue("product_id", product.getProductid());
			params.addValue("product_name", product.getProductname());
			params.addValue("category", product.getCategory());
			params.addValue("price", product.getPrice());
			params.addValue("quantity", product.getQuantity());
			params.addValue("picture", product.getPicture());
			params.addValue("trending", product.getTrending());
			params.addValue("rating", product.getRating());
			params.addValue("create_date", product.getProductdate());
			
			//to return true/false
			return jdbc.update("update products set  product_id=:product_id,productname=:productname, category=:category, price=:price,quantity=:quantity,picture=:picture,trending=:trending,rating=:rating,create_date=:create_date WHERE product_id=:product_id  ", params) == 1 ;
		}
		
		//Deleting a product from Database
		public boolean deleteProduct(Product product) 
		{
			MapSqlParameterSource params = new MapSqlParameterSource();
			params.addValue("product_id",product.getProductid() );
			
			//to return true/false
			return jdbc.update("delete FROM products WHERE product_id=:product_id", params) == 1;
		}
		
		//Retrieving Products from database
		public List<Product> getProducts()
		{
			return	jdbc.query("Select * FROM products",new RowMapper<Product>() 
			{
				

				public Product mapRow(ResultSet rs, int rowNum) throws SQLException
				{
					Product product = new Product();
					product.setProductid(rs.getString("product_id"));
					product.setProductname(rs.getString("product_name"));
					product.setCategory(rs.getString("category"));
					product.setPrice(rs.getDouble("price"));
					product.setQuantity(rs.getInt("quantity"));
					product.setPicture(rs.getString("picture"));
					product.setTrending(rs.getBoolean("trending"));
					product.setRating(rs.getFloat("rating"));
					product.setProductdate(rs.getString("create_date"));
					
					
					return product;
					
				}
				
			});
			
		}
		
		//Retrieving Trending Products from Database
		public List<Product> getTrendingProducts()
		{
			return	jdbc.query("Select * FROM products WHERE trending = 1",new RowMapper<Product>() 
			{
				

				public Product mapRow(ResultSet rs, int rowNum) throws SQLException
				{
					Product product = new Product();
					product.setProductid(rs.getString("product_id"));
					product.setProductname(rs.getString("product_name"));
					product.setCategory(rs.getString("category"));
					product.setPrice(rs.getDouble("price"));
					product.setQuantity(rs.getInt("quantity"));
					product.setPicture(rs.getString("picture"));
					product.setTrending(rs.getBoolean("trending"));
					product.setRating(rs.getFloat("rating"));
					product.setProductdate(rs.getString("create_date"));
					
					
					return product;
					
				}
				
			});
			
		}
		
		//Retrieving only Clothing Products from database.
		public List<Product> getClothingProducts()
		{
			
			
			return	jdbc.query("Select * FROM products WHERE category = 'clothes'",new RowMapper<Product>() 
			{
				

				public Product mapRow(ResultSet rs, int rowNum) throws SQLException
				{
					Product product = new Product();
					product.setProductid(rs.getString("product_id"));
					product.setProductname(rs.getString("product_name"));
					product.setCategory(rs.getString("category"));
					product.setPrice(rs.getDouble("price"));
					product.setQuantity(rs.getInt("quantity"));
					product.setPicture(rs.getString("picture"));
					product.setTrending(rs.getBoolean("trending"));
					product.setRating(rs.getFloat("rating"));
					product.setProductdate(rs.getString("create_date"));
					
					
					return product;
					
				}
				
			});
			
		}
	
		//Retrieving Shoe Products
		public List<Product> getShoeProducts()
		{
			
			return	jdbc.query("Select * FROM products WHERE category = 'shoes'",new RowMapper<Product>() 
			{
				

				public Product mapRow(ResultSet rs, int rowNum) throws SQLException
				{
					Product product = new Product();
					product.setProductid(rs.getString("product_id"));
					product.setProductname(rs.getString("product_name"));
					product.setCategory(rs.getString("category"));
					product.setPrice(rs.getDouble("price"));
					product.setQuantity(rs.getInt("quantity"));
					product.setPicture(rs.getString("picture"));
					product.setTrending(rs.getBoolean("trending"));
					product.setRating(rs.getFloat("rating"));
					product.setProductdate(rs.getString("create_date"));
					
					
					return product;
					
				}
				
			});
			
		}
		
		
		//Retrieving Cap/Hat Products
				public List<Product> getCapProducts()
				{
					return	jdbc.query("Select * FROM products WHERE category = 'caps' ",new RowMapper<Product>() 
					{
								

						public Product mapRow(ResultSet rs, int rowNum) throws SQLException
						{
							Product product = new Product();
							product.setProductid(rs.getString("product_id"));
							product.setProductname(rs.getString("product_name"));
							product.setCategory(rs.getString("category"));
							product.setPrice(rs.getDouble("price"));
							product.setQuantity(rs.getInt("quantity"));
							product.setPicture(rs.getString("picture"));
							product.setTrending(rs.getBoolean("trending"));
							product.setRating(rs.getFloat("rating"));
							product.setProductdate(rs.getString("create_date"));
									
									
							return product;
									
						}
								
					});
							
						}
		
		//Retrieving Shoe Products
		public List<Product> getWatchProducts()
		{
			return	jdbc.query("Select * FROM products WHERE category = 'watches' ",new RowMapper<Product>() 
			{
						

				public Product mapRow(ResultSet rs, int rowNum) throws SQLException
				{
					Product product = new Product();
					product.setProductid(rs.getString("product_id"));
					product.setProductname(rs.getString("product_name"));
					product.setCategory(rs.getString("category"));
					product.setPrice(rs.getDouble("price"));
					product.setQuantity(rs.getInt("quantity"));
					product.setPicture(rs.getString("picture"));
					product.setTrending(rs.getBoolean("trending"));
					product.setRating(rs.getFloat("rating"));
					product.setProductdate(rs.getString("create_date"));
							
							
					return product;
							
				}
						
			});
					
				}
		
}
