package com.example.erecruit.model;

public class RegularUser{

	//attributes
	private long CNIC;
	private String username;
	private String password;
	private String email;
	private long PhoneNumber;
	
	//constructors
	public RegularUser() {
		
	}
	
	//parametrized constructor
	public RegularUser(String username, long cnic, long PhoneNumber, String email){
		this.username=username;
		this.CNIC=cnic;
		this.PhoneNumber=PhoneNumber;
		this.email=email;
	}
	//setters and getters
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
	
	//getters and setters
	public long getCNIC() {
		return CNIC;
	}

	public void setCNIC(long cNIC) {
		CNIC = cNIC;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public long getPhoneNumber() {
		return PhoneNumber;
	}

	public void setPhoneNumber(long phoneNumber) {
		PhoneNumber = phoneNumber;
	}

	

}
