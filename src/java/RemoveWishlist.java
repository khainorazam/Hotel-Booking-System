/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDate;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author khain
 */
@WebServlet(urlPatterns = {"/RemoveWishlist"})
public class RemoveWishlist extends HttpServlet {

 
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        //work on database part
        try {
        //lets do all the coding here
        String driver= "com.mysql.jdbc.Driver";
        String database= "owohotel";
        String url= "jdbc:mysql://localhost:3306/";
        String user= "root";
        String password = "";
        
        String roomType= request.getParameter("roomType");
 
        //1 import packages -->sql 
        
        //2 load & register the driver
        Class.forName("com.mysql.jdbc.Driver");
        //3 create a connection            
        Connection conn = DriverManager.getConnection(url+database, user, password);
        
        
        //step 4 : create an sql statement
//        String sqlinsert = "insert into user (id,name,email,age)values('"
//                + id + "','"
//                + name + "','"
//                + email + "',"
//                + age
//                + ")";
        
                String sqldelete = "delete from wishlist where roomType = ?";

        
        PreparedStatement ps = conn.prepareStatement(sqldelete);
        ps.setString(1, roomType);
        ps.executeUpdate();
        
        log(sqldelete);

        //step 5 : execute the statement
//        Statement stmt = conn.createStatement();
//        stmt.executeUpdate(sqlinsert);
        
        //step 6 : process the result
        
        //step 7: close connection
        conn.close();
        response.sendRedirect("wishlist.jsp");
        }
        catch (Exception ex){
            ex.printStackTrace(out);
        }   
    }

         
    }


    