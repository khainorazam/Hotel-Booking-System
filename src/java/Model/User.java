/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.io.Serializable;

public class User implements Serializable {
    String name;
    String email;
    String password;
    String phone;
    String level;
    String address;
    float ewallet_balance=0;

    public User(String email, String name, String password, String phone, String level, String address) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.phone = phone;
        this.level = level;
        this.address = address;
        
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
    
    

    

    
}
