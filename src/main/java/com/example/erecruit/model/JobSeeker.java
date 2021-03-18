package com.example.erecruit.model;

public class JobSeeker extends RegularUser {

	//attributes
	private int numberOfJobsAppliedIn=0;
	private long jobSeekerId;
	private String education;
	private int experience;
	private int age;
	
	
	public JobSeeker() {
	}

	public JobSeeker(String username, long cnic, int age, long PhoneNumber, String email, String education,int experience) {
		super(username, cnic, PhoneNumber, email);
		this.education=education;
		this.experience=experience;
		this.age=age;
	}

	public JobSeeker(int numberOfJobsAppliedIn, String education, int experience, int age) {
		super();
		this.numberOfJobsAppliedIn = numberOfJobsAppliedIn;
		this.education = education;
		this.experience = experience;
		this.age = age;
	}

	public JobSeeker(String education, int experience, int age) {
		super();
		this.education = education;
		this.experience = experience;
		this.age = age;
	}

	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
	}

	public int getExperience() {
		return experience;
	}

	public void setExperience(int experience) {
		this.experience = experience;
	}

	public long getJobSeekerId() {
		return jobSeekerId;
	}

	public void setJobSeekerId(long jobSeekerId) {
		this.jobSeekerId = jobSeekerId;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public int getNumberOfJobsAppliedIn() {
		return numberOfJobsAppliedIn;
	}

	public void setNumberOfJobsAppliedIn(int numberOfJobsAppliedIn) {
		this.numberOfJobsAppliedIn = numberOfJobsAppliedIn;
	}
	

}
