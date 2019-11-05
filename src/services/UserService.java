package services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import models.User;
import models.UserDAO;

@Service
public class UserService 
{
	private UserDAO userdao;

	@Autowired
	public void setUserdao(UserDAO userdao) 
	{
		this.userdao = userdao;
	}
	
	//Creating Users and inserting them into the Database
	public void createUser(User user) 
	{
		userdao.createUser(user);
	}
	
	//Creating Users and inserting them into the Database(Admin)
	public void adminCreateUser(User user) 
	{
		userdao.adminCreateUser(user);
	}
	
	//Deleting User Account
	public void adminDeleteUserAccount(User user) 
	{
		userdao.deleteUser(user);
	}
	
	public void adminDeleteUserAccount2(User user) 
	{
		userdao.deleteUser2(user);
	}
	
}
