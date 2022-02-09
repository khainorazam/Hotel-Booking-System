import DAO.UserDAO;
import DAO.UserDAOImpl;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDateTime;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(urlPatterns = {"/UpdateProfile"})
public class UpdateProfile extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String driver = "com.mysql.jdbc.Driver";
        String database = "owohotel";
        String url = "jdbc:mysql://localhost:3306/";
        String user = "root";
        String password = "";
        
       
        String email = request.getParameter("email");
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        
        UserDAO upd = new UserDAOImpl();
            User u = new User();
            u.setEmail(email);
            u.setName(name);
            u.setPhone(phone);
            u.setAddress(address);
        
            upd.update(u);
            
            response.sendRedirect("home.jsp");
        
        
        
    }

}
