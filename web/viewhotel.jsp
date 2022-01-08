<%-- 
    Document   : viewhotel
    Created on : Jan 8, 2022, 1:01:34 PM
    Author     : FAIZ
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" crossorigin>
    </head>
    <body>
        
        <div class="container">
        <h1>Hotel List</h1>
        
        <div class="col-md-4">
                <form action="search.jsp" method="post">
                    <div class="form-group col-md-8" > 
                    <label>Search</label>
                    <input type="text" class="form-control" name="q" placeholder="Search hotel"><br>
                    
                    
                    <Button class="btn btn-success" style="width: 80px;">Submit</Button>
                    </div>
                </form>
        </div>
        
        <table class="table table-dark">
            <thead>
                <tr>
                    <th scope="col">Hotel</th>
                    <th scope="col">Location</th>
                    <th scope="col">Room Type</th>
                    <th scope="col">Price</th>
                </tr>
            </thead>
            
            <tbody>
                <%
                    String driver= "com.mysql.jdbc.Driver";
                    String database= "myproject";
                    String url= "jdbc:mysql://localhost:3306/owohotel";
                    String user= "root";
                    String password = "";
                    
                    String query = request.getParameter("q");
                    try {
        
                //1 import packages -->sql 

                //2 load & register the driver
                Class.forName(driver);
                //3 create a connection            
                Connection conn = DriverManager.getConnection(url, user, password);

                //step 4 : create an sql statement
                String sqlselect = "select * from hotel";

                //step 5 : execute the statement

                String data;
                    if(query!=null){
                    data = "select*from hotel where hotelname like '%"+query+"%' or location like '%"+query+"%' or price like '%"+query+"%'  ";
                    } else{
                    data = "select*from hotel order by hotelname";
                    }

                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(data);

                //step 6 : process the result
                while (rs.next()){
        //            out.println("<h4> user id : " +rs.getString(1) +" user name :" +rs.getString(2)  +" Email : " +rs.getString("email")+"</h4>");

                %>
        
        <tr>
                    <th scope="row"><%=rs.getString("hotelname")%></th>
                    
                    <td><%=rs.getString("location")%></td>
                    <td><%=rs.getString("roomtype")%></td>
                    <td><%=rs.getString("price")%></td>
                </tr>
        
                <%
                    }
        //step 7: close connection
        conn.close();
        
        }
        catch (Exception ex){
            
        }   
    

                %>
                
            </tbody>
            
        </table>
        </div>
    </body>
</html>
