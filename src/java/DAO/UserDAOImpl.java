/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;
import Model.User;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.DriverManager;
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
    
    @Override
    public void update(User u) {

        try {
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/owohotel", "root", "");

            String update = "UPDATE user SET name = ?, phone = ?, address = ? WHERE email = '"+u.getEmail()+"'";
            PreparedStatement ps = conn.prepareStatement(update);
            
            ps.setString(1, u.getName());
            ps.setString(2, u.getPhone());
            ps.setString(3, u.getAddress());
            ps.executeUpdate();
            
            conn.close();
        } 
        catch (Exception ex) {
             ex.printStackTrace();
        }
    }
    
}
