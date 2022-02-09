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
                border-radius: 15px;
            }
            .btn{
                padding-top: 40px;
            }
            .btn2{
                width: 100px;
                height: 60px;
            }
            
            label{
                font-family: "Open Sans";
            }


        </style>
    </head>
    <body>
        <%
            User q = new User();
            q = (User) request.getAttribute("user");
        %>

        <%String email = (String) session.getAttribute("email");%>



        <div class="header-container">

            <div class="container">
                <div>
                    <h2><strong>E-Wallet</strong></h2><br>
                    <div class="row">
                        <img src="https://i.ibb.co/YRDFkrK/272889.png" alt="Snow" style="width:20%" class="dp">
                        
                        <br>

                        <form action="UserController" method="get">
                            <h1>Current Balance: RM <%=q.getEwallet_balance()%></h1><br>
                        </form>

                        <div class='method-container'>
                            <div class='method-box'>

                                <form id="pay" action="UserController" method="get">
                                    <label for="bank">Choose an amount</label><br>

                                    <select name="amount" id="amount">
                                        <option value="10">RM 10</option>
                                        <option value="20">RM 20</option>
                                        <option value="50">RM 50</option>
                                        <option value="100">RM 100</option>
                                    </select><br><br>
                                    <label for="bank">Choose a bank</label><br>
                                    <select name="paymentDesc" id="bank">
                                        <option value="maybank">Maybank</option>
                                        <option value="cimb">CIMB</option>
                                        <option value="bsn">BSN</option>
                                        <option value="bankIslam">Bank Islam</option>
                                    </select><br><br>
                                    <label for="username">Username</label><br>
                                    <input type="tel" id="username" name="username" placeholder="" required><br><br>
                                    <label for="password">Password</label><br>
                                    <input type="password" id="password" name="password1" placeholder="" required><br><br>
                                    <br><br>

                                    <input type="hidden" name="email" value="${param.email}">
                                    <input  type="hidden" name="ebal" value="<%=q.getEwallet_balance()%>">
                                    <input type="hidden" name="function" value="Topup_ewallet">
                                    
                                    <button type="reset" style="color: red;" >Reset Form</button>
                                    <input type="submit" style="color: green;" Value="Continue">
                                </form> 
                            </div>


                        </div>
                    </div>

                </div>

            </div>


    </body>
</html>
