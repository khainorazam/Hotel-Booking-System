<%-- 
    Document   : ewallet_home
    Created on : Jan 10, 2022, 11:24:54 PM
    Author     : Amir's pc
--%>

<%@page import="Model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>E-Wallet Payment</title>
        <link rel="stylesheet" href="payment.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" crossorigin="anonymous">
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="ewallet.css">
        <style>


            .mid-bot{

                margin-top: 100px;
            }
            .method-container{
                display:flex;
                padding: 20px;
                margin-top: 100px;
                justify-content: center;
                
            }
            .method-box{
                display: flex;
                background-color: purple;
                min-width: 500px;
                justify-content: space-around;
                flex-direction: column;
                align-items: center;
                padding: 50px;
                color: white;
                
            }
            .btn{
                padding-top: 40px;
            }
            .btn2{
                width: 100px;
                height: 60px;
            }


        </style>
    </head>
    <body>
        <%
            User q = new User();
            q = (User) request.getAttribute("user");
        %>

        <%String email = (String) session.getAttribute("email");%>

        
        <div class="container">
            <div>
                <h2><strong>E-Wallet</strong></h2><br>
                <div class="row">
                    <img src="https://i.ibb.co/YRDFkrK/272889.png" alt="Snow" style="width:20%" class="dp">


                    <br>
<!--                    <div>Current Balance:  </div><br>
                    <div>RM <%=q.getEwallet_balance()%></div><br>-->

                    <form action="UserController" method="get">
                        <h1>Current Balance: RM <%=q.getEwallet_balance()%></h1>
                        <br>
                        <input type="hidden" name="email" value="${param.email}">
                        <input type="hidden" name="function" value="EwalletHome"><br>   
                        <input type="submit" value="Topup">
                        
                    </form>
                </div>
            </div>
        </div>

    </body>
</html>
