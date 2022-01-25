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
 
 @WebServlet(urlPatterns = {"/RatingServlet"})
public class RatingServlet extends HttpServlet {  
protected void doGet(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
  
response.setContentType("text/html;charset=UTF-8");  
PrintWriter out = response.getWriter();  
          
try{  
    
String driver= "com.mysql.jdbc.Driver";
        String database= "owohotel";
        String url= "jdbc:mysql://localhost:3306/owohotel";
        String user= "root";
        String password = "";
        
String n=request.getParameter("rating");  
String p=request.getParameter("review");  
int id=1;
id++;

Class.forName("com.mysql.jdbc.Driver");  
Connection conn=DriverManager.getConnection( url, user, password);  

String sqlinsert = "insert into rating (ratingid,rating,review)values"
        + "('"     + id + "','"   + n + "','"     + p + "')";
  
log(sqlinsert);
          
Statement stmt = conn.createStatement();
stmt.executeUpdate(sqlinsert);

conn.close();
response.sendRedirect("home.jsp");
      
          
}
        catch (Exception ex){
            ex.printStackTrace(out);
        }   
    }

         
    }