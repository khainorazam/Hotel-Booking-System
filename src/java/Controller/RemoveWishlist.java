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

        String roomType= request.getParameter("roomType");
        String email = request.getParameter("email");
        
        Wishlist w = new Wishlist(email,roomType);
        WishlistDAO dao = new WishlistDAOImpl();
        dao.removeWishlist(w);

        response.sendRedirect("wishlist.jsp");
        }
 
    }

         
 


    