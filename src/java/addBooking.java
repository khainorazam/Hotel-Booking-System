import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.time.LocalDate;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet(urlPatterns = {"/addBooking"})
public class addBooking extends HttpServlet {
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String driver= "com.mysql.jdbc.Driver";
        String database= "owohotel";
        String url= "jdbc:mysql://localhost:3306/";
        String user= "root";
        String password = "";
        

        String startDate = request.getParameter("startDate").toString();
        Integer duration = Integer.parseInt(request.getParameter ("duration"));
        HttpSession session=request.getSession();  
        String _userid = (String)session.getAttribute("userID");

        //work on database part here
        try {
            
            session.setAttribute("startDate", startDate);
            session.setAttribute("duration", duration);
            
        //    out.println(fname + lname + email + pw + phone + driveclass + address + nric);
            
            Class.forName(driver).newInstance();
            Connection conn;
            conn = DriverManager.getConnection(url+database,user,password);
           // Statement stmt = conn.createStatement();
            String sqlinsert = "insert into booking(userID, pickupDate, pickupTime, returnDate, returnTime, pickupLocation, returnLocation, status, vehicleID, bookDate, extendReturnDate, extendStatus, totalPrice)values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            
            PreparedStatement ps = conn.prepareStatement(sqlinsert);
         //   InputStream is = part.getInputStream();
            
//            ps.setString(1, _userid);
//            ps.setString(2, pickupDate);
//            ps.setString(3, pickupTime);
//            ps.setString(4, returnDate);
//            ps.setString(5, returnTime);
//            ps.setString(6, pickupLocation);
//            ps.setString(7, returnLocation);
//            ps.setString(8, status);
////            ps.setString(9, bookingID);
//            ps.setString(9, vehicleID);
//            
//            ps.setString(10, bookDate);
//            ps.setString(11, extendReturnDate);
//            ps.setString(12, extendStatus);
//            ps.setString(13, totalPrice);
           
           
            ps.executeUpdate();
                
            log(sqlinsert);
            
            conn.close();
            //response.sendRedirect("viewAll.jsp");
            
        response.sendRedirect("customer/bookCar.jsp");
        } 
        catch (Exception ex) {
             ex.printStackTrace();
        }

    }
}
