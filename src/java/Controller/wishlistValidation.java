package Controller;

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

@WebServlet(urlPatterns = {"/wishlistValidation"})
public class wishlistValidation extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String driver = "com.mysql.jdbc.Driver";
        String database = "owohotel";
        String url = "jdbc:mysql://localhost:3306/";
        String user = "root";
        String password = "";

        String email=request.getParameter("email");  
        String roomType=request.getParameter("roomType");  
        HttpSession session = request.getSession();
//        String email = (String) session.getAttribute("email");
//        String roomType = (String) session.getAttribute("roomType");
        

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url + database, user, password);

            Statement stm = conn.createStatement();
            String slt = ("select * from wishlist where email='" + email + "' and roomType='" + roomType + "'");
            ResultSet rs = stm.executeQuery(slt);

            session.setAttribute("email", email);
            session.setAttribute("roomType", roomType);

            if (rs.next()) {

                session.setAttribute("valid", "true");
                response.sendRedirect("booking.jsp");
            } else {
                session.setAttribute("valid", "false");
                response.sendRedirect("booking.jsp");
            }
            conn.close();

        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e.getMessage());
        }

    }
}
