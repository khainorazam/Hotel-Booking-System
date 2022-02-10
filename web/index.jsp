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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="style.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <style>
            /*  Helper Styles */
            body {
                font-family: Varela Round;
                background: #f1f1f1;

            }

            a {
                text-decoration: none;
            }

            /* Card Styles */

            .card-sl {
                border-radius: 8px;
                box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
            }

            .card-image img {
                max-height: 100%;
                max-width: 100%;
                border-radius: 8px 8px 0px 0;
            }

            .card-action {
                position: relative;
                float: right;
                margin-top: -25px;
                margin-right: 20px;
                z-index: 2;
                color: #E26D5C;
                background: #fff;
                border-radius: 100%;
                padding: 15px;
                font-size: 15px;
                box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.2), 0 1px 2px 0 rgba(0, 0, 0, 0.19);
            }

            .card-action:hover {
                color: #fff;
                background: #E26D5C;
                -webkit-animation: pulse 1.5s infinite;
            }

            .card-heading {
                font-size: 18px;
                font-weight: bold;
                background: #fff;
                padding: 10px 15px;
            }

            .card-text {
                padding: 10px 15px;
                background: #fff;
                font-size: 14px;
                color: #636262;
            }

            .card-button {
                display: flex;
                justify-content: center;
                padding: 10px 0;
                width: 100%;
                background-color: #1F487E;
                color: #fff;
                border-radius: 0 0 8px 8px;
            }

            .card-button:hover {
                text-decoration: none;
                background-color: #1D3461;
                color: #fff;

            }


            @-webkit-keyframes pulse {
                0% {
                    -moz-transform: scale(0.9);
                    -ms-transform: scale(0.9);
                    -webkit-transform: scale(0.9);
                    transform: scale(0.9);
                }

                70% {
                    -moz-transform: scale(1);
                    -ms-transform: scale(1);
                    -webkit-transform: scale(1);
                    transform: scale(1);
                    box-shadow: 0 0 0 50px rgba(90, 153, 212, 0);
                }

                100% {
                    -moz-transform: scale(0.9);
                    -ms-transform: scale(0.9);
                    -webkit-transform: scale(0.9);
                    transform: scale(0.9);
                    box-shadow: 0 0 0 0 rgba(90, 153, 212, 0);
                }
            }





        </style>
    </head>
    <body>

        <%@include file="indexheader.jsp" %>

        <!-- Jumbotron -->
        <div
            class="bg-image p-5 text-center shadow-1-strong rounded mb-5 text-white"
            style="background-image: url('https://mdbcdn.b-cdn.net/img/new/slides/003.webp');"
            >
            <h1 class="mb-3 h2">OWO Hotel </h1>

            <p>
                A luxurious hotel for couples, families and friends to escape from their busy life
            </p>
        </div>
        <!-- Jumbotron -->

        <div class="container" style="margin-top:50px;">

            <div class="row">
                <%
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
                        String sqlselect = "select * from room";
                        PreparedStatement ps = conn.prepareStatement(sqlselect);

                        ResultSet rs = ps.executeQuery();

                        while (rs.next()) {

                %>
                <div class="col-md-3">
                    <div class="card-sl">
                        <div class="card-image">
                            <img
                                src="img/<%=rs.getString("picture")%>" />
                        </div>

                        <!--<a class="card-action" href="#"><i class="fa fa-heart"></i></a>-->
                        <div class="card-heading">
                            <%=rs.getString("roomType")%>
                        </div>
                        <div class="card-text">
                            RM <%=rs.getString("price")%><br>
                            <%=rs.getString("no_of_pax")%> Person<br>
                            <%=rs.getString("Description")%>
                        </div>



                        <a href="viewrating.jsp?roomType=<%= rs.getString("roomType")%>" class="card-button" > Details</a>

                    </div>

                </div>

                <%
                        }
                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }
                %>  
            </div> 
        </div>
            
            <footer class="page-footer font-small purple pt-4 fixed-bottom">
            <%@include file="footer.jsp" %>
            </footer>


    </body>
    
</html>
