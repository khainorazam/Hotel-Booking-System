/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.HelpCenter;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author khain
 */
public class HelpCenterDAOImpl implements HelpCenterDAO {
    
    Connection conn;
    PreparedStatement ps;
    ResultSet rs;
    
    public void message(HelpCenter h){
        HelpCenter m = h;
        
        try{

            String sqlinsert = "insert into helpcenter(email,message)values('"
                +h.getEmail()+"','"
                +h.getMessage()+"'"
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
    
    public void reply(HelpCenter h){
        
        HelpCenter r = h;
        
        try{
            String sqlupdate = "update helpcenter set reply = ? where hcID=?";
            conn = DBUtility.DBConnection.openConnection();
            ps = conn.prepareStatement(sqlupdate);

            ps.setString(1, r.getReply());
            ps.setInt(2, r.getHcid());
            ps.executeUpdate();

        }
        catch(Exception ex){
        ex.printStackTrace(out);
        }
    }
}
