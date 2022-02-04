<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" crossorigin="anonymous">
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <%String email=(String)session.getAttribute("email");%>
        
        <%@include file="header.jsp" %>
        
        
			
                    <%
                        String driver = "com.mysql.jdbc.Driver";
                        String connectionUrl = "jdbc:mysql://localhost:3306/";
                        String database = "owohotel";
                        String userid = "root";
                        String password = "";
                        
                        //String id = " ";
                        
                        try {
                            Class.forName(driver);
                            Connection conn = DriverManager.getConnection(connectionUrl+database,userid,password);
                           
                            //prepared statement
                            String sqlselect = "select * from room";
                            PreparedStatement ps = conn.prepareStatement(sqlselect);
   
                            ResultSet rs = ps.executeQuery();
                            
                            while(rs.next()){
                                
                            %>    
                    
            <form action="wishlistValidation" method="get"> 
                                                              
            <div class="container-fluid " >
                <div class="row justify-content-center" >
                    <div class="col-5 mt-3">
                        <div class="card">
                            <div class="card-horizontal">
                                <div class="img-square-wrapper">
                                    <img class="" src="img/<%=rs.getString("picture")%>" alt="hotel image" width="300" height="180">
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title"><%=rs.getString("roomType")%></h4>
                                    <h5 class="card-title">RM <%=rs.getString("price")%></h5>
                                    <h5 class="card-title"><%=rs.getString("no_of_pax")%>pax</h5>
                                    
                                    <input name="roomType" value="<%=rs.getString("roomType")%>" hidden>
                                    <input name="email" value="<%=email%>" hidden>
                                    <input type="submit" value="book" >
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
                        catch(Exception ex) {
                            ex.printStackTrace();
                        }
                    %>
                    
    </body>
</html>