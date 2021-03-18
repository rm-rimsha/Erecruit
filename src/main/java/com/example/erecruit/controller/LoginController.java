package com.example.erecruit.controller;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

//imports
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.example.erecruit.Database.DatabaseConfig;
import com.example.erecruit.model.*;
import com.example.erecruit.service.*;

@Controller
public class LoginController {
	
	//public attribute 
	private static RegularUser User=null;
	
	//setters and getters
	public static RegularUser getUser() {
		return User;
	}

	public static void setUser(RegularUser user) {
		User = user;
	}

	//to get the main login page where both the options are displayed
	@GetMapping(value="/view/MainLogin")
	public static String getMainLoginPage() {
		return "mainLoginPage";
	}

	//<------------ JOB SEEKER LOGIN ----------->
	
	//to get the login page for the job seeker
	@GetMapping(value="/view/JobSeekerLogin")
	public static ModelAndView getLoggedInAsJobSeeker() {
		return new ModelAndView("LoginAsJobSeeker","jobSeeker",new JobSeeker());
	}
	
	//to get the registration form for the job seeker
	@GetMapping(value="/view/RegisterJobSeeker")
	public static ModelAndView  getJobSeekerRegForm() {
		
		JobSeekerService jss= new JobSeekerService();
		
		ModelAndView mv=new ModelAndView();
		mv.setViewName("JobSeekerRegistrationForm");
	    
	    mv.addObject("educationList", jss.getEducationOpts());
	    mv.addObject("regJobSeeker",new JobSeeker());
	    
		return mv;
	}
	
	//when the submit is clicked for logging in the user as a job seeker
	@RequestMapping(value="/view/submitJobSeeker", method=RequestMethod.POST)
	public ModelAndView JobSeekerLoginData(@Validated @ModelAttribute("jobSeeker")JobSeeker jobSeeker) throws Exception{
		
		try {
			//creating an object of the job seekr service
			JobSeekerService jss= new JobSeekerService();	
			
			//creatign the model and view object
			ModelAndView mv=new ModelAndView();
			
			DatabaseConfig db=new DatabaseConfig();
			PreparedStatement ps=db.getConnection().prepareStatement("select * from JobSeeker where username=?");
			ps.setString(1, jobSeeker.getUsername());
			ResultSet rs=ps.executeQuery();

			//jobs jobseeker has applied to
			PreparedStatement ps1=db.getConnection().prepareStatement("select count(*) as count from EligibleJobSeekers where jobSeekerId in(select jobSeekerId from JobSeeker where username=?)");
			ps1.setString(1, jobSeeker.getUsername());
			ResultSet rs1=ps1.executeQuery();


			
			//validating the user
			if(jss.verifyJobSeeker(jobSeeker.getUsername(), jobSeeker.getPassword())) {
				setUser(jobSeeker);
				JobSeeker jsr=new JobSeeker();
				//getting the list of all the jobs currently stored in the database
				ArrayList<JobModel> aljb=jss.getAllJobs();
				if(rs.next()) {
					mv.addObject("phonenumber",rs.getLong("PhoneNumber"));
					mv.addObject("email",rs.getString("email"));
					if(rs1.next()) {
						jsr=new JobSeeker(rs1.getInt("count"),rs.getString("education"),rs.getInt("experience"),rs.getInt("age"));
					}
				}

				mv.setViewName("JobSeekerHome");

				mv.addObject("seeker",jsr);
				
				if(aljb.isEmpty()) {
					mv.addObject("lisEmpty",true);
					mv.addObject("username",jobSeeker.getUsername());
				}
				else {
				mv.addObject("username",jobSeeker.getUsername());
				mv.addObject("JobList",aljb);
				}
			}
			else {
				mv.setViewName("LoginAsJobSeeker");
				mv.addObject("errorMessage","*Username or password is incorrect.");
			}
			return mv;
		}
		catch(Exception e) {
			System.out.println(e);
			return new ModelAndView();
		}

	}
	
	
	//to process the when the registration form is submitted
	@RequestMapping(value="/view/CompleteJobSeekerRegistration")
	public ModelAndView getRegistrationJobSeekerData(@Validated @ModelAttribute("regJobSeeker")JobSeeker regJobSeeker) throws Exception{
		
		//creatign the model object
		ModelAndView mv=new ModelAndView();
		
		//validation
		//creating an object of the job seekr service class
		JobSeekerService jss=new JobSeekerService();
		
		int option=jss.registerJobSeeker(regJobSeeker);
		
		if(option==1) {
			return new ModelAndView("LoginAsJobSeeker","jobSeeker",new JobSeeker());
		}
		else if(option==2) {
			mv.setViewName("JobSeekerRegistrationForm");
			mv.addObject("errorMessage1","*Username is taken.");	
			mv.addObject("educationList", jss.getEducationOpts());
		}
		else if(option==3) {
			mv.setViewName("JobSeekerRegistrationForm");
			mv.addObject("errorMessage2","*CNIC is invalid.");	
			mv.addObject("educationList", jss.getEducationOpts());
		}
		else if(option==4) {
			mv.setViewName("JobSeekerRegistrationForm");
			mv.addObject("errorMessage3","*Phone Number is invalid.");
			mv.addObject("educationList", jss.getEducationOpts());
		}
		else if(option==5) {
			mv.setViewName("JobSeekerRegistrationForm");
			mv.addObject("errorMessage4","* Age is invalid.");
			mv.addObject("educationList", jss.getEducationOpts());
		}
		
		return mv;
	}
	
	//<------------ CLIENT LOGIN ----------->

	//to get the login page for client
	@GetMapping(value="/view/Login")
	public static ModelAndView getLoggedIn() {
		return new ModelAndView("Login", "LoginClient", new ClientModel());
	}

	//to get the registration form
	@GetMapping(value="/view/RegisterClient")
	public ModelAndView getRegisterClientForm() {
		return new ModelAndView("ClientRegistrationForm","RegisterClient",new ClientModel());
	}
	
	//to process the when the registration form is submitted
	@RequestMapping(value="/view/CompleteClientRegistration")
	public ModelAndView getRegistrationClientData(@Validated @ModelAttribute("RegisterClient")ClientModel RegisterClient) throws Exception{
		
		//creatign the model and view object
		ModelAndView mv=new ModelAndView();
		
		//creating an object of the client service class
		ClientService cs=new ClientService();
		
		int option=cs.registerClient(RegisterClient);
		
		if(option==1) {
			return new ModelAndView("Login", "LoginClient", new ClientModel());
		}
		else if(option==2) {
			mv.setViewName("ClientRegistrationForm");
			mv.addObject("errorMessage1","*Username is taken.");	
		}
		else if(option==3) {
			mv.setViewName("ClientRegistrationForm");
			mv.addObject("errorMessage2","*CNIC is invalid.");	
		}
		else if(option==4) {
			mv.setViewName("ClientRegistrationForm");
			mv.addObject("errorMessage3","*Phone Number is invalid.");	
		}
		
		return mv;
	}
	
	//when the submit is clicked for logging in the user as a client
	@RequestMapping(value="/view/submitClient", method=RequestMethod.POST)
	public ModelAndView getLoginData(@Validated @ModelAttribute("LoginClient")ClientModel LoginClient) throws Exception{
		
		try {
			
			DatabaseConfig db=new DatabaseConfig();
			PreparedStatement ps=db.getConnection().prepareStatement("select * from Client where username=?");
			ps.setString(1, LoginClient.getUsername());
			ResultSet rs=ps.executeQuery();


			PreparedStatement ps1=db.getConnection().prepareStatement("select (select count(*) from jobclientrelation where clientId in (select clientId from client where username=?))+\n" +
					"(select count(*) from approvedjobs where clientId in (select clientId from client where username=?) )+\n" +
					"(select count(*) from disapprovedjobs where clientId in (select clientId from client where username=?)) as sum\n" +
					";");
			ps1.setString(1, LoginClient.getUsername());
			ps1.setString(2,LoginClient.getUsername());
			ps1.setString(3,LoginClient.getUsername());
			ResultSet rs1=ps1.executeQuery();
			
			
			

		
			//creating an object of the client service
			ClientService cs= new ClientService();	
			
			//creatign the model and view object
			ModelAndView mv=new ModelAndView();
	
			//validating the user
			if(cs.verifyClient(LoginClient.getUsername(), LoginClient.getPassword())) {
				setUser(LoginClient);
				
				ClientModel cm=new ClientModel();
				if(rs.next()) {
					mv.addObject("phonenumber",rs.getLong("PhoneNumber"));
					mv.addObject("email",rs.getString("email"));
					if(rs1.next()) {
						cm=new ClientModel(rs.getString("compName"),rs1.getInt("sum"),rs.getString("officeAddress"));
					}
					
				}
				
				ArrayList<JobModel> jb=cs.getAllJobsForTheClient();
				mv.setViewName("LoginHome");
				mv.addObject("joblist", jb);
				mv.addObject("lisEmpty",jb.isEmpty());

				ArrayList<JobModel> approvedj=cs.getApprovedjobsforClient();  //approved jobs array
				mv.addObject("approvedjobs",approvedj);
				mv.addObject("noapproved",approvedj.isEmpty());

				ArrayList<JobModel> disapprovedj=cs.getDisapprovedjobsforClient(); //disapproved jobs array
				mv.addObject("disapprovedjobs",disapprovedj);
				mv.addObject("nodisapproved",disapprovedj.isEmpty());
				mv.addObject("username",LoginClient.getUsername());
	
				mv.addObject("client",cm);
				
			}
			else {
				mv.setViewName("Login");
				mv.addObject("errorMessage","*Username or password is incorrect.");
			}
			return mv;
		}
		catch(Exception e) {
			System.out.println(e);
			return new ModelAndView();
		}
		
	}
	
	

}

