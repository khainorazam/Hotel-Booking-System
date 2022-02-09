/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/InsertWishlist"})
public class InsertWishlist extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String driver= "com.mysql.jdbc.Driver";
        String database= "owohotel";
        String url= "jdbc:mysql://localhost:3306/";
        String user= "root";
        String password = "";
        
        
        String email=request.getParameter("email");  
        String roomType=request.getParameter("roomType"); 
        
        try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection(url+database, user, password);
        
        
       String sqlinsert = "insert into wishlist (email, roomType)values"
        + "('"   + email  + "','" + roomType + "')";
        
        log(sqlinsert);
        Statement stmt = conn.createStatement();
        stmt.executeUpdate(sqlinsert);

        HttpSession session=request.getSession(); 

        session.setAttribute("email", email);
        session.setAttribute("roomType", roomType);
        
        conn.close();
        
        response.sendRedirect("wishlist.jsp");
        
        }catch(ClassNotFoundException | SQLException e){
            System.out.println(e.getMessage());
        }
        
    }
}
