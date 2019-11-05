package models;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Component
public class UserDAO 
{
NamedParameterJdbcTemplate jdbc;
	
	//Setting DataSource
		@Autowired
		public void setDataSource(DataSource jdbc) 
		{
			this.jdbc = new NamedParameterJdbcTemplate(jdbc);
		}
		
		@Autowired
		public UserDAO() 
		{
			System.out.println("The UserDAO for Denvato Online has been successfully created");
		}
		
		//Query to insert new users into the database
		@Transactional
		public boolean createUser(User user) 
		{
			BeanPropertySqlParameterSource params = new BeanPropertySqlParameterSource(user);
			
			jdbc.update("INSERT INTO USERS(username,password,enabled,firstname,lastname,gender,email,phonenumber) VALUES(:username, :password, :enabled, :firstname, :lastname, :gender, :email, :phonenumber)", params);
			
			return jdbc.update("INSERT INTO USER_ROLES (username, role) VALUES(:username, :role)", params) == 1;
		}
		
		@Transactional
		public boolean adminCreateUser(User user) 
		{
			BeanPropertySqlParameterSource params = new BeanPropertySqlParameterSource(user);
			
			jdbc.update("INSERT INTO USERS(username,password,enabled,firstname,lastname,gender,email,phonenumber) VALUES(:username, :password, :enabled, :firstname, :lastname, :gender, :email, :phonenumber)", params);
			
			return jdbc.update("INSERT INTO USER_ROLES (username, role) VALUES(:username, :role)", params) == 1;
		}
		
			  //Deleting a user from Database
				public boolean deleteUser(User user) 
				{
					MapSqlParameterSource params = new MapSqlParameterSource();
					params.addValue("username",user.getUsername());
					
					//to return true/false
					return jdbc.update("delete FROM users WHERE username=:username", params) == 1;
				}
				
				@Transactional
				public boolean deleteUser2(User user)
				{	
					MapSqlParameterSource params = new MapSqlParameterSource();
					params.addValue("username",user.getUsername());
					
					//to return true/false
					return jdbc.update("delete FROM user_roles WHERE username=:username", params) == 1;
				}
}
