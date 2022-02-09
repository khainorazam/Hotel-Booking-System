
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Wishlist</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
         <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" crossorigin="anonymous">
    </head>
    <body>
        <%String email=(String)session.getAttribute("email");%>
        
        <%@include file="header.jsp" %>
        <div class="container">
            <br/>
        <h1>Wishlist</h1>
        
   
                
                <div class="container-fluid " >
            <div class="row justify-content-center" >
                <div class="col-5 mt-3">
                    <div class="card" style="background-color: #D3D3D3; border-color:#D3D3D3; ">
                        <h4 style="text-align: center">Your Wishlist(s)</h4>
                        
                    </div>
                </div>  
            </div>
        </div>
        <%
            String driver= "com.mysql.jdbc.Driver";
                    String database= "myproject";
                    String url= "jdbc:mysql://localhost:3306/owohotel";
                    String user= "root";
                    String password = "";
            String connectionUrl = "jdbc:mysql://localhost:3306/";
            
            String userid = "root";
            

            //String id = " ";
            session.setAttribute("email", email);
            
            try {
                Class.forName(driver);
                Connection conn = DriverManager.getConnection(url, userid, password);

                //prepared statement
                String sqlselect = "select * from wishlist where email='" + email + "'";
                PreparedStatement ps = conn.prepareStatement(sqlselect);

                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    
                    String sqlselect2 = "select * from room where roomType='" + rs.getString("roomType") + "'";
                    PreparedStatement ps2 = conn.prepareStatement(sqlselect2);

                    ResultSet rs2 = ps2.executeQuery();

                    while (rs2.next()) {

        %>    

        <form action="wishlistValidation" method="get"> 

            <div class="container-fluid " >
                <div class="row justify-content-center" >
                    <div class="col-5 mt-3">
                        <div class="card">
                            <div class="card-horizontal">
                                <div class="img-square-wrapper">
                                    <img class="" src="img/<%=rs2.getString("picture")%>" alt="hotel image" width="300" height="180">
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title"><%=rs2.getString("roomType")%></h4>
                                    <h5 class="card-title">RM <%=rs2.getString("price")%></h5>
                                    <h5 class="card-title"><%=rs2.getString("no_of_pax")%> pax</h5>
                                    
                                    <input name="roomType" value="<%=rs2.getString("roomType")%>" hidden>
                                    <input name="email" value="<%=email%>" hidden>
                                    <input type="submit" value="Book" >
                                    <input type="submit" value="Remove" formaction="RemoveWishlist" style="background-color: #f44336; color: white; " >
                                    
                                </div>
                            </div>  
                        </div>
                    </div>
                </div>
            </div>
        </form> 
        <%
                    }
                }

            } catch (Exception ex) {
                ex.printStackTrace();
            }
        %>
    </body>
</html>

<!--add function to remove from wishlist inside the page, after submit it will 
move to servlet and then redirect to wishlist page-->