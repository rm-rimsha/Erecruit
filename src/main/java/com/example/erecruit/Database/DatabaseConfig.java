package com.example.erecruit.Database;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

import com.example.erecruit.model.ClientModel;

public class DatabaseConfig {

	
	private Connection connection;
    private Statement statement;

    public DatabaseConfig(){
    	try {

    	String url = "jdbc:mysql://localhost:3306/";
    	String user = "root";
    	String password = "withAllah786";
    	String db = "erecruit";
    	Class.forName("com.mysql.cj.jdbc.Driver");
    	
    	//making a connection object with the above defined variables
        connection = DriverManager.getConnection(url, user, password);
        //statement object to execute the queries 
        statement = connection.createStatement();
        
        //creating the object and making the connection to the database
        statement.execute("create database if not exists " + db);
        connection = DriverManager.getConnection(url + db , user, password);
        statement = connection.createStatement();
        
        //creating the tables after the database is defined
        createTables();
        }catch(Exception e){
        	System.out.println(e);
        }
    }
    
    //String username, String password,long cnic, int age, long PhoneNumber, String email, String education,int experience

    public void createTables() throws SQLException {
    	//table for the client
    	statement.execute("create table if not exists Client(clientId INT NOT NULL AUTO_INCREMENT, "
    			+ "username varchar(45), password varchar(25),CNIC BIGINT, PhoneNumber BIGINT, email varchar(45),"
    			+ "compName varchar(50), officeAddress varchar(200), PRIMARY KEY(clientId))");
    	//table for job seeker
    	statement.execute("create table if not exists JobSeeker(jobSeekerId INT NOT NULL AUTO_INCREMENT,"
    			+ "username varchar(45), password varchar(25), CNIC BIGINT, age iNT, PhoneNumber BIGINT, email varchar(65),"
    			+ "education varchar(20), experience INT, PRIMARY KEY(jobSeekerId))");
    	//table for the all the jobs posted
    	statement.execute("create table if not exists AllJobs(jobId INT NOT NULL AUTO_INCREMENT,"
    			+ "jobPosition varchar(100), skillsRequired varchar(200),eduReq varchar(50), expReq INT,"
    			+ "JobDescription varchar(250), DateWhenPosted timestamp, PRIMARY KEY(jobId))");
    	//table for the relationship between a client and all the jobs that he posted;
    	statement.execute("create table if not exists jobClientRelation(jobId INT,clientId INT, foreign key(jobId) references "
    			+ "AllJobs(jobId), foreign key(clientId) references Client(clientId))");
    	//table for eligible job users
    	statement.execute("create table if not exists EligibleJobSeekers(jobId int, jobSeekerId Int, loyalty Int,reqSkills varchar(200), additionalSkills varchar(300),pastExperienceRelatedToJob varchar(200)"
    			+ ",foreign key(jobSeekerId) references JobSeeker(jobSeekerId),foreign key(jobId) references approvedjobs(jobId), primary key(jobId,jobSeekerId))");
		//table for admin
		statement.execute("create table if not exists Admin( adminname VARCHAR(40)," +
				"password VARCHAR(40))");
		statement.execute("create table if not exists approvedJobs (jobId int not null auto_increment primary key ,clientId int not null, " +
				"jobPosition varchar(100), skillsRequired varchar(200),eduReq varchar(50),expReq int, " +
				"jobDescription varchar(250), DateWhenPosted timestamp, foreign key (clientId) references Client(clientId))");

		statement.execute("create table if not exists  disapprovedJobs (jobId int not null auto_increment primary key, clientId int not null, " +
				" jobPosition varchar(100), skillsRequired varchar(200),eduReq varchar(50),expReq int," +
				"jobDescription varchar(250), DateWhenPosted timestamp, foreign key (clientId) references Client(clientId))");



	}
    
    public Connection getConnection() {
        return connection;
    }

    public Statement getStatement() {
        return statement;
    }

}