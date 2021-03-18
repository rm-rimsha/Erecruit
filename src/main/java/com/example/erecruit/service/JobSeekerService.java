package com.example.erecruit.service;

import java.sql.Array;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.time.OffsetDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;

import com.example.erecruit.Database.DatabaseConfig;
import com.example.erecruit.controller.LoginController;
import com.example.erecruit.model.ClientModel;
import com.example.erecruit.model.EligibleJobSeeker;
import com.example.erecruit.model.JobModel;
import com.example.erecruit.model.JobSeeker;

public class JobSeekerService {

	ResultSet verifiedJobSeeker;

	public Map<String,String> getEducationOpts() {
	    Map<String, Map<String, String>> referenceData = new HashMap<String, Map<String, String>>();
	    Map<String,String> education = new LinkedHashMap<String,String>();
	    
	    education.put("Matriculation", "Matriculation");
	    education.put("Intermediate", "Intermediate");
	    education.put("Bachelors", "Bachelors");
	    education.put("Masters", "Masters");
	    education.put("PhD","PhD");
	    
	    referenceData.put("educationList", education);
	    return education;
	}
	
	public ArrayList<String> getSampleSkills(){
		ArrayList<String> sampleSkills=new ArrayList<String>();
		sampleSkills.add("Fluent in English");
		sampleSkills.add("Fluent in urdu");
		sampleSkills.add("Fluent in Spanish");
		sampleSkills.add("Leadership skills");
		sampleSkills.add("Web developement");
		sampleSkills.add("Android App Developement");
		sampleSkills.add("Marketing skills");
		sampleSkills.add("Social Media Marketing");
		sampleSkills.add("Logistical skills");
		sampleSkills.add("Good Communication Skills");
		sampleSkills.add("Game developement");
		sampleSkills.add("Machine Learning");
		
		return sampleSkills;
		
	}
	
	//verify the jobSeeker's credentials
	public boolean verifyJobSeeker(String username, String password) {
		
		try {
			DatabaseConfig db=new DatabaseConfig();
			
			PreparedStatement pst=(db.getConnection()).prepareStatement("select * from JobSeeker where username=?");
			pst.setString(1, username);
			verifiedJobSeeker=pst.executeQuery();
			
			if(!verifiedJobSeeker.next()) {
				return false; //check if the result is not empty
			}
			else if((verifiedJobSeeker.getString("password")).equals(password)) {
				return true; //verifying the password
			}
			
			return false;
			
			
		}
		catch(Exception e) {
			System.out.println(e);
			return false;
		}
	}
	
	
	//return the verifed job seeker's username
	public String getVerifiedJobSeekerUsername(){
		try {
			return (this.verifiedJobSeeker).getString("username");
		}
		catch(Exception e) {
			System.out.println(e);
			return "";
		}
		
	}
	
	
	//to register a job seekr
	public int registerJobSeeker(JobSeeker jobSeeker) {
		DatabaseConfig db=new DatabaseConfig();
		try {
		
			PreparedStatement ps=(db.getConnection()).prepareStatement("select * from JobSeeker where username=?");
			ps.setString(1, jobSeeker.getUsername());
			verifiedJobSeeker=ps.executeQuery();
			
			if(!verifiedJobSeeker.next()) {
		    //check if the result is not empty so the username has not been used before
				if((Long.toString(jobSeeker.getCNIC()).length())==13) {
					
					if((Long.toString(jobSeeker.getPhoneNumber()).length())<=15) {
						
						if(jobSeeker.getAge()>0) {
						
							ps=(db.getConnection()).prepareStatement("insert into JobSeeker(username,password,CNIC, age,PhoneNumber,email,education,experience)"
									+ "values (?,?,?,?,?,?,?,?)");
							ps.setString(1, jobSeeker.getUsername());
							ps.setString(2,jobSeeker.getPassword());
							ps.setString(3,Long.toString(jobSeeker.getCNIC()));
							ps.setString(4,Integer.toString(jobSeeker.getAge()));
							ps.setString(5, Long.toString(jobSeeker.getPhoneNumber()));
							ps.setString(6,jobSeeker.getEmail());
							ps.setString(7,jobSeeker.getEducation());
							ps.setString(8, Integer.toString(jobSeeker.getExperience()));
							ps.executeUpdate();
							return 1; //verification and registration complete
						}
						else {
							return 5;//invalid age
						}
						
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
	
	//to get all the jobs 
	public ArrayList<JobModel> getAllJobs(){
		
		DatabaseConfig db=new DatabaseConfig();
		try {
			
			JobSeeker js=(JobSeeker)LoginController.getUser();
			String jsUsername=js.getUsername();
			
			PreparedStatement ps=db.getConnection().prepareStatement("select * from JobSeeker where username=?");
			ps.setString(1, jsUsername);
			ResultSet rs=ps.executeQuery();
			if(!rs.next()) {}
			int seekerId=rs.getInt("jobSeekerId");
			
			PreparedStatement PS=db.getConnection().prepareStatement("select * from approvedjobs natural join Client "
					+ "where jobId not in (select jobId from EligibleJobSeekers where jobSeekerId=?) order by DateWhenPosted desc");
			PS.setString(1,Integer.toString(seekerId));
			ResultSet Rs=PS.executeQuery();

			
			ArrayList<JobModel> jbArray=new ArrayList<JobModel>();
			while(Rs.next()) {
				ClientModel cs=new ClientModel(Rs.getInt("clientId"),Rs.getString("username"),Rs.getLong("CNIC"),Rs.getLong("PhoneNumber"),Rs.getString("email"),Rs.getString("compName"),Rs.getNString("officeAddress"));
				JobModel jb=new JobModel(cs,Rs.getInt("jobId"),Rs.getString("jobPosition"),Rs.getString("skillsRequired"),Rs.getString("eduReq"),Rs.getInt("expReq"),Rs.getString("jobDescription"),Rs.getTimestamp("DateWhenPosted"));
				jbArray.add(jb);				
			}
			
			return jbArray;
			
		}
		catch(Exception e) {
			System.out.println( "hello"+e.getStackTrace());
			return new ArrayList<JobModel>();
		}
	}
	
	//check the eligibilty of a jobseeker for a job 
	public boolean checkEligibilty(int jobid, String jobseekerusername) {
		
		DatabaseConfig db=new DatabaseConfig();
		
		try {
			Map<String,String> edOpts=getEducationOpts();
			PreparedStatement ps=(db.getConnection()).prepareStatement("select * from approvedjobs where jobId=?");
			ps.setString(1,Integer.toString(jobid));
			
			ResultSet RsJob=ps.executeQuery();
			if(!RsJob.next()) {}
			
			PreparedStatement ps2=(db.getConnection()).prepareStatement("select * from JobSeeker where username=?");
			ps2.setString(1,jobseekerusername);
			
			ResultSet RsJobSeeker=ps2.executeQuery();
			if(!RsJobSeeker.next()) {}
			
			int indexEd=0; int indexReqEd=0;
			
			for(String opt:edOpts.keySet()) {
				if(opt.toLowerCase().equals(RsJob.getString("eduReq"))) {
					break;
				}
				indexReqEd+=1;
			}
			
			for(String opt:edOpts.keySet()) {
				if(opt.toLowerCase().equals(RsJobSeeker.getString("education"))) {
					break;
				}
				indexEd+=1;
			}
			
			if(RsJobSeeker.getInt("experience")>=RsJob.getInt("expReq")) {
				if(indexReqEd<=indexEd) {
					return true;
				}
			}
			
			return false;
			
		}
		catch(Exception e) {
			System.out.println(e);
			return false;
		}
	
	}
	
	//return status of candidates per job
	public ArrayList<EligibleJobSeeker> getApplicants(int id){
		
		try {
		ArrayList<EligibleJobSeeker> ejsArray=new ArrayList<EligibleJobSeeker>();
		
		DatabaseConfig db=new DatabaseConfig();
		PreparedStatement ps=db.getConnection().prepareStatement("select * from EligibleJobSeekers natural join JobSeeker where jobId=?");
		ps.setString(1, Integer.toString(id));
		
		ResultSet rs=ps.executeQuery();
		
		while(rs.next()) {
			ArrayList<String> al1=new ArrayList<String>();
			ArrayList<String> al2=new ArrayList<String>();
			
			String skills[]=rs.getString("reqSkills").split(",");
			String additionalskills[]=rs.getString("additionalSkills").split(",");
			
			for(String skillsname:skills) {
				al1.add(skillsname);
			}
			
			for(String skillsname:additionalskills) {
				al2.add(skillsname);
			}
			
			EligibleJobSeeker ejs=new EligibleJobSeeker(rs.getString("username"),rs.getLong("CNIC"),rs.getInt("age"),rs.getLong("PhoneNumber"),rs.getString("email"),rs.getString("education"),rs.getInt("experience"),rs.getInt("loyalty"),al1,al2,rs.getString("pastExperienceRelatedToJob"));
			ejsArray.add(ejs);
		}
		
		return ejsArray;
		
		}
		catch(Exception e) {
			System.out.println(e);
			return new ArrayList<EligibleJobSeeker>();
		}
		
	}

}
