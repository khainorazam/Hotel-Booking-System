<%@page import="java.sql.Statement"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>MyProfile</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" crossorigin="anonymous">
    </head>
    <body>
        <%String email = (String) session.getAttribute("email");%>
        <%@include file="header.jsp" %>
        <br>
        <div class="container">
            <div class="row gutters">
                <div class="">
                    <div class="card h-100">
                        <%
                            String driver = "com.mysql.jdbc.Driver";
                            String connectionUrl = "jdbc:mysql://localhost:3306/";
                            String database = "owohotel";
                            String userid = "root";
                            String password = "";

                            String name;
                            String phone;
                            String address;

                            try {
                                Class.forName(driver);
                                Connection conn = DriverManager.getConnection(connectionUrl + database, userid, password);

                                String slt = ("select * from user where email='" + email + "'");
                                PreparedStatement ps = conn.prepareStatement(slt);

                                ResultSet rs = ps.executeQuery();

                                while (rs.next()) {
                                    email = rs.getString("email");
                                    name = rs.getString("name");
                                    phone = rs.getString("phone");
                                    address = rs.getString("address");

                                    session.setAttribute("email", email);
                                    session.setAttribute("name", name);
                                    session.setAttribute("phone", phone);
                                    session.setAttribute("address", address);

//                            response.sendRedirect("userProfile.jsp");

                        %>
                        
                        
                        <div class="card-body">
                            <form action="home.jsp" method="get">
                            <div class="row gutters">
                                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                    <h6 class="mb-2 text-primary">Personal Details</h6>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                    <div class="form-group">
                                        <label for="fullName">Name</label>
                                        <input type="text" name="name" class="form-control" id="name" value=<%=name%>>
                                    </div>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                    <div class="form-group">
                                        <label for="fullName">Email</label>
                                        <input type="text" class="form-control" id="email" value=<%=email%> disabled>
                                    </div>

                                </div>

                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                    <div class="form-group">
                                        <label for="phone">Phone</label>
                                        <input type="text" name="phone" class="form-control" id="phone" value=<%=phone%> >
                                    </div>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                    <div class="form-group">
                                        <label for="phone">Address</label>
                                        <input type="text" name="address" class="form-control" id="address" value=<%=address%>>
                                    </div>
                                </div>
                            </div>
                            <br>
                            <div class="row gutters">
                                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                    <div class="text-right">
                                        
                                            <div class="text-right">
                                                <input name="email" value="<%=email%>" hidden>
                                                <input type="submit" value="Cancel" >
                                                <input type="submit" value="Update" formaction="UpdateProfile" style="background-color: #3500A6; color: white; ">
                                                
                                            </div>
                                        
                                    </div>
                                </div>
                            </div>
                            <%
                                    }
                                    conn.close();

                                } catch (Exception ex) {
                                    ex.printStackTrace();
                                }
                            %>
                            </form>
                        </div>
                        
                    </div>
                </div>
            </div>
                            </div>
    </body>
</html>
