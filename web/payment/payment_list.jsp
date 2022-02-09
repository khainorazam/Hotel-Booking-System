<%-- 
    Document   : ProjectListPage
    Created on : Jan 11, 2022, 9:38:09 PM
    Author     : User
--%>

<%@page import="Model.Payment"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" crossorigin="anonymous">

        <link rel="stylesheet" href="ewallet.css">
        <title>Status List</title>
        <style>

            h1{text-align: center;padding:10px;}
            table{text-align: center;}
            #viewbutton{background-color: white;border:none;border-radius: 15px;padding:3px 15px;}
            #viewbutton:hover{background-color: red;color:white;}
            #backtomenu{background-color: burlywood; color: white;border-radius: 15px;padding:3px 15px;margin:20px;border:2px white solid;}
            #backtomenu:hover{background-color: black;color:white;}
            .container{
                padding-top: 10px;
                max-width: 60%;
            }
            td{
                font-size: 20px;
            }
            
            th{
                font-size: 25px;
            }
            

            input[type=submit],button {

                color: black;

            }

            #viewbutton{
                left: 10px;
            }

            form {
                margin: 10px;
                text-align: center;
                padding-top: 0px;
            }
            #back{
                color: white;
                font-size: 20px;
                width: 200px;
            }

        </style>
    </head>
    <body>

        <div>
            <h2><strong>Payment History</strong></h2><br>
        </div>


        <div class="container">

            <table class="table table-dark">
                <thead>
                    <tr>
                        <th scope="col">Payment ID</th>
                        <th scope="col">Room Type</th>
                        <th scope="col">Payment Type</th>
                        <th scope="col">Amount (RM)</th>
                        <th scope="col">Email</th>
                        <th scope="col">Action</th>
                    </tr>
                </thead>
                <tbody>    
                    <%
                        List<Payment> pr = (List<Payment>) request.getAttribute("ls");

                        for (int i = 0; i < pr.size(); i++) {
                    %>
                    <tr>
                        <td><%=pr.get(i).getPaymentID()%></td>
                        <td><%= pr.get(i).getRoomType()%></td>
                        <td><%= pr.get(i).getPaymentType()%></td>
                        <td><%=pr.get(i).getAmount()%></td>
                        <td><%= pr.get(i).getEmail()%></td>
                        <td>
                            <div style="display: flex;align-items: center; justify-content: center;">

                                <form action="PaymentController" method="get">
                                    <input type="hidden" name="paymentID" value="<%=pr.get(i).getPaymentID()%>">
                                    <input type="hidden" name="function" value="Delete">
                                    <input id="viewbutton" type="submit" value="Delete">
                                </form>
                            </div>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
        <div style="text-align: center;">
            <a href="homeadmin.jsp"><button id="back">Back to homepage</button></a>
        </div>
    </body>
</html>
