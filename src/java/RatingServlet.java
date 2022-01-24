import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
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

/**
 *
 * @author FAIZ
 */
@WebServlet(urlPatterns = {"/RatingServlet"})
public class RatingServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RatingServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RatingServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        try{  
    
        String driver= "com.mysql.jdbc.Driver";
        String database= "owohotel";
        String url= "jdbc:mysql://localhost:3306/owohotel";
        String user= "root";
        String password = "";
        
        String rating=request.getParameter("rating");  
        String review=request.getParameter("review");  
        
        Class.forName("com.mysql.jdbc.Driver");  
        Connection conn=DriverManager.getConnection( url, user, password);  

        String sqlinsert = "insert into rating (rate,review)values"
        + "('"     + rating + "','"   + review + "')";
  
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


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
