package Controller;

import DAO.HelpCenterDAO;
import DAO.HelpCenterDAOImpl;
import Model.HelpCenter;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDate;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
 @WebServlet(urlPatterns = {"/HelpUsersvlt"})
public class HelpUsersvlt extends HttpServlet {  
protected void doPost(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
  
response.setContentType("text/html;charset=UTF-8");  
PrintWriter out = response.getWriter();  
              
String q=request.getParameter("question");  
String e=request.getParameter("email");

    HelpCenter newmessage = new HelpCenter(e,q);
    HelpCenterDAO dao = new HelpCenterDAOImpl();
    dao.message(newmessage);
    
response.sendRedirect("helpCenterUser.jsp?name=Sent!");

    }         
}