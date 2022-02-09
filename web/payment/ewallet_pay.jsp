<%-- 
    Document   : credit_card
    Created on : Dec 30, 2021, 2:45:59 AM
    Author     : Amir's pc
--%>

<%@page import="Model.Booking"%>
<%@page import="Model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>E-Wallet Payment</title>
        <link rel="stylesheet" href="payment.css">
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
                background-color: #3500A6;
                min-width: 500px;
                justify-content: space-around;
                flex-direction: column;
                align-items: center;
                padding: 50px;
                color: white;
                border-radius: 20px;
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

        <%@include file="headerPayment.jsp" %>


        <div class='method-container'>
            <div class='method-box'>


                <h2>Current Balance: RM <%=q.getEwallet_balance()%></h2>
                <div class="btn" >
                    <form action="UserController">
                        <input  type="hidden" name="function" value="EwalletHome">
                        <input  type="hidden" name="email" value="${param.email}">
                        <input class="button-1" type="submit" value="Top-Up">
                    </form>
                    <form id="pay" action="UserController">
                        <input type="hidden" name="bookingID" value="${param.bookingID}">
                        <input type="hidden" name="function" value="Pay by ewallet">
                        <input  type="hidden" name="paymentType" value="E-Wallet">
                        <input  type="hidden" name="roomType" value="<%=p.getRoomType()%>">
                        <input  type="hidden" name="amount" value="<%=p.getPayment()%>">
                        <input  type="hidden" name="email" value="${param.email}">
                        <input  id="myText" type="hidden" name="ebal" >
                        <input class="button-1" type="button" onclick="javascript:myFunction()" Value="Pay">
                    </form>

                    <!--<button class="btn2">Top Up</button>-->
                    <!--<button class="btn2" onclick="myFunction()">Pay</button>-->


                </div>

            </div>
        </div>

        <script>
            let total = <%=p.getPayment()%>;
            let e_bal = <%=q.getEwallet_balance()%>;
            let newBal = e_bal - total;
            function setNewBal() {
                document.getElementById("myText").value = newBal;
            }

            function myFunction() {

                if (e_bal < total) {
                    alert("Insufficent E-Wallet balance");
                } else {
                    setNewBal();
                    document.getElementById("pay").submit();
                }

            }



        </script>                

    </body>
</html>
