/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import DBUtility.DBConnection;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class User implements Serializable {
    String name;
    String email;
    String password;
    String phone;
    String level;
    String address;
    float ewallet_balance=0;
    
    Connection conn;
    PreparedStatement ps;
    ResultSet rs;

    public User(String email, String name, String password, String phone, String level, String address) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.phone = phone;
        this.level = level;
        this.address = address;
        
    }

    public User() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public float getEwallet_balance() {
        return ewallet_balance;
    }

    public void setEwallet_balance(float ewallet_balance) {
        this.ewallet_balance = ewallet_balance;
    }
    
    public User getUser() {

        User p = new User();

        try {
            String SQL = "SELECT * FROM USER WHERE level=2";
            conn = DBConnection.openConnection();
            ps = conn.prepareStatement(SQL);

            rs = ps.executeQuery();

            while (rs.next()) {
                p.setEmail(rs.getString("email"));
                p.setEwallet_balance(rs.getFloat("ewallet_balance"));

            }

        } catch (Exception e) {
        }

        return p;

    }

    public void updateEbalance(String id, float balance) {

        try {
            String sqlupdate = "UPDATE USER SET ewallet_balance=? WHERE email =?";
            conn = DBConnection.openConnection();
            ps = conn.prepareStatement(sqlupdate);

            ps.setFloat(1, balance);
            ps.setString(2, id);

            ps.executeUpdate();

        } catch (Exception e) {
        }
    }

    public User ViewBalance(String id) {
        Connection conn;
        PreparedStatement ps;
        ResultSet rs;
        User p = new User();

        try {
            String SQL = "SELECT * FROM USER WHERE email=?";
            conn = DBConnection.openConnection();
            ps = conn.prepareStatement(SQL);
            ps.setString(1, id);
            rs = ps.executeQuery();

            while (rs.next()) {
                p.setEmail(rs.getString("email"));
                p.setEwallet_balance(rs.getFloat("ewallet_balance"));
            }

        } catch (Exception e) {
        }

        return p;

    }
    
    

    

    
}
