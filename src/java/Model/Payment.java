package Model;

import DBUtility.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class Payment {
    private int paymentID;
    private String paymentType;
    private String roomType;
    private float amount;
    private String email;
    
    public Payment(int paymentID, String paymentType, String roomType, float amount, String email) {
        this.paymentID = paymentID;
        this.paymentType = paymentType;
        this.roomType = roomType;
        this.amount = amount;
        this.email = email;
    }

    public Payment() {
    }

    public int getPaymentID() {
        return paymentID;
    }

    public void setPaymentID(int paymentID) {
        this.paymentID = paymentID;
    }

    public String getPaymentType() {
        return paymentType;
    }

    public void setPaymentType(String paymentType) {
        this.paymentType = paymentType;
    }

    public String getRoomType() {
        return roomType;
    }

    public void setRoomType(String roomType) {
        this.roomType = roomType;
    }

    public float getAmount() {
        return amount;
    }

    public void setAmount(float amount) {
        this.amount = amount;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    


    

    
    public void createPayment(String pt,String pd,float a, String ui) {
       Connection conn;
       PreparedStatement ps;
      try{
          String SQL = "INSERT INTO PAYMENT(paymentType,roomType,amount,email)VALUES(?,?,?,?)";
          conn = DBConnection.openConnection();
          ps = conn.prepareStatement(SQL);
          ps.setString(1, pt);
          ps.setString(2, pd);
          ps.setFloat(3, a);
          ps.setString(4, ui);
          ps.executeUpdate();
          
      }catch(Exception e){}  
    }

    public ArrayList<Payment> getAllPayment() {
      Connection conn;
      ArrayList<Payment> payment = new ArrayList<>();
      
      try{
          String SQL = "SELECT * FROM PAYMENT";
          conn = DBConnection.openConnection();
          Statement stmt = conn.createStatement();
        
          ResultSet rs = stmt.executeQuery(SQL);
          
          while(rs.next()){
              Payment p = new Payment();
              
              p.setPaymentID(rs.getInt("paymentID"));
              p.setPaymentType(rs.getString("paymentType"));
              p.setRoomType(rs.getString("roomType"));
              p.setAmount(rs.getFloat("amount"));
              p.setEmail(rs.getString("email"));
              
              payment.add(p);    
          }    
      }catch(Exception e){}
      
      return payment;
    }

     public Payment getPayment(int id) {
      Connection conn;
      PreparedStatement ps;
      ResultSet rs;   
      Payment p= new Payment();
      
      try{
          String SQL = "SELECT * FROM PAYMENT WHERE paymentID=?";
          conn = DBConnection.openConnection();
          ps = conn.prepareStatement(SQL);
          ps.setInt(1, id);
          rs = ps.executeQuery();
       
          while(rs.next())
          {
              p.setPaymentID(rs.getInt("paymentID"));
              p.setPaymentType(rs.getString("paymentType"));
              p.setRoomType(rs.getString("roomType"));
              p.setAmount(rs.getFloat("amount"));
          }
          
      }catch(Exception e){}
      
      return p;
        
    }   

    public void deletePayment(int id) {
        Connection conn;
        PreparedStatement ps;
        try{
            String sqldelete = "DELETE FROM PAYMENT WHERE paymentID=?";
            conn = DBConnection.openConnection();
            ps = conn.prepareStatement(sqldelete);
            ps.setInt(1, id);           
            ps.executeUpdate();
            
        }catch(Exception e){}
    }
    
//    public void updateProject(int id, Payment p) {
//       Connection conn;
//       PreparedStatement ps;
//       try{
//            String sqlupdate = "UPDATE PROJECT SET projectTitle=?, projectDesc=?, startDate=?, completionDate=? WHERE projectID =?";
//            conn = DBConnection.openConnection();
//            ps = conn.prepareStatement(sqlupdate);
//            ps.setString(1,p.getProjectTitle());
//            ps.setString(2,p.getProjectDesc());
//            ps.setString(3,p.getStartDate());
//            ps.setString(4,p.getCompletionDate());
//            ps.setInt(5,id);
//            ps.executeUpdate();
//            
//        }catch(Exception e){}
//    }    
    
}
