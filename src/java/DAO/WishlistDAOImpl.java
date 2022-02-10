/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.Wishlist;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author khain
 */
public class WishlistDAOImpl implements WishlistDAO {
    
    Connection conn;
    PreparedStatement ps;
    ResultSet rs;
    
    public void insertWishlist(Wishlist w){
        Wishlist iw = w;
        try{

            String sqlinsert = "insert into wishlist(email, roomType)values('"
                +iw.getEmail()+"','"
                +iw.getRoomType()+"'"
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
    
    public void removeWishlist(Wishlist w){
        Wishlist rw = w;
        
        try {
            String sqldelete = "DELETE FROM wishlist "
                    + "WHERE roomType = ? AND email = ?";
            conn = DBUtility.DBConnection.openConnection();
            ps = conn.prepareStatement(sqldelete);

            ps.setString(1, rw.getRoomType());
            ps.setString(2, rw.getEmail());
            ps.executeUpdate();
        } 
        catch (Exception ex) {
        ex.printStackTrace(out);
        }
    }
}
    

