package models;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import validation.ValidEmail;

public class User
{

	@NotNull(message="Your Username is required")
	@Size(min=5,max=15, message="Username must be between 5 and 15 characters long")
	@Pattern(regexp="^\\w{8,}$",message="Username can only consist of numbers, letters and the underscore character.")
	private String username;
	
	@NotNull(message="Your Password is required")
	@Size(min=5,max=100, message="Password must be between 5 and 100 characters long")
	//@Pattern(regexp="^\\S+$")
	private String password;
	
	private boolean enabled = false;
	
	@NotNull
	@Size(min=1, message="Your Firstname is required")
	private String firstname;
	
	@NotNull
	@Size(min=1, message="Your Lastname is required")
	private String lastname;
	
	@NotNull
	private String gender;
	
	@ValidEmail(min=6)
	@NotNull
	@Email
	private String email;
	
	@NotNull
	@Size(min=11,max=11, message="Enter a Valid Phone Number")
	private String phonenumber;
	
	private String role;
	
	
	public User()
	{
		//Default Constructor
	}

	public User(String username, String password, boolean enabled, String firstname, String lastname, String gender,
			String email, String phonenumber, String role) 
	{
		this.username = username;
		this.password = password;
		this.enabled = enabled;
		this.firstname = firstname;
		this.lastname = lastname;
		this.gender = gender;
		this.email = email;
		this.phonenumber = phonenumber;
		this.role = role;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhonenumber() {
		return phonenumber;
	}

	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	@Override
	public String toString() 
	{
		return "User [username=" + username + ", password=" + password + ", enabled=" + enabled + ", firstname="
				+ firstname + ", lastname=" + lastname + ", gender=" + gender + ", email=" + email + ", phonenumber="
				+ phonenumber + ", role=" + role + "]";
	}

	
	

	
	
	
}
