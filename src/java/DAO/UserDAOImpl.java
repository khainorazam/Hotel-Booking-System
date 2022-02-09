/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;
import Model.User;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author FAIZ
 */
public class UserDAOImpl implements UserDAO{

    Connection conn;
    PreparedStatement ps;
    ResultSet rs;
    
    @Override
    public void register(User u) {
        User su = u;
        try{

            String sqlinsert = "insert into user(email,name,password,phone,level,address,ewallet_balance)values('"
                +su.getEmail()+"','"
                +su.getName()+"','"
                +su.getPassword()+"','"
                +su.getPhone()+"','"
                +su.getLevel()+"','"
                +su.getAddress()+"','"
                +su.getEwallet_balance()+"'"
                +")"; 

            conn = DBUtility.DBConnection.openConnection();
//            conn = DBConnection.openConnection();
            Statement stmt = conn.createStatement();
            stmt.executeUpdate(sqlinsert);

            
        }
  
        catch (Exception ex){
            ex.printStackTrace(out);
        } 
    }
    
}
