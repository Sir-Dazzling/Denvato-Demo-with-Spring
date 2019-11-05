package models;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Component;

@Component
public class DeliveryDAO 
{
	NamedParameterJdbcTemplate jdbc;

			//Setting DataSource
			@Autowired
			public void setDataSource(DataSource jdbc) 
			{
				this.jdbc = new NamedParameterJdbcTemplate(jdbc);
			}

			@Autowired
			public DeliveryDAO() 
			{
				
			}
	
			//Adding New Delivery Details
			public boolean insertDeliveryDetails(Delivery delivery) 
			{
				MapSqlParameterSource params = new MapSqlParameterSource();
				params.addValue("id", delivery.getId());
				params.addValue("fullname", delivery.getFullname());
				params.addValue("mobilenumber", delivery.getMobilenumber());
				params.addValue("email", delivery.getEmail());
				params.addValue("town_city", delivery.getTown_city());
				params.addValue("delivery_destination_type", delivery.getDelivery_destination_type());
				
				//to return true/false
				return jdbc.update("insert into delivery_details(fullname,mobilenumber,email,town_city,delivery_destination_type) values(:fullname,:mobilenumber,:email,:town_city,:delivery_destination_type)", params) == 1 ;
			}
	
}
