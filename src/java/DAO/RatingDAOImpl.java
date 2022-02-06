/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DBUtility.DBConnection;
import Model.Rating;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author FAIZ
 */

public class RatingDAOImpl implements RatingDAO {
@Override
    public void insert(Rating i) {

        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/owohotel", "root", "");
            
            PreparedStatement ps;
                     
            String sqlinsert = "insert into rating(email,rating,review,roomType)values(?,?,?,?)";
            
            conn.prepareStatement(sqlinsert);
            System.out.println("hello"+i.getEmail()+i.getRating()+i.getReview()+i.getRoomType());
            ps = conn.prepareStatement(sqlinsert);
            ps.setString(1,i.getEmail());
            ps.setString(2,i.getRating());
            ps.setString(3,i.getReview());
            ps.setString(4,i.getRoomType());
            ps.executeUpdate(); 
            }

        catch(Exception ex){
        System.out.println(ex);
        }
        
    }

}
