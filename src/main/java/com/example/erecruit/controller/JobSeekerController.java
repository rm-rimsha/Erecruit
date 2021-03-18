package com.example.erecruit.controller;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.erecruit.Database.DatabaseConfig;
import com.example.erecruit.model.EligibleJobSeeker;
import com.example.erecruit.model.JobModel;
import com.example.erecruit.model.JobSeeker;
import com.example.erecruit.service.JobSeekerService;

@Controller
public class JobSeekerController {
	
	int currentJobId;

	public JobSeekerController() {
		// TODO Auto-generated constructor stub
	}
	
	@RequestMapping(value="/view/submitAdditionalInfo")
	public ModelAndView applyJob(@ModelAttribute ("eligibleJobSeeker") EligibleJobSeeker eligibleJobSeeker) {
		try {
			ModelAndView mv=new ModelAndView();
			DatabaseConfig db=new DatabaseConfig();
			
			JobSeekerService jss=new JobSeekerService();
			JobSeeker js=(JobSeeker)LoginController.getUser();
			String jsUsername=js.getUsername();
			
			PreparedStatement ps=db.getConnection().prepareStatement("select * from JobSeeker where username=?");
			ps.setString(1, jsUsername);
			ResultSet rs=ps.executeQuery();
			if(!rs.next()) {}
			int seekerId=rs.getInt("jobSeekerId");
			
			PreparedStatement ps1=(db.getConnection()).prepareStatement("insert into EligibleJobSeekers(jobId,jobSeekerId,loyalty,reqSkills,additionalSkills,pastExperienceRelatedToJob) "
					+ "values (?,?,?,?,?,?)");
			ps1.setString(1,Integer.toString(currentJobId));
			ps1.setString(2,Integer.toString(seekerId));
			ps1.setString(3,Integer.toString(eligibleJobSeeker.getLoyalty()));
			ps1.setString(4,eligibleJobSeeker.getSkills().toString());
			ps1.setString(5,eligibleJobSeeker.getAdditionalSkills().toString());
			ps1.setString(6,eligibleJobSeeker.getPastExperienceRelatedToJob());
			ps1.executeUpdate();
			
			ArrayList<JobModel> aljb=jss.getAllJobs();
			
			PreparedStatement pss=db.getConnection().prepareStatement("select * from JobSeeker where username=?");
			pss.setString(1, LoginController.getUser().getUsername());
			ResultSet rss=pss.executeQuery();
			if(!rss.next()) {}
			
			PreparedStatement pss1=db.getConnection().prepareStatement("select count(*) as count from EligibleJobSeekers where jobSeekerId in(select jobSeekerId from JobSeeker where username=?)");
			pss1.setString(1, LoginController.getUser().getUsername());
			ResultSet rss1=pss1.executeQuery();
			if(!rss1.next()) {}
			
			JobSeeker jsr=new JobSeeker(rss1.getInt("count"),rss.getString("education"),rss.getInt("experience"),rss.getInt("age"));
			
			
			mv.setViewName("JobSeekerHome");
			mv.addObject("phonenumber",rss.getLong("PhoneNumber"));
			mv.addObject("email",rss.getString("email"));
			mv.addObject("seeker",jsr);
			
			if(aljb.isEmpty()) {

				mv.addObject("lisEmpty",true);
			}
			else {

			mv.addObject("condition2",true);
			mv.addObject("successMessage","Job Application Successful");
			mv.addObject("username",jsUsername);
			mv.addObject("JobList",aljb);}
			
			return mv;
		}
		catch(Exception e) {
			System.out.println(e);
			return new ModelAndView();
		}

	}
	
	@RequestMapping(value="/view/applyJob")
	public ModelAndView applyJob(@RequestParam("id") int id) {
		try {
			//System.out.println("id="+id);
			//id="2";
			//int idI=Integer.parseInt(id);
			currentJobId=id;
			ModelAndView mv=new ModelAndView();
			
			JobSeeker js=(JobSeeker)LoginController.getUser();
			String jsUsername=js.getUsername();
			
			JobSeekerService jss=new JobSeekerService();
			boolean condition=jss.checkEligibilty(id, jsUsername);
			
			ArrayList<JobModel> aljb=jss.getAllJobs();
			
			DatabaseConfig db=new DatabaseConfig();
			PreparedStatement ps=(db.getConnection()).prepareStatement("select * from approvedjobs where jobId=?");
			ps.setString(1, Integer.toString(id));
			ResultSet rs=ps.executeQuery();
			
			if(!rs.next()) {}
			
			String[] reqSkills=rs.getString("skillsRequired").split(",");
			
			List<String> reqskills=new ArrayList<String>();
			for(String skil:reqSkills) {
				reqskills.add(skil);
			}
			
			PreparedStatement pss=db.getConnection().prepareStatement("select * from JobSeeker where username=?");
			pss.setString(1, LoginController.getUser().getUsername());
			ResultSet rss=pss.executeQuery();
			if(!rss.next()) {}
			
			PreparedStatement pss1=db.getConnection().prepareStatement("select count(*) as count from EligibleJobSeekers where jobSeekerId in(select jobSeekerId from JobSeeker where username=?)");
			pss1.setString(1, LoginController.getUser().getUsername());
			ResultSet rss1=pss1.executeQuery();
			if(!rss1.next()) {}
			
			JobSeeker jsr=new JobSeeker(rss1.getInt("count"),rss.getString("education"),rss.getInt("experience"),rss.getInt("age"));

			
			if(condition) {
				mv.setViewName("jobAdditionalInformation");
				mv.addObject("reSkillsArray",reqskills);
				mv.addObject("eligibleJobSeeker",new EligibleJobSeeker());
				mv.addObject("sampleSkills",jss.getSampleSkills());
			}
			else {
				
				mv.setViewName("JobSeekerHome");
				mv.addObject("phonenumber",rss.getLong("PhoneNumber"));
				mv.addObject("email",rss.getString("email"));
				mv.addObject("seeker",jsr);
				
				if(aljb.isEmpty()) {

					mv.addObject("lisEmpty",true);
					mv.addObject("username",jsUsername);
					
				}
				else {

				mv.addObject("errorMessage","You are not Eligible for this Job.");
				mv.addObject("username",jsUsername);
				mv.addObject("JobList",aljb);}
			}
			mv.addObject("condition",condition);
			return mv;
		}
		catch(Exception e) {
			System.out.println(e);
			return new ModelAndView();
		}
	

	}
	
	

}
