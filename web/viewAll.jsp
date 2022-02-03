<%-- 
    Document   : ViewAll
    Created on : Dec 27, 2021, 4:09:31 PM
    Author     : khain
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
        <title>Project 008 - JDBC MySQL Database (viewAll.jsp)</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" crossorigin>
    </head>
    <body>
        <div class="container">
        <h1>Hello World!</h1>
        
        <table class="table table-dark">
            <thead>
                <tr>
                    <th scope="col">Email</th>
                    <th scope="col">Name</th>
                    <th scope="col">Password</th>
                    <th scope="col">Phone No.</th>
                    <th scope="col">Level</th>
                    <th scope="col">Address</th>
                    <th scope="col">E-Wallet Balance</th>
                </tr>
            </thead>
            
            <tbody>
                <%
                    String driver= "com.mysql.jdbc.Driver";
                    String database= "myproject";
                    String url= "jdbc:mysql://localhost:3306/owohotel";
                    String user= "root";
                    String password = "";
                    
                    try {
        
        //1 import packages -->sql 
        
        //2 load & register the driver
        Class.forName(driver);
        //3 create a connection            
        Connection conn = DriverManager.getConnection(url, user, password);
        
        //step 4 : create an sql statement
        String sqlselect = "select * from user";

        //step 5 : execute the statement
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(sqlselect);
        
        //step 6 : process the result
        while (rs.next()){
//            out.println("<h4> user id : " +rs.getString(1) +" user name :" +rs.getString(2)  +" Email : " +rs.getString("email")+"</h4>");
        
        %>
        
        <tr>
                    <th scope="row"><%=rs.getString("email")%></th>
                    
                    <td><%=rs.getString("name")%></td>
                    <td><%=rs.getString("password")%></td>
                    <td><%=rs.getString("phone")%></td>
                    <td><%=rs.getInt("level")%></td>
                    <td><%=rs.getString("address")%></td>
                    <td><%=rs.getDouble("ewallet")%></td>
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
