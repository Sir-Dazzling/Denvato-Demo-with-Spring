package models;

import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Component;

@Component
public class CardDetailsDAO
{
	NamedParameterJdbcTemplate jdbc;
	
	//Setting DataSource
	@Autowired
	public void setDataSource(DataSource jdbc) 
	{
		this.jdbc = new NamedParameterJdbcTemplate(jdbc);
	}

	@Autowired
	public CardDetailsDAO() 
	{
		// Default Constructor
	}
	
	//checking for Card Details in Database
	public CardDetails checkCredentials(String cardname, String cardnumber, int cvv, String exp_date) 
	{
		MapSqlParameterSource params = new MapSqlParameterSource();
		params.addValue("cardname", cardname);
		params.addValue("cardnumber", cardnumber);
		params.addValue("cvv", cvv);
		params.addValue("exp_date", exp_date);
		
		 return	jdbc.queryForObject("Select * FROM card_details WHERE email=:email", params, new RowMapper<CardDetails>() 
			{
			 	public CardDetails mapRow(ResultSet rs, int rowNum) throws SQLException
			 		{
			 			CardDetails carddetails = new CardDetails();
			 			carddetails.setCardname(rs.getString("cardname"));
			 			carddetails.setCardnumber(rs.getString("cardnumber"));
			 			carddetails.setCvv(rs.getInt("cvv"));
			 			carddetails.setExp_date(rs.getString("exp_date"));
			 			
			 			return carddetails;
				}
			});
	} 
	
}
