package com.example.erecruit.service;

import com.example.erecruit.Database.DatabaseConfig;
import com.example.erecruit.model.Admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AdminService {

    private Admin admin;

    public boolean check(Admin admin) throws SQLException {
        DatabaseConfig db = new DatabaseConfig();
    Connection c= db.getConnection();
    PreparedStatement pst=c.prepareStatement("Select adminname from admin where adminname=? and password=?");
    pst.setString(1,admin.getUsername()); //the username entered by the user
    pst.setString(2,admin.getPassword()); //password entered by the user
    ResultSet result=pst.executeQuery();
    if (!result.next()){return false;}
    admin.setUsername(result.getString(1));
    return true;
}



}
