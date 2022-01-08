<%-- 
    Document   : search
    Created on : Jan 8, 2022, 7:05:04 AM
    Author     : FAIZ
--%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        
    </head>
    
    <body>
        <h1>Search Page</h1>
        <div class="row">
            <div class="col-md-4">
                <h3>SEARCH JSP</h3>
            </div>
            <div class="col-md-4">
                <form action="search.jsp" method="post">
                    <input type="text" class="form-control" name="q" placeholder="Search hotel">
                </form>
            </div>
            
        </div>
        
        <div>
            <table class="table table-bordered table-striped table-hover">
                <thead>
                    <tr>
                        <th>Hotel Name</th>
                        <th>Location</th>
                        <th>Room Type</th>
                        <th>Person Accommodate</th>
                        <th>Price</th> 
                    </tr>
                </thead>
                <tbody>
                    <%
                    String driver= "com.mysql.jdbc.Driver";
                    String database= "owohotel";
                    String url= "jdbc:mysql://localhost:3306/owohotel";
                    String user= "root";
                    String password = "";
                    
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection(url, user, password);
                    
                    Statement stat=null;
                    ResultSet res = null;
                    Statement stm = conn.createStatement();
                    String query = request.getParameter("q");
                    String data;
                    if(query!=null){
                        data = "select*from crud where name like '%"+query+"%' or email like '%"+query+"%' or phone like '%"+query+"%'  ";
                    } else{
                        data = "select*from crud order by id desc";
                    }
                    
                    res = stat.executeQuery(data);
                    while(res.next()){
                    %> 
                    <tr>
                        <td><%=res.getString("hotelname")%></td>
                        <td><%=res.getString("location")%></td>
                        <td><%=res.getString("roomtype")%></td>
                        <td><%=res.getString("pax")%></td>
                        <td><%=res.getString("price")%></td>
                    </tr>
                    
                </tbody>
            </table>
        </div>
    </body>
</html>
