/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import DBUtility.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author User
 */
public class Booking {
    int bookingID;
    String email;
    String roomType; 
    int duration;
    String startDate;
    Double payment;
    int rate;
    int isPaid;
    
    Connection conn;
    PreparedStatement ps;
    ResultSet rs;
    
    public Booking() {
    }

    public Booking(String email, String roomType, int duration, String startDate, Double payment) {
        this.email = email;
        this.roomType = roomType;
        this.duration = duration;
        this.startDate = startDate;
        this.payment = payment;
    }

    public void setBookingID(int bookingID) {
        this.bookingID = bookingID;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setRoomType(String roomType) {
        this.roomType = roomType;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public void setPayment(Double payment) {
        this.payment = payment;
    }

    public void setIsPaid(int isPaid) {
        this.isPaid = isPaid;
    }

    public void setRate(int rate) {
        this.rate = rate;
    }

    public int getBookingID() {
        return bookingID;
    }

    public String getEmail() {
        return email;
    }

    public String getRoomType() {
        return roomType;
    }

    public int getDuration() {
        return duration;
    }

    public String getStartDate() {
        return startDate;
    }

    public Double getPayment() {
        return payment;
    }

    public int getIsPaid() {
        return isPaid;
    }

    public int isRate() {
        return rate;
    }
    
    public Booking getBooking(int id) {

        Booking p = new Booking();
        
        try {
            String SQL = "SELECT * FROM BOOKING WHERE bookingID=?";
            conn = DBConnection.openConnection();
            ps = conn.prepareStatement(SQL);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            while (rs.next()) {
                p.setBookingID(rs.getInt("bookingID"));
                p.setEmail(rs.getString("email"));
                p.setRoomType(rs.getString("roomType"));
                p.setDuration(rs.getInt("duration"));
                p.setStartDate(rs.getString("startDate"));
                p.setPayment(rs.getDouble("payment"));
 
            }

        } catch (Exception e) {
        }
        return p;
    }
    
    public void updatePaid(int id) {

        try {
            String sqlupdate = "UPDATE BOOKING SET isPaid =1 WHERE bookingID =?";
            conn = DBConnection.openConnection();
            ps = conn.prepareStatement(sqlupdate);

            ps.setInt(1, id);

            ps.executeUpdate();

        } catch (Exception e) {
        }
    }
    
    public void updateRate(int id) {

        try {
            String sqlupdate = "UPDATE BOOKING SET rate=0 WHERE bookingID =?";
            conn = DBConnection.openConnection();
            ps = conn.prepareStatement(sqlupdate);

            ps.setInt(1, id);

            ps.executeUpdate();

        } catch (Exception e) {
        }
    }
    
    
}
