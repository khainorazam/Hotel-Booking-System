/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.User;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author khain
 */
public interface RegisterDAO {
    public int createBooking(User b, int hallID, int promo_id, String startDate, String endDate, String status, String email, int userID, int promoID, double priceDisc,int getRecordId);
    public void UpdateBookingStatus(int bookingID, String status);
    public void insertPaymentSlip(String file, String status, int booking_id);
}
