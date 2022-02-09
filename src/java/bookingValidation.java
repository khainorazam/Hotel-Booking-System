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

/**
 *
 * @author User
 */
@WebServlet(urlPatterns = {"/bookingValidation"})
public class bookingValidation extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String driver = "com.mysql.jdbc.Driver";
        String database = "owohotel";
        String url = "jdbc:mysql://localhost:3306/";
        String user = "root";
        String password = "";

        String startDate = request.getParameter("startDate");
        int duration = Integer.parseInt(request.getParameter("duration"));
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");
        String roomType = (String) session.getAttribute("roomType");
        Double price = (Double) session.getAttribute("price");
        int quantity = (Integer) session.getAttribute("quantity");
        int i = 0;
        try {
            Class.forName(driver);
            Connection conn = DriverManager.getConnection(url + database, user, password);

            Statement stm = conn.createStatement();
            String slt = ("select * from booking where startDate='" + startDate + "' and roomType='" + roomType + "'");
            ResultSet rs = stm.executeQuery(slt);

            while (rs.next()) {
                i++;
            }
            conn.close();

        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e.getMessage());
        }
        try {
            if (i < quantity) {
                session.setAttribute("email", email);
                session.setAttribute("roomType", roomType);
                price = price * duration;
                session.setAttribute("price", price);
                session.setAttribute("startDate", startDate);
                session.setAttribute("duration", duration);
                response.sendRedirect("addBooking");
            } else {
                out.println("<html><head></head><body><form action=\"home.jsp\">This room already full on this date.Cannot perform booking<br><input type=\"submit\" value=\"OK\"></form></body></html>"); 
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }

}
