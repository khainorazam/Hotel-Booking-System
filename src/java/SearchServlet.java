import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.sql.*;
import java.sql.*;
import java.util.*;

public class SearchServlet extends HttpServlet{ 
 
 public void doPost(HttpServletRequest request, 
  HttpServletResponse response)
  throws ServletException,IOException{
  response.setContentType("text/html");
  PrintWriter out = response.getWriter();

  System.out.println("MySQL Connect Example.");
  
  
        String driver= "com.mysql.jdbc.Driver";
        String database= "owohotel";
        String url= "jdbc:mysql://localhost:3306/owohotel";
        String user= "root";
        String password = "";

  
  Statement st;
  try {
    Class.forName(driver).newInstance();
    Connection conn = DriverManager.getConnection(url, user, password);
    System.out.println("Connected to the database");
    String  hotel_name  = request.getParameter("hotel_name");
    String  location  = request.getParameter("location");
    String  room  = request.getParameter("room");

    ArrayList al=null;
    ArrayList searchlist =new ArrayList();
    String query = "select * from hotel where hotel_name='"+hotel_name+"' or location='"+location+"' or room='"+room+"' order by hotel";
    System.out.println("query " + query);
    st = conn.createStatement();
    ResultSet  rs = st.executeQuery(query);


    while(rs.next()){
    al  = new ArrayList();

    al.add(rs.getString(1));
    al.add(rs.getString(2));
    al.add(rs.getString(3));
    al.add(rs.getString(4));
    al.add(rs.getString(5));
    al.add(rs.getString(6));
    al.add(rs.getString(7));
    al.add(rs.getString(8));
    al.add(rs.getString(10));
    System.out.println("al :: "+al);
    searchlist.add(al);
    }

    request.setAttribute("searchlist",searchlist);

   System.out.println("search " + searchlist);

    // out.println("emp_list " + emp_list);

    String nextJSP = "/viewSearch.jsp";
    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextJSP);
    dispatcher.forward(request,response);
    conn.close();
    System.out.println("Disconnected from database");
    
  } catch (Exception e) {
    e.printStackTrace();
    }
  }
}