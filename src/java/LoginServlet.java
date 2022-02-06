
import java.io.IOException;
import java.io.PrintWriter;
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
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        HttpSession session = request.getSession();

        String useremail;
        String userpass;
        String userType;

        String driver = "com.mysql.jdbc.Driver";
        String database = "owohotel";
        String url = "jdbc:mysql://localhost:3306/owohotel";
        String user = "root";
        String password = "";

        //accept paramaters from index.html page
        String u = request.getParameter("email");
        String p = request.getParameter("password");

        //database
        try {
//            out.println(u+p);
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, user, password);

            Statement stm = conn.createStatement();
            String slt = ("select * from user where email='" + u + "' and password='" + p + "'");
            ResultSet rs = stm.executeQuery(slt);

            log(slt);

            if (rs.next()) {
                //if username and password true
                useremail = rs.getString("email");
                userpass = rs.getString("password");
                userType = rs.getString("level");

                if (userType.equals("1")) {
                    session.setAttribute("email", u);
                    response.sendRedirect("homeadmin.jsp");
                    
                } else {
                    session.setAttribute("email", u);
                    response.sendRedirect("home.jsp");
                }

                
                
            } else {
                //wrong username and password
                out.println("Wrong username and password...");
            }
            conn.close();

        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e.getMessage());
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private static class con {

        private static Statement createStatement() {
            throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        }

        public con() {
        }
    }

}
