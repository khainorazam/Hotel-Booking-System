<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
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
        <title>Booking</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" crossorigin="anonymous">
        <style>

            .card {
                box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
                max-width: 70%;
                margin: auto;
                text-align: center;
                font-family: arial;
            }

            .title {
                color: grey;
                font-size: 18px;
            }
            #form-custom {
                width: 300px;
                margin: 0 auto;
                text-align: center;
                padding-top: 50px;
            }

            .value-button {
                display: inline-block;
                border: 1px solid #ddd;
                margin: 0px;
                width: 40px;
                height: 40px;
                text-align: center;
                vertical-align: middle;
                padding: 11px 0;
                background: #eee;
                -webkit-touch-callout: none;
                -webkit-user-select: none;
                -khtml-user-select: none;
                -moz-user-select: none;
                -ms-user-select: none;
                user-select: none;
            }

            .value-button:hover {
                cursor: pointer;
            }

            form #decrease {
                margin-right: -4px;
                border-radius: 8px 0 0 8px;
            }

            form #increase {
                margin-left: -4px;
                border-radius: 0 8px 8px 0;
            }

            form #input-wrap {
                margin: 0px;
                padding: 0px;
            }

            input#number {
                text-align: center;
                border: none;
                border-top: 1px solid #ddd;
                border-bottom: 1px solid #ddd;
                margin: 0px;
                width: 40px;
                height: 40px;
            }

            input[type=number]::-webkit-inner-spin-button,
            input[type=number]::-webkit-outer-spin-button {
                -webkit-appearance: none;
                margin: 0;
            }

        </style>

    </head>
    <body>

        <%
            String valid = (String) session.getAttribute("valid");
            String email = (String) session.getAttribute("email");
            String roomType = (String) session.getAttribute("roomType");

            Date today = (new java.util.Date());
            DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            String formattedDate = df.format(today);

            String driver = "com.mysql.jdbc.Driver";
            String connectionUrl = "jdbc:mysql://localhost:3306/";
            String database = "owohotel";
            String userid = "root";
            String password = "";

            //String id = " ";
            try {
                Class.forName(driver);
                Connection conn = DriverManager.getConnection(connectionUrl + database, userid, password);

                //prepared statement
                String sqlselect = ("select * from room where roomType='" + roomType + "'");
                PreparedStatement ps = conn.prepareStatement(sqlselect);

                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
        %> 

        <%@include file="header.jsp" %>
        <div class="container-fluid" >
            <br>
            <div class="card" style="background-color: #E6E6FA; "><br>
                <div class="text-center">
                    <img src="img/<%=rs.getString("picture")%>" alt="hotel image" style="width:40%" class="rounded-circle">
                </div>
                <br>
                <%if (valid.equals("true")) {%>
                
                <img src="https://cdn-icons-png.flaticon.com/512/833/833472.png" style="display: block; margin-left: auto; margin-right: auto; width:2%;">
                <%} else {%>
                <form onclick="myFunction()" action="InsertWishlist" method="post"> 
                    <input name="email" value="<%=email%>" hidden>
                    <input name="roomType" value="<%=roomType%>" hidden>
                    <input type="image" src="https://cdn-icons-png.flaticon.com/512/833/833300.png" alt="Submit" width=2%>
                </form> 
                <%}%>
                <br>
                <h5>Room Type:</h5>
                <h1><%=rs.getString("roomType")%></h1><br>
                <h5>Number of Pack: <%=rs.getString("no_of_pax")%> person per room</h5>
                <h5>Price per Night: RM <%=rs.getString("price")%></h5>
                
                <form action="bookingValidation" method="get" id="form-custom">
                        Check-in Date: <br>
                        <input  name="startDate" type="date" min = '<%= formattedDate%>'><br><br>
                        Day: <br>
                        <div class="value-button" id="decrease" onclick="decreaseValue()">-</div>
                        <input name="duration" type="number" id="number" value="1" />
                        <div class="value-button" id="increase" onclick="increaseValue()">+</div>
                        <%
                            session.setAttribute("email", email);
                            session.setAttribute("roomType", roomType);
                            session.setAttribute("price", rs.getDouble("price"));
                            session.setAttribute("quantity", rs.getInt("quantity"));
                        %>
                        <div class="button"><input type="submit" value="Book" style="background-color: #3500A6; color: white; "></div>
                </form><br>

            </div>

            <script>
                function increaseValue() {
                    var value = parseInt(document.getElementById('number').value, 7);
                    value = isNaN(value) ? 1 : value;
                    value++;
                    document.getElementById('number').value = value;
                }

                function decreaseValue() {
                    var value = parseInt(document.getElementById('number').value, 7);
                    value = isNaN(value) ? 1 : value;
                    value < 2 ? value = 2 : '';
                    value--;
                    document.getElementById('number').value = value;
                }

            </script>
        </div>
        <%
                }

            } catch (Exception ex) {
                ex.printStackTrace();
            }
        %>

         <script>
            function myFunction() {
                alert("Room added to wishlist!");
            }
        </script>
    </body>
</html>
