/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DBUtility.DBConnection;
import Model.Booking;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

public class BookingDAOImpl implements BookingDAO {

    @Override
    public void insert(Booking i) {

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/owohotel", "root", "");

            PreparedStatement ps;

            String sqlinsert = "insert into booking(email, roomType, duration, startDate, payment)values(?,?,?,?,?)";

            ps = conn.prepareStatement(sqlinsert);
            ps.setString(1, i.getEmail());
            ps.setString(2, i.getRoomType());
            ps.setInt(3, i.getDuration());
            ps.setString(4, i.getStartDate());
            ps.setDouble(5, i.getPayment());
            ps.executeUpdate();

        } catch (Exception ex) {
            System.out.println(ex);
        }
    }

    @Override
    public void update(Booking i) {

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/owohotel", "root", "");

            String update = "UPDATE booking SET rate = '" + i.isRate() + "' WHERE bookingID = '" + i.getBookingID() + "'";
            PreparedStatement ps = conn.prepareStatement(update);

            Statement stmt2 = conn.createStatement();
            stmt2.executeUpdate(update);

        } catch (Exception ex) {
            System.out.println(ex);
        }
    }
}
