<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BookingHistoryPage</title>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" crossorigin="anonymous">
        <link rel="stylesheet" href="style.css">
        <style>
            input{
                width: 70px;
                border-radius: 5px;
                margin:  2px;
            }
        </style>
    </head>
    <body>
        <%String email = (String) session.getAttribute("email");%>

        <%@include file="header.jsp" %>

        <div class="container-fluid " >
            <div class="row justify-content-center" >
                <div class="col-5 mt-3">
                    <div class="card" style="background-color: #D3D3D3; border-color:#D3D3D3; ">
                        <h4 style="text-align: center">History List</h4>
                    </div>
                </div>  
            </div>
        </div>
        <%
            String driver = "com.mysql.jdbc.Driver";
            String connectionUrl = "jdbc:mysql://localhost:3306/";
            String database = "owohotel";
            String userid = "root";
            String password = "";

            //String id = " ";
            session.setAttribute("email", email);
            try {
                Class.forName(driver);
                Connection conn = DriverManager.getConnection(connectionUrl + database, userid, password);

                //prepared statement
                String sqlselect = "select * from booking where email='" + email + "'";
                PreparedStatement ps = conn.prepareStatement(sqlselect);

                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    String sqlselect2 = "select * from room where roomType='" + rs.getString("roomType") + "'";
                    PreparedStatement ps2 = conn.prepareStatement(sqlselect2);

                    ResultSet rs2 = ps2.executeQuery();

                    while (rs2.next()) {

        %>    



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
                                <h5 class="card-title">Booked date: <%=rs.getString("startDate")%></h5>
                                <h5 class="card-title">Day/Night: <%=rs.getString("duration")%></h5>


                                <form action="BookingController" method="get">
                                    <input type="hidden" name="pic" value="<%=rs2.getString("picture")%>">
                                    <input type="hidden" name="email" value="<% out.print(email);%>">
                                    <input type="hidden" name="function" value="payment_main">
                                    <input name="bookingID" value="<%=rs.getInt("bookingID")%>" hidden>
                                    <%
                                        if (rs.getBoolean("isPaid")) {
                                    %>
                                    <input type="submit" value="Pay" disabled="" >
                                    <%
                                    } else {
                                    %>

                                    <input type="submit" value="Pay" style="background-color: #999900; color: white; ">
                                    <%
                                        }
                                    %>
                                </form> 

                                <form action="rating.jsp" method="get">
                                    <input name="bookingID" value="<%=rs.getInt("bookingID")%>" hidden>
                                    <%
                                        if (rs.getBoolean("rate")) {
                                    %>
                                    <input type="submit" value="Rate" disabled="" >
                                    <%
                                    } else {
                                    %>

                                    <input type="submit" value="Rate" style="background-color: #999900; color: white; ">
                                    <%
                                        }
                                    %>
                                </form> 
                            </div>
                        </div>  
                    </div>
                </div>
            </div>
        </div>


        <%
                    }
                }

            } catch (Exception ex) {
                ex.printStackTrace();
            }
        %>

    </body>
</html>
