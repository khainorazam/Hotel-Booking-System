package Controller;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import DAO.WishlistDAO;
import DAO.WishlistDAOImpl;
import Model.Wishlist;
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
       
          
        String email=request.getParameter("email");  
        String roomType=request.getParameter("roomType"); 
        
        Wishlist w = new Wishlist(email,roomType);
        WishlistDAO dao = new WishlistDAOImpl();
        dao.insertWishlist(w);
        

        HttpSession session=request.getSession(); 

        session.setAttribute("email", email);
        session.setAttribute("roomType", roomType);
   
        response.sendRedirect("wishlist.jsp");
        
        
    }
}
