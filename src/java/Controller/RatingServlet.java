package Controller;


import DAO.RatingDAO;
import DAO.RatingDAOImpl;
import Model.Rating;
import DAO.BookingDAO;
import DAO.BookingDAOImpl;
import Model.Booking;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/RatingServlet"})
public class RatingServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        
            HttpSession session = request.getSession();
            String email = (String) session.getAttribute("email");
            String roomType = (String) session.getAttribute("roomType");
            int bookingID = (Integer) session.getAttribute("bookingID");
            
            String rating = request.getParameter("rating");
            String review = request.getParameter("review");
 
            
            RatingDAO dao = new RatingDAOImpl();
            Rating i = new Rating(email,rating,review, roomType);
        
            dao.insert(i);
            
            BookingDAO upd = new BookingDAOImpl();
            Booking b = new Booking();
            b.setBookingID(bookingID);
            b.setRate(1);
        
            upd.update(b);

            response.sendRedirect("home.jsp");
        
    }

}
