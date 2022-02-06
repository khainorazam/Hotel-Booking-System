
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

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {
            HttpSession session = request.getSession();
            String email = (String) session.getAttribute("email");

            String driver = "com.mysql.jdbc.Driver";
            String database = "owohotel";
            String url = "jdbc:mysql://localhost:3306/owohotel";
            String user = "root";
            String password = "";

            String rating = request.getParameter("rating");
            String review = request.getParameter("review");
//int id=1;
//id++;
            String roomType = "single";

            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, user, password);

            String sqlinsert = "insert into rating (email,roomType,rating,review)values"
                    + "('" + email + "','" + roomType + "','" + rating + "','" + review + "')";

            log(sqlinsert);

            Statement stmt = conn.createStatement();
            stmt.executeUpdate(sqlinsert);

            conn.close();
            response.sendRedirect("home.jsp");

        } catch (Exception ex) {
            ex.printStackTrace(out);
        }
    }

}
