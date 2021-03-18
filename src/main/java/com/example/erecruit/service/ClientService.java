package com.example.erecruit.service;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.example.erecruit.Database.DatabaseConfig;
import com.example.erecruit.controller.LoginController;
import com.example.erecruit.model.ClientModel;
import com.example.erecruit.model.JobModel;

public class ClientService {
	
	ResultSet verifiedClient;


	//verify the client credentials
	public boolean verifyClient(String username, String password) {
		
		try {
			DatabaseConfig db=new DatabaseConfig();
			
			PreparedStatement pst=(db.getConnection()).prepareStatement("select * from Client where username=?");
			pst.setString(1, username);
			verifiedClient=pst.executeQuery();
			
			if(!verifiedClient.next()) {
				return false; //check if the result is not empty
			}
			else if((verifiedClient.getString("password")).equals(password)) {
				return true; //verifying the password
			}
			
			return false;
			
			
		}
		catch(Exception e) {
			System.out.println(e);
			return false;
		}
	}
	
	
	//return the verifedClient username
	public String getVerifiedClientUsername(){
		try {
			return (this.verifiedClient).getString("username");
		}
		catch(Exception e) {
			System.out.println(e);
			return "";
		}
		
	}
	
	
	//to register a client
	public int registerClient(ClientModel client) {
		DatabaseConfig db=new DatabaseConfig();
		try {
		
			PreparedStatement ps=(db.getConnection()).prepareStatement("select * from Client where username=?");
			ps.setString(1, client.getUsername());
			verifiedClient=ps.executeQuery();
			
			if(!verifiedClient.next()) {
		    //check if the result is not empty so the username has not been used before
				if((Long.toString(client.getCNIC()).length())==13) {
					
					if((Long.toString(client.getPhoneNumber()).length())<=15) {
						
						ps=(db.getConnection()).prepareStatement("insert into Client(username,password,CNIC,PhoneNumber,email,compName,officeAddress)"
								+ "values (?,?,?,?,?,?,?)");
						ps.setString(1, client.getUsername());
						ps.setString(2,client.getPassword());
						ps.setString(3,Long.toString(client.getCNIC()));
						ps.setNString(4, Long.toString(client.getPhoneNumber()));
						ps.setString(5,client.getEmail());
						ps.setString(6,client.getCompName());
						ps.setString(7, client.getOfficeAddress());
						ps.executeUpdate();
						return 1; //verification and registration complete
						
					}
					else {
						return 4; //phone number not valid
					}

				}
				else {
					return 3; //cnic not valid
				}
			}
			else {
				return 2;//username already exists
			}
		}
		catch(Exception e) {
			System.out.println(e);
			return 0;
		}
	}

	public ArrayList<JobModel> getApprovedjobsforClient() throws SQLException { //gets approved jobs for the current user
		String currentUserName= LoginController.getUser().getUsername();
		//System.out.println("inside approved job method");
		//getting all jobs where the username is current users name
		DatabaseConfig db=new DatabaseConfig();
		PreparedStatement ps=db.getConnection().prepareStatement("select * from approvedjobs natural join client where username=?");
		ps.setString(1,currentUserName);

		ArrayList<JobModel> approved=new ArrayList<>();
		return getJobModels(ps, approved);
	}

	public ArrayList<JobModel> getDisapprovedjobsforClient() throws SQLException { //get disapproved jobs for the current user
		String currentUserName1= LoginController.getUser().getUsername();
		//getting all jobs where the username is current users name
		DatabaseConfig db=new DatabaseConfig();
		PreparedStatement ps=db.getConnection().prepareStatement("select * from disapprovedjobs natural join client where username=?");
		ps.setString(1,currentUserName1);

		ArrayList<JobModel> disapproved=new ArrayList<>();
		return getJobModels(ps, disapproved);
	}

	//get all the jobs this client has posted with statuses
	public ArrayList<JobModel> getAllJobsForTheClient(){
	
		try {
		String currentUserName= LoginController.getUser().getUsername();
		//getting all jobs where the username is current users name
		DatabaseConfig db=new DatabaseConfig();
		PreparedStatement ps=db.getConnection().prepareStatement("select * from jobClientRelation natural join AllJobs where clientId in (select clientId from Client where username=?)");
		ps.setString(1,currentUserName);

		ArrayList<JobModel> jbArray=new ArrayList<JobModel>();

			return getJobModels(ps, jbArray);
		}
		catch(Exception e) {
			System.out.println(e);
			return new ArrayList<JobModel>();
		}
		
	}

	private ArrayList<JobModel> getJobModels(PreparedStatement ps, ArrayList<JobModel> jbArray) throws SQLException {
		ResultSet rs=ps.executeQuery();

		while (rs.next()) {
			JobModel jb = new JobModel(rs.getInt("jobId"), rs.getString("jobPosition"), rs.getString("skillsRequired"), rs.getString("eduReq"), rs.getInt("expReq"), rs.getString("jobDescription"), rs.getTimestamp("DateWhenPosted"));
			jbArray.add(jb);
		}

		return jbArray;
	}


//	public void compareonSkills(){


//	}

}
