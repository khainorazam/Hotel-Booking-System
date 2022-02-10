<%-- 
    Document   : payment_user
    Created on : Dec 29, 2021, 3:23:09 PM
    Author     : Amir's pc
--%>
<%@page import="Model.Booking"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cash Page</title>
        <link rel="stylesheet" href="payment.css">
        <style>


            .mid-bot{

                margin-top: 100px;
            }
            .method-container{
                display:flex;


                justify-content: center;
            }
            .method-box{
                display: flex;
                background-color: purple;
                min-width: 500px;
                justify-content: space-around;
                flex-direction: column;
                align-items: center;
            }
            .flex-item2{
                width: 100px;
                margin: 10px;
                border: 3px solid black;

            }
            .button{
                display: block;     
                height: 100%;
                width: 100%;
            }
            .btn{
                width: 200px;
                height: 80px
            }


        </style>
    </head>
    <body>
        <%@include file="headerPayment.jsp" %>

        <div class='header mid-bot' style="color: black;">
            Please Proceed To The Counter
        </div>
        <div class='method-container'>
            <form action="PaymentController" method="get">
                <input type="hidden" name="bookingID" value="${param.bookingID}">
                <input  type="hidden" name="roomType" value="<%=p.getRoomType()%>">
                <input  type="hidden" name="amount" value="<%=p.getPayment()%>">
                <input  type="hidden" name="email" value="${param.email}">
                <input type="hidden" name="paymentType" value="Cash">
                <input type="hidden" name="function" value="Create Payment">
                <input class="button-1" type="submit" value="Pay" >
            </form>
        </div>
    </body>
</html>
