/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

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

    public int isRate() {
        return rate;
    }
    
    
}
