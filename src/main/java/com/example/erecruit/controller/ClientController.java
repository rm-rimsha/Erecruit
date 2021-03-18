package com.example.erecruit.controller;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;

import com.example.erecruit.model.JobSeeker;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.erecruit.Database.DatabaseConfig;
import com.example.erecruit.model.ClientModel;
import com.example.erecruit.model.EligibleJobSeeker;
import com.example.erecruit.model.JobModel;
import com.example.erecruit.service.ClientService;
import com.example.erecruit.service.JobSeekerService;
import com.example.erecruit.service.JobService;

@Controller
public class ClientController {

	//when a  client presses on post a job link from the home page
	@GetMapping(value="/view/PostAJob")
	public ModelAndView getPostForm() {
		
		return new ModelAndView("PostAJobForm","job",new JobModel());
	}
	
	//get the home page from the navigation bar after getting logged in
	@RequestMapping(value="/view/homeLIn")
	public ModelAndView getHomeAfterLoggingIn() {
		try {
		ClientService cs=new ClientService();
		ModelAndView mv=new ModelAndView();

		DatabaseConfig db=new DatabaseConfig();
		PreparedStatement ps=db.getConnection().prepareStatement("select * from Client where username=?");
		ps.setString(1, LoginController.getUser().getUsername());
		ResultSet rs=ps.executeQuery();
		if(!rs.next()) {}

		//get total number of jobs posted by client (pending+approved+disapproved)
		PreparedStatement ps1=db.getConnection().prepareStatement("select (select count(*) from jobclientrelation where clientId in (select clientId from client where username=?))+\n" +
				"(select count(*) from approvedjobs where clientId in (select clientId from client where username=?) )+\n" +
				"(select count(*) from disapprovedjobs where clientId in (select clientId from client where username=?)) as sum\n");
		ps1.setString(1, LoginController.getUser().getUsername());
			ps1.setString(2, LoginController.getUser().getUsername());
			ps1.setString(3, LoginController.getUser().getUsername());


		ResultSet rs1=ps1.executeQuery();
		if(!rs1.next()) {}

		ClientModel cm=new ClientModel(rs.getString("compName"),rs1.getInt("sum"),rs.getString("officeAddress"));

			mv.setViewName("LoginHome"); //set view name

			ArrayList<JobModel> jb=cs.getAllJobsForTheClient();  //pending job approval array
			mv.addObject("joblist", jb);
			mv.addObject("lisEmpty",jb.isEmpty());

			ArrayList<JobModel> approvedj=cs.getApprovedjobsforClient();  //approved jobs array
			mv.addObject("approvedjobs",approvedj);
			mv.addObject("noapproved",approvedj.isEmpty());

			ArrayList<JobModel> disapprovedj=cs.getDisapprovedjobsforClient(); //disapproved jobs array
			mv.addObject("disapprovedjobs",disapprovedj);
			mv.addObject("nodisapproved",disapprovedj.isEmpty());
			mv.addObject("username",LoginController.getUser().getUsername());


		mv.addObject("username",LoginController.getUser().getUsername());
		mv.addObject("phonenumber",rs.getLong("PhoneNumber"));
		mv.addObject("email",rs.getString("email"));
		mv.addObject("client",cm);


		return mv;
		}
		catch(Exception e) {
			System.out.println(e);
			return new ModelAndView();
		}
	}
	
	//getting the data from the post a job form and storing that in the database for the admin to approve
	@RequestMapping(value="/view/submitJob",method=RequestMethod.POST)
	public ModelAndView submitJobData(@ModelAttribute("job")JobModel job) throws Exception{
		

		try {
			ModelAndView mv=new ModelAndView();
			
			JobService js=new JobService();
			js.SubmitJobData(job);
			ClientService cs=new ClientService();
	
			
			DatabaseConfig db=new DatabaseConfig();
			PreparedStatement ps=db.getConnection().prepareStatement("select * from Client where username=?");
			ps.setString(1, LoginController.getUser().getUsername());
			ResultSet rs=ps.executeQuery();
			if(!rs.next()) {}
	
			PreparedStatement ps1=db.getConnection().prepareStatement("select (select count(*) from jobclientrelation where clientId in (select clientId from client where username=?))+\n" +
			"(select count(*) from approvedjobs where clientId in (select clientId from client where username=?) )+\n" +
					"(select count(*) from disapprovedjobs where clientId in (select clientId from client where username=?)) as sum\n");
			ps1.setString(1, LoginController.getUser().getUsername());
			ps1.setString(2, LoginController.getUser().getUsername());
			ps1.setString(3, LoginController.getUser().getUsername());

			ResultSet rs1=ps1.executeQuery();
			if(!rs1.next()) {}

			ClientModel cm=new ClientModel(rs.getString("compName"),rs1.getInt("sum"),rs.getString("officeAddress"));

			mv.setViewName("LoginHome"); //set view name

			ArrayList<JobModel> jb=cs.getAllJobsForTheClient();  //pending job approval array
			mv.addObject("joblist", jb);
			mv.addObject("lisEmpty",jb.isEmpty());

			ArrayList<JobModel> approvedj=cs.getApprovedjobsforClient();  //approved jobs array
			mv.addObject("approvedjobs",approvedj);
			mv.addObject("noapproved",approvedj.isEmpty());

			ArrayList<JobModel> disapprovedj=cs.getDisapprovedjobsforClient(); //disapproved jobs array
			mv.addObject("disapprovedjobs",disapprovedj);
			mv.addObject("nodisapproved",disapprovedj.isEmpty());
			mv.addObject("username",LoginController.getUser().getUsername());


			mv.addObject("username",LoginController.getUser().getUsername());
			mv.addObject("phonenumber",rs.getLong("PhoneNumber"));
			mv.addObject("email",rs.getString("email"));
			mv.addObject("client",cm);


			return mv;
		}
		catch(Exception e) {
			System.out.println(e);
			return new ModelAndView();
		}
		
	}
	
	@RequestMapping(value="/view/seeDetails")
	public ModelAndView applyJob(@RequestParam("id") int id) {
		
		JobSeekerService jss=new JobSeekerService();
		ArrayList<EligibleJobSeeker> ejs=jss.getApplicants(id); //get applicants
	
		
		JobService js=new JobService();
		JobModel jb=js.getJob(id);
		
		ModelAndView mv=new ModelAndView();
		
		mv.setViewName("jobApplicantDetails");
		mv.addObject("ApplicantsOfThisJob",ejs);
		mv.addObject("job",jb);
		mv.addObject("condition",ejs.isEmpty());
		mv.addObject("client",(ClientModel)LoginController.getUser());
		
		return mv;
	}

	//rank on experience
	@RequestMapping(value="/view/rankonExp")
	public ModelAndView ExperienceRank(@RequestParam("id") int id) throws SQLException {
		ModelAndView mv=new ModelAndView();
		ArrayList<EligibleJobSeeker> rankedonexperience=new ArrayList<>(); //eligible job seekers ranked on experience

DatabaseConfig db=new DatabaseConfig();
PreparedStatement ps=db.getConnection().prepareStatement("SELECT * FROM erecruit.eligiblejobseekers natural join\n" +
		" jobseeker where jobId=? order by experience desc;");
         ps.setInt(1,id);
         ResultSet rs=ps.executeQuery();

		while (rs.next()){
			ArrayList<String> a1=new ArrayList<>();
			ArrayList<String> a2=new ArrayList<>();
			String[] skills =rs.getString("reqSkills").split(",");
            a1.addAll(Arrays.asList(skills));
			String[] additionalskills =rs.getString("additionalSkills").split(",");
            a2.addAll(Arrays.asList(additionalskills));
			EligibleJobSeeker ej=new EligibleJobSeeker(rs.getString("username"),rs.getLong("CNIC"),rs.getInt("age"),rs.getLong("PhoneNumber"),rs.getString("email"),rs.getString("education"),rs.getInt("experience"),rs.getInt("loyalty"),a1,a2,rs.getString("pastExperienceRelatedToJob"));
			rankedonexperience.add(ej);

		}
		JobService js=new JobService();
		JobModel jb=js.getJob(id);
		mv.setViewName("rankonExperience");
		mv.addObject("ApplicantsOfThisJob",rankedonexperience);
		mv.addObject("job",jb);
		mv.addObject("condition",rankedonexperience.isEmpty());
		mv.addObject("client",(ClientModel)LoginController.getUser());

		return mv;

	}

	@RequestMapping(value="/view/rankonLoyalty")
	public ModelAndView LoyaltyRank(@RequestParam("id") int id) throws SQLException {
		ModelAndView mv=new ModelAndView();
		ArrayList<EligibleJobSeeker> rankedonexperience=new ArrayList<>(); //eligible job seekers ranked on experience

		DatabaseConfig db=new DatabaseConfig();
		PreparedStatement ps=db.getConnection().prepareStatement("SELECT * FROM erecruit.eligiblejobseekers natural join\n" +
				" jobseeker where jobId=? order by loyalty desc;");
		ps.setInt(1,id);
		ResultSet rs=ps.executeQuery();

		while (rs.next()){
			ArrayList<String> a1=new ArrayList<>();
			ArrayList<String> a2=new ArrayList<>();
			String[] skills =rs.getString("reqSkills").split(",");
			for (String skill:skills) {
				a1.add(skill);
			}
			String additionalskills[]=rs.getString("additionalSkills").split(",");
			for(String skillsname:additionalskills) {
				a2.add(skillsname);
			}
			EligibleJobSeeker ejs=new EligibleJobSeeker(rs.getString("username"),rs.getLong("CNIC"),rs.getInt("age"),rs.getLong("PhoneNumber"),rs.getString("email"),rs.getString("education"),rs.getInt("experience"),rs.getInt("loyalty"),a1,a2,rs.getString("pastExperienceRelatedToJob"));
			rankedonexperience.add(ejs);

		}
		JobService js=new JobService();
		JobModel jb=js.getJob(id);
		mv.setViewName("rankonLoyalty");
		mv.addObject("ApplicantsOfThisJob",rankedonexperience);
		mv.addObject("job",jb);
		mv.addObject("condition",rankedonexperience.isEmpty());
		mv.addObject("client",(ClientModel)LoginController.getUser());

		return mv;

	}

	@RequestMapping(value="/view/rankonSkills")
	public ModelAndView SkillsRank(@RequestParam("id") int id) throws SQLException {
		ArrayList<EligibleJobSeeker> rankedonexperience=new ArrayList<>(); //eligible job seekers ranked on experience
		ModelAndView mv=new ModelAndView();


		DatabaseConfig db=new DatabaseConfig();
		PreparedStatement ps=db.getConnection().prepareStatement("SELECT *,char_length(additionalSkills) as length " +
				"FROM eligiblejobseekers natural join\n" +
				" jobseeker where jobId=? order by length desc ; ");
		ps.setInt(1,id);
		ResultSet rs=ps.executeQuery();

		while (rs.next()){
			ArrayList<String> a1=new ArrayList<>();
			ArrayList<String> a2=new ArrayList<>();
			String[] skills =rs.getString("reqSkills").split(",");
			for (String skill:skills) {
				a1.add(skill);
			}
			String additionalskills[]=rs.getString("additionalSkills").split(",");
			for(String skillsname:additionalskills) {
				a2.add(skillsname);
			}
			EligibleJobSeeker ejs=new EligibleJobSeeker(rs.getString("username"),rs.getLong("CNIC"),rs.getInt("age"),rs.getLong("PhoneNumber"),rs.getString("email"),rs.getString("education"),rs.getInt("experience"),rs.getInt("loyalty"),a1,a2,rs.getString("pastExperienceRelatedToJob"));
			rankedonexperience.add(ejs);

		}
		JobService js=new JobService();
		JobModel jb=js.getJob(id);
		mv.setViewName("rankonSkills");
		mv.addObject("ApplicantsOfThisJob",rankedonexperience);
		mv.addObject("job",jb);
		mv.addObject("condition",rankedonexperience.isEmpty());
		mv.addObject("client",(ClientModel)LoginController.getUser());

		return mv;


	}


}
