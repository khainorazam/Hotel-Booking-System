package Controller;


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

@WebServlet(urlPatterns = {"/addBooking"})
public class addBooking extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");
        String roomType = (String) session.getAttribute("roomType");
        Double price = (Double) session.getAttribute("price");
        String startDate = (String) session.getAttribute("startDate");
        int duration = (Integer) session.getAttribute("duration");

        BookingDAO dao = new BookingDAOImpl();
        Booking b = new Booking(email, roomType, duration, startDate, price);

        dao.insert(b);
        response.sendRedirect("home.jsp");

    }
}
