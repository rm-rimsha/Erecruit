package com.example.erecruit.model;

import java.sql.Timestamp;
import java.time.Instant;

public class JobModel {

	//attributes
	ClientModel clientThatPostedTheJob;
	private static int noOfCandidates = 0;
	private int jobId;
	private String jobPosition;
	private String skillsRequired;
	private String eduReq;
	private int expReq;
	private String JobDescription;
	private Timestamp dateWhenPosted;
	

	//DEFAULT CONSTRUCTOR
	public JobModel() {
	}

	//CONTRUCTOR WITH 3 PARAMETERS
	public JobModel(String eduReq,int expReq,String JobDescription) {
		
		clientThatPostedTheJob.setNoOfJobsPosted(clientThatPostedTheJob.getNoOfJobsPosted()+1);//increasing the no of jobs posted by a particular client
		noOfCandidates +=1;
		this.eduReq = eduReq;
		this.expReq = expReq;
		this.JobDescription=JobDescription;
	}

	public JobModel(ClientModel clientThatPostedTheJob, int jobId, String jobPosition, String skillsRequired,
			String eduReq, int expReq, String jobDescription, Timestamp dateWhenPosted) {
		super();
		this.clientThatPostedTheJob = clientThatPostedTheJob;
		this.jobId = jobId;
		this.jobPosition = jobPosition;
		this.skillsRequired = skillsRequired;
		this.eduReq = eduReq;
		this.expReq = expReq;
		this.dateWhenPosted = dateWhenPosted;
		//System.out.println(dateWhenPosted);
		this.JobDescription=jobDescription;
	
	}
	
	public JobModel(int jobId, String jobPosition, String skillsRequired,
			String eduReq, int expReq, String jobDescription, Timestamp dateWhenPosted) {
		super();
		this.jobId = jobId;
		this.jobPosition = jobPosition;
		this.skillsRequired = skillsRequired;
		this.eduReq = eduReq;
		this.expReq = expReq;
		this.dateWhenPosted = dateWhenPosted;
		//System.out.println(dateWhenPosted);
		this.JobDescription=jobDescription;
	
	}

	//GETTERS  AND SETTERS
	public int getNoOfCandidates() {
		return noOfCandidates;
	}

	public String getEduReq() {
		return eduReq;
	}

	public void setEduReq(String eduReq) {
		this.eduReq = eduReq;
	}

	public int getExpReq() {
		return expReq;
	}

	public void setExpReq(int expReq) {
		this.expReq = expReq;
	}

	public ClientModel getClientThatPostedTheJob() {
		return clientThatPostedTheJob;
	}

	public void setClientThatPostedTheJob(ClientModel clientThatPostedTheJob) {
		this.clientThatPostedTheJob = clientThatPostedTheJob;
	}

	public String getJobDescription() {
		return JobDescription;
	}

	public void setJobDescription(String jobDescription) {
		JobDescription = jobDescription;
	}

	public int getJobId() {
		return jobId;
	}

	
	public Timestamp getDateWhenPosted() {
		return dateWhenPosted;
	}
	
	public Timestamp getDate() {
		Timestamp instant= Timestamp.from(Instant.now()); 
		return instant;
	}

	public void setDateWhenPosted(Timestamp DateWhenPosted) {
		dateWhenPosted = DateWhenPosted;
	}

	public static void setNoOfCandidates(int noOfCandidates) {
		JobModel.noOfCandidates = noOfCandidates;
	}

	public void setJobId(int jobId) {
		this.jobId = jobId;
	}

	public String getJobPosition() {
		return jobPosition;
	}

	public void setJobPosition(String jobPosition) {
		this.jobPosition = jobPosition;
	}

	public String getSkillsRequired() {
		return skillsRequired;
	}

	public void setSkillsRequired(String skillsRequired) {
		this.skillsRequired = skillsRequired;
	}

	

}
