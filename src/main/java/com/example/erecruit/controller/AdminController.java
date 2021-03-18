package com.example.erecruit.controller;


import com.example.erecruit.Database.DatabaseConfig;
import com.example.erecruit.model.Admin;
import com.example.erecruit.model.ClientModel;
import com.example.erecruit.model.JobModel;
import com.example.erecruit.model.RegularUser;
import com.example.erecruit.service.AdminService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.xml.transform.Result;
import java.sql.*;
import java.util.ArrayList;


@Controller
public class AdminController {


    private Admin admin;
private DatabaseConfig db;

    @GetMapping("/view/adminLogin") //admin log in page
    public String displayForm(@ModelAttribute("admin") Admin admin) throws SQLException {
        admin=new Admin();
        DatabaseConfig db=new DatabaseConfig();
        PreparedStatement ps=db.getConnection().prepareStatement("insert into Admin (adminname,password) values ('momina','momina.123')");
        ps.executeUpdate();
        return "adminLogin";
    }

   @PostMapping("/view/submit") //verify credentials of from admin table
    public  ModelAndView admin(@ModelAttribute ("admin") Admin ad) throws SQLException {
    ad=new Admin(ad.getUsername(),ad.getPassword()); //gets the saved enteries
       AdminService aservice = new AdminService();
       ModelAndView mv = new ModelAndView();
       if (aservice.check(ad)) { //credentials are verified
           mv.setViewName("JobSelection");
       }
       else
       { mv.setViewName("adminLogin"); //credentials entered are wrong
       mv.addObject("errorMessage", "*Username or password is incorrect");
   }
       return mv;

   }

   @GetMapping("/view/JobSelection")
   public String jobselection(){
        return "JobSelection";
   }

@GetMapping("/view/alljobs") //view all jobs
    public ModelAndView displayJobs() throws SQLException {
    JobModel job=new JobModel();
    ArrayList<JobModel> jobs=new ArrayList<JobModel>() ;

    DatabaseConfig db=new DatabaseConfig();
    ModelAndView mv=new ModelAndView();
    Connection conn= db.getConnection();
    PreparedStatement ps=conn.prepareStatement("Select * from alljobs natural join jobclientrelation natural join client");


    ResultSet result=ps.executeQuery(); //table with all attributes from alljobs

 while (result.next()) { //iterates til the end of the result table of query
         job = new JobModel();
     ClientModel cm=new ClientModel(result.getInt("clientId"),result.getString("username"),
             result.getLong("cnic"),result.getLong("PhoneNumber"),result.getString("email"),result.getString("compName"),
             result.getString("officeAddress"));
         job.setJobId(result.getInt("jobId"));
         job.setJobPosition(result.getString("jobPosition"));
         job.setSkillsRequired(result.getString("skillsRequired"));
         job.setEduReq(result.getString("eduReq"));
         job.setExpReq(result.getInt("expReq"));
         job.setJobDescription(result.getString("JobDescription"));
         job.setDateWhenPosted(result.getTimestamp("DateWhenPosted"));
         job.setClientThatPostedTheJob(cm);
     jobs.add(job);
 }
    mv.setViewName("DisplayJobs");

    if (jobs.size()==0){
     mv.addObject("lempty", true);
 }
 else{
    mv.addObject("jobs",jobs);}

        return mv;
}
@RequestMapping("/view/jobDescription") //view job descriptions
public ModelAndView jobDescription(@RequestParam("id") int id) throws SQLException {
        JobModel job=new JobModel();
    ModelAndView mv=new ModelAndView();
    DatabaseConfig db=new DatabaseConfig();
    PreparedStatement ps=(db.getConnection()).prepareStatement("select * from AllJobs natural join jobclientrelation natural join Client where jobId=?");
    ps.setInt(1, id);
    ResultSet rs=ps.executeQuery();
    if (!rs.next()){}

    ClientModel cm=new ClientModel(rs.getInt("clientId"),rs.getString("username"),
            rs.getLong("cnic"),rs.getLong("PhoneNumber"),rs.getString("email"),rs.getString("compName"),
            rs.getString("officeAddress"));
    job.setJobId(rs.getInt("jobId"));
    job.setJobPosition(rs.getString("jobPosition"));
    job.setSkillsRequired(rs.getString("skillsRequired"));
    job.setEduReq(rs.getString("eduReq"));
    job.setExpReq(rs.getInt("expReq"));
    job.setJobDescription(rs.getString("JobDescription"));
    job.setDateWhenPosted(rs.getTimestamp("DateWhenPosted"));
    job.setClientThatPostedTheJob(cm);

        mv.addObject("job",job);
        mv.addObject("moreinfo",rs.getString("JobDescription").length()==0);
        mv.addObject("client",cm);
        mv.setViewName("jobDescription");
     return mv;
}

@RequestMapping("/view/disapproved")  //disapprove a job message is displayed on screen
    public ModelAndView disapprovedjob(@RequestParam("id") int id) throws SQLException{
         ModelAndView mv=new ModelAndView();
         JobModel job=new JobModel();
        DatabaseConfig db=new DatabaseConfig();

    PreparedStatement ps1=db.getConnection().prepareStatement("select * from alljobs natural join jobclientrelation natural join Client where  jobId=?");
    ps1.setInt(1,id);
    ResultSet rs=ps1.executeQuery(); //stores all fields
if (!rs.next()){}
    ClientModel cm=new ClientModel(rs.getInt("clientId"),rs.getString("username"),
            rs.getLong("cnic"),rs.getLong("PhoneNumber"),rs.getString("email"),rs.getString("compName"),
            rs.getString("officeAddress"));
    job.setJobId(rs.getInt("jobId"));
    job.setJobPosition(rs.getString("jobPosition"));
    job.setSkillsRequired(rs.getString("skillsRequired"));
    job.setEduReq(rs.getString("eduReq"));
    job.setExpReq(rs.getInt("expReq"));
    job.setJobDescription(rs.getString("jobDescription"));
    job.setDateWhenPosted(rs.getTimestamp("DateWhenPosted"));
    job.setClientThatPostedTheJob(cm);

    PreparedStatement ps=db.getConnection().prepareStatement("insert into disapprovedJobs(jobId,clientId,jobPosition,skillsrequired,eduReq,expReq,jobDescription,DateWhenPosted) " +
            "values (?,?,?,?,?,?,?,?)");

    ps.setInt(1,job.getJobId());
    ps.setInt(2,job.getClientThatPostedTheJob().getClientId());
        ps.setString(3,job.getJobPosition());
        ps.setString(4,job.getSkillsRequired());
        ps.setString(5,job.getEduReq());
        ps.setInt(6,job.getExpReq());
        ps.setString(7,job.getJobDescription());
        ps.setTimestamp(8,job.getDateWhenPosted());
        ps.executeUpdate();

        PreparedStatement ps3=db.getConnection().prepareStatement("delete from jobclientrelation where jobId=?");
        ps3.setInt(1,id);
        ps3.executeUpdate();
    PreparedStatement ps4=db.getConnection().prepareStatement("delete from eligiblejobseekers where jobId=?");
    ps4.setInt(1,id);
    ps4.executeUpdate();

    PreparedStatement ps5=db.getConnection().prepareStatement("delete from alljobs where jobId=?");
    ps5.setInt(1,id);
    ps5.executeUpdate();

    mv.setViewName("disapproved");
        return mv;
}

@GetMapping("/view/disapprovedJobs") //DISPLAY DISAPPROVED JOBS from disapprovedjobs table
    public ModelAndView alldisjobs() throws SQLException {
    ModelAndView mv=new ModelAndView();
    DatabaseConfig db=new DatabaseConfig();

    PreparedStatement ps1=db.getConnection().prepareStatement("select * from disapprovedjobs natural join client");
    ResultSet rs=ps1.executeQuery();
    ArrayList<JobModel> disjobs=new ArrayList<>();

    while (rs.next()) {
        JobModel job=new JobModel();
        ClientModel cm=new ClientModel(rs.getInt("clientId"),rs.getString("username"),
                rs.getLong("cnic"),rs.getLong("PhoneNumber"),rs.getString("email"),rs.getString("compName"),
                rs.getString("officeAddress"));
        job.setJobId(rs.getInt("jobId"));
    job.setJobPosition(rs.getString("jobPosition"));
    job.setSkillsRequired(rs.getString("skillsRequired"));
    job.setEduReq(rs.getString("eduReq"));
    job.setExpReq(rs.getInt("expReq"));
    job.setJobDescription(rs.getString("jobDescription"));
    job.setDateWhenPosted(rs.getTimestamp("DateWhenPosted"));
    job.setClientThatPostedTheJob(cm);
    disjobs.add(job);
        mv.addObject("moreinfo",rs.getString("jobDescription").length()==0);
    }

    mv.addObject("djobs",disjobs);
    mv.setViewName("disapprovedjobs");
    return mv;
}

    @RequestMapping("/view/approved") //approve a job
    public ModelAndView approvedjob(@RequestParam("id") int id) throws SQLException{
        ModelAndView mv=new ModelAndView();
        JobModel job=new JobModel();
        DatabaseConfig db=new DatabaseConfig();

        PreparedStatement ps1=db.getConnection().prepareStatement("select * from alljobs natural join jobclientrelation natural join client where jobId=?");
        ps1.setInt(1,id);
        ResultSet rs=ps1.executeQuery(); //stores all fields
        if (!rs.next()){}
        ClientModel cm=new ClientModel(rs.getInt("clientId"),rs.getString("username"),
                rs.getLong("cnic"),rs.getLong("PhoneNumber"),rs.getString("email"),rs.getString("compName"),
                rs.getString("officeAddress"));
        job.setClientThatPostedTheJob(cm);
        job.setJobId(rs.getInt("jobId"));
        job.setJobPosition(rs.getString("jobPosition"));
        job.setSkillsRequired(rs.getString("skillsRequired"));
        job.setEduReq(rs.getString("eduReq"));
        job.setExpReq(rs.getInt("expReq"));
        job.setJobDescription(rs.getString("jobDescription"));
        job.setDateWhenPosted(rs.getTimestamp("DateWhenPosted"));

        PreparedStatement ps=db.getConnection().prepareStatement("insert into approvedJobs(jobId,clientId,jobPosition,skillsrequired,eduReq,expReq,jobDescription,DateWhenPosted) " +
                "values (?,?,?,?,?,?,?,?)");

        ps.setInt(1,job.getJobId());
        ps.setInt(2,job.getClientThatPostedTheJob().getClientId());
        ps.setString(3,job.getJobPosition());
        ps.setString(4,job.getSkillsRequired());
        ps.setString(5,job.getEduReq());
        ps.setInt(6,job.getExpReq());
        ps.setString(7,job.getJobDescription());
        ps.setTimestamp(8,job.getDateWhenPosted());
        ps.executeUpdate();

        PreparedStatement ps3=db.getConnection().prepareStatement("delete from jobclientrelation where jobId=?");
        ps3.setInt(1,id);
        ps3.executeUpdate();
        PreparedStatement ps4=db.getConnection().prepareStatement("delete from eligiblejobseekers where jobId=?");
        ps4.setInt(1,id);
        ps4.executeUpdate();

        PreparedStatement ps5=db.getConnection().prepareStatement("delete from alljobs where jobId=?");
        ps5.setInt(1,id);
        ps5.executeUpdate();


        mv.setViewName("approved");
        return mv;
    }


    @GetMapping("/view/approvedJobs") //DISPLAY APPROVED JOBS
    public ModelAndView allajobs() throws SQLException {
        ModelAndView mv=new ModelAndView();
        DatabaseConfig db=new DatabaseConfig();
        ArrayList<JobModel> ajobs=new ArrayList<>();

        PreparedStatement ps1=db.getConnection().prepareStatement("select * from approvedjobs natural join client");
        ResultSet rs=ps1.executeQuery();

        while (rs.next()){
            JobModel job=new JobModel();
            ClientModel cm=new ClientModel(rs.getInt("clientId"),rs.getString("username"),
                    rs.getLong("cnic"),rs.getLong("PhoneNumber"),rs.getString("email"),rs.getString("compName"),
                    rs.getString("officeAddress"));
            job.setJobId(rs.getInt("jobId"));
            job.setJobPosition(rs.getString("jobPosition"));
            job.setSkillsRequired(rs.getString("skillsRequired"));
            job.setEduReq(rs.getString("eduReq"));
            job.setExpReq(rs.getInt("expReq"));
            job.setJobDescription(rs.getString("jobDescription"));
            job.setDateWhenPosted(rs.getTimestamp("DateWhenPosted"));
            job.setClientThatPostedTheJob(cm);
            ajobs.add(job);
            mv.addObject("moreinfo",rs.getString("jobDescription").length()==0);}


        mv.addObject("ajobs",ajobs);
        mv.setViewName("approvedjobs");
        return mv;
    }
}
