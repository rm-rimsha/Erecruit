package com.example.erecruit.service;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;

import org.springframework.web.servlet.ModelAndView;

import com.example.erecruit.Database.DatabaseConfig;
import com.example.erecruit.controller.LoginController;
import com.example.erecruit.model.ClientModel;
import com.example.erecruit.model.JobModel;

public class JobService {

	public JobService() {
		// TODO Auto-generated constructor stub
	}
	
	//return a job model with the id
	public JobModel getJob(int id) {
		try {
			
			DatabaseConfig dbc=new DatabaseConfig();
			PreparedStatement ps=(dbc.getConnection()).prepareStatement("select * from approvedjobs where jobId=?");
			ps.setString(1, Integer.toString(id));
			
			ResultSet rs=ps.executeQuery();
			if(!rs.next()) {}
			JobModel jm= new JobModel(rs.getInt("jobId"),rs.getString("jobPosition"),rs.getString("skillsRequired"),rs.getString("eduReq"),rs.getInt("expReq"),rs.getNString("jobDescription"),rs.getTimestamp("dateWhenPosted"));
			
			return jm;
		}
		catch(Exception e) {
			System.out.println(e);
			return new JobModel();
		}
	}
	//submit the job data to the database
	public void SubmitJobData(JobModel job) {
		
		DatabaseConfig dbc=new DatabaseConfig();
		try {
			
			//query to insert the job values in the database;
			PreparedStatement ps=(dbc.getConnection()).prepareStatement("insert into AllJobs(jobPosition,skillsRequired,eduReq,expReq,"
					+ "jobDescription,DateWhenPosted) values (?,?,?,?,?,?)");
			ps.setString(1,job.getJobPosition());
			ps.setString(2,job.getSkillsRequired());
			ps.setString(3,job.getEduReq());
			ps.setString(4,Integer.toString(job.getExpReq()));
			ps.setString(5,job.getJobDescription());
			ps.setTimestamp(6,job.getDate());
			
			ps.executeUpdate();
			
			//getting the auto incremented jobId 
			ps=(dbc.getConnection()).prepareStatement("select * from AllJobs order by jobId desc limit 1");
			ResultSet Rs=ps.executeQuery();
			if(!Rs.next()) {}
			int jobid=Rs.getInt("jobId");
			
			//geting the client id
			String username=((ClientModel)LoginController.getUser()).getUsername();
			ps=(dbc.getConnection()).prepareStatement("select * from Client where username=?");
			ps.setString(1, username);
			ResultSet Rs2=ps.executeQuery();
			if(!Rs2.next()) {}
			int clientid=Rs2.getInt("clientId");
			
			//inserting them both in the relation ship table
			ps=(dbc.getConnection()).prepareStatement("insert into jobClientRelation(jobId,clientId)"
					+ "values (?,?)");
			ps.setString(1, Integer.toString(jobid));
			ps.setString(2, Integer.toString(clientid));
			ps.executeUpdate();

		}
		catch(Exception e) {
			System.out.println(e);
		}
	}
	

}
