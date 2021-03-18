package com.example.erecruit.model;

public class ClientModel extends RegularUser {

	// FOR VALIDATION
	private String compName;
	private int clientId;
	private int noOfJobsPosted;
	private String officeAddress;

	public ClientModel() {
	}

	public ClientModel(int clientId, String username, long Cnic, long PhoneNumber, String email,String compName, String officeAddress) {
		super(username, Cnic, PhoneNumber, email);
		this.compName=compName;
		this.clientId=clientId;
		this.officeAddress=officeAddress;
	}

	public ClientModel(String compName, int noOfJobsPosted, String officeAddress) {
		super();
		this.compName = compName;
		this.noOfJobsPosted = noOfJobsPosted;
		this.officeAddress = officeAddress;
	}

	// GETTERS AND SETTERS
	public String getCompName() {
		return compName;
	}

	public void setCompName(String compName) {
		this.compName = compName;
	}
	
	
	public int getClientId() {
		return clientId;
	}

	public void setClientId(int clientId) {
		this.clientId = clientId;
	}

	public int getNoOfJobsPosted() {
		return noOfJobsPosted;
	}

	public void setNoOfJobsPosted(int noOfJobsPosted) {
		this.noOfJobsPosted = noOfJobsPosted;
	}

	//can post a job
	public void postJob(JobModel job) {
		//
	}
	
	public String getOfficeAddress() {
		return officeAddress;
	}

	public void setOfficeAddress(String officeAddress) {
		this.officeAddress = officeAddress;
	}
	
	
}
