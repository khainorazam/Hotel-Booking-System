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
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" crossorigin="anonymous">
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <%@include file="adminheader.jsp" %>
        <h1>Admin</h1>
        
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
        
        <div class="card item-rooms mb-3">
            <div class="card-body">
                <div class="row">
                    <div class="col-md-5">
                        <img src="assets/img/<?php echo $cat_arr[$row['category_id']]['cover_img'] ?>" alt="">
                    </div>
                    <div class="col-md-5" >
                        <h3><b><?php echo '$ '.number_format($cat_arr[$row['category_id']]['price'],2) ?></b><span> / per day</span></h3>

                        <h4><b>
                                <?php echo $cat_arr[$row['category_id']]['name'] ?>
                            </b></h4>
                        <div class="align-self-end mt-5">
                            <button class="btn btn-primary  float-right book_now" type="button" data-id="<?php echo $row['category_id'] ?>">Book now</button>
                        </div>
                    </div>
                </div>

            </div>
        </div>
                            <%
                            }
       
                        }
                        catch(Exception ex) {
                            ex.printStackTrace();
                        }
                    %>
    </body>
</html>
