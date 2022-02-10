package Controller;

import DAO.HelpCenterDAO;
import DAO.HelpCenterDAOImpl;
import Model.HelpCenter;
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
 
 @WebServlet(urlPatterns = {"/HelpAdminServlet"})
public class HelpAdminServlet extends HttpServlet {  
protected void doPost(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
  
response.setContentType("text/html;charset=UTF-8");  
PrintWriter out = response.getWriter();  
              
  
String r=request.getParameter("reply");  
int hcid=Integer.parseInt(request.getParameter("id"));

    HelpCenter reply = new HelpCenter(hcid,r);
    HelpCenterDAO dao = new HelpCenterDAOImpl();
    dao.reply(reply);
    
    
response.sendRedirect("helpCenterAdmin.jsp?name=Sent!");
          
}
    }

         
   