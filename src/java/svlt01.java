import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection; //step 01 : import package sql
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/svlt01"})
public class svlt01 extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<h1>Servlet Svlt801 at " + request.getContextPath() + "</h1>");
        
        try {
        //lets do all the coding here
        String driver= "com.mysql.jdbc.Driver";
        String database= "owohotel";
        String url= "jdbc:mysql://localhost:3306/owohotel";
        String user= "root";
        String password = "";
        //1 import packages -->sql 
        
        //2 load & register the driver
        Class.forName("com.mysql.jdbc.Driver");
        //3 create a connection            
        Connection conn = DriverManager.getConnection(url, user, password);
        
        
        //step 4 : create an sql statement
        String sql = "select * from user";

        //step 5 : execute the statement
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery( "select * from user");
        
        //step 6 : process the result
        while (rs.next()){
            out.println("<h4>User name :" +rs.getString(1)  +" Level : " +rs.getString("level")+" Country: " + rs.getString("state") + "</h4>");
        }
        //step 7: close connection
        conn.close();
        
        }
        catch (Exception ex){
            ex.printStackTrace(out);
        }   
    }
    
}
