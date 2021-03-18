package com.example.erecruit.model;

import java.util.ArrayList;

public class EligibleJobSeeker /*extends JobSeeker*/{

	//additional Attributes
	int loyalty;
	ArrayList<String> skills;
	ArrayList<String> additionalSkills;
	String pastExperienceRelatedToJob;
	RegularUser regUser;
	JobSeeker js;
		
	public EligibleJobSeeker() {

	}
	
	public EligibleJobSeeker(String username, long cnic, int age, long PhoneNumber, String email, String education,
			int experience,int loyalty, ArrayList<String> skills) {
		//super(username, cnic, age, PhoneNumber, email, education, experience);
		this.loyalty=loyalty;
		this.skills=skills;
	}
	
	

	public EligibleJobSeeker(String username, long cnic, int age, long PhoneNumber, String email, String education,
			int experience,int loyalty, ArrayList<String> skills, ArrayList<String> additionalSkills,
			String pastExperienceRelatedToJob) {
		//super(username, cnic, age, PhoneNumber, email, education, experience);
		
		regUser=new RegularUser(username,cnic,PhoneNumber,email);
		js=new JobSeeker(education, experience, age);
		
		this.loyalty = loyalty;
		this.skills = skills;
		this.additionalSkills = additionalSkills;
		this.pastExperienceRelatedToJob = pastExperienceRelatedToJob;
	}

	public int getLoyalty() {
		return loyalty;
	}

	public void setLoyalty(int loyalty) {
		this.loyalty = loyalty;
	}

	public ArrayList<String> getSkills() {
		return skills;
	}

	public void setSkills(ArrayList<String> skills) {
		this.skills = skills;
	}

	public ArrayList<String> getAdditionalSkills() {
		return additionalSkills;
	}

	public void setAdditionalSkills(ArrayList<String> additionalSkills) {
		this.additionalSkills = additionalSkills;
	}

	public String getPastExperienceRelatedToJob() {
		return pastExperienceRelatedToJob;
	}

	public void setPastExperienceRelatedToJob(String pastExperienceRelatedToJob) {
		this.pastExperienceRelatedToJob = pastExperienceRelatedToJob;
	}

	public RegularUser getRegUser() {
		return regUser;
	}

	public void setRegUser(RegularUser regUser) {
		this.regUser = regUser;
	}

	public JobSeeker getJs() {
		return js;
	}

	public void setJs(JobSeeker js) {
		this.js = js;
	}
	
	
	


}
