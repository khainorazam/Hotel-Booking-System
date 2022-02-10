/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.io.Serializable;

/**
 *
 * @author khain
 */
public class HelpCenter implements Serializable{
    int hcid;
    String email;
    String message;
    String reply;

    public HelpCenter(String email, String message) {
        this.email = email;
        this.message = message;
    }
    
    public HelpCenter(int hcid, String reply){
        this.hcid = hcid;
        this.reply = reply;
    }

    public int getHcid() {
        return hcid;
    }

    public void setHcid(int hcid) {
        this.hcid = hcid;
    }
    

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getReply() {
        return reply;
    }

    public void setReply(String reply) {
        this.reply = reply;
    }
    
    
}
