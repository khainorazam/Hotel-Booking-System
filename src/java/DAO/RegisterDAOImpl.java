/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DBUtility.DBConnection;
import Model.User;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;
import javax.servlet.http.HttpServletResponse;

public class RegisterDAOImpl implements RegisterDAO {

    @Override
    public int createBooking(User b, int hallID, int promo_id, String startDate, String endDate, String status, String email, int userID, int promoID, double priceDisc,int getRecordId) {


//        Booking bu = b;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/eventhallbookingsystem", "root", "");
            
            String sqlinsertBooking = "insert into booking(totalPrice,status,hallBooked,customer,promo_id)values(?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sqlinsertBooking, Statement.RETURN_GENERATED_KEYS);
//            ps.setDouble(1, b.getTotalPrice());
//            ps.setString(2, b.getStatus());
//            ps.setInt(3, b.getHallBooked());
//            ps.setInt(4, b.getCustomer());
//            ps.setInt(5, b.getPromo_id());
            ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                getRecordId = rs.getInt(1);
            }

            String sqlinsertDateAvailability = "insert into dateAvailability(startDate, endDate, hallBooked, bookingID)values(?,?,?,?)";

             PreparedStatement ps_date = conn.prepareStatement(sqlinsertDateAvailability);

            ps_date.setDate(1, java.sql.Date.valueOf(startDate));
            ps_date.setDate(2, java.sql.Date.valueOf(endDate));
            ps_date.setInt(3, hallID);
            ps_date.setInt(4, getRecordId);
            ps_date.executeUpdate();
            

        } catch (Exception ex) {}
        
        return getRecordId;

    }

    @Override
    public void UpdateBookingStatus(int bookingID, String status) {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.

        try {

            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/eventhallbookingsystem", "root", "");

            String sqlupdate = "update booking set status=? where id=?";

            PreparedStatement ps = conn.prepareStatement(sqlupdate);

            ps.setString(1, status);
            ps.setInt(2, bookingID);
            ps.executeUpdate();

            conn.close();

        } catch (Exception ex) {
        }
    }

    @Override
    public void insertPaymentSlip(String file, String status, int booking_id) {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        try {

            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/eventhallbookingsystem", "root", "");

            String sqlupdate = "update booking set paymentSlip=?,status=? where id=?";

            PreparedStatement ps = conn.prepareStatement(sqlupdate);

            ps.setString(1, file);
            ps.setString(2, status);
            ps.setInt(3, booking_id);
            ps.executeUpdate();

            conn.close();

        } catch (Exception ex) {
        }
    }

}