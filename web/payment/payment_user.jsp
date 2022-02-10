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
        <title>Payment User Page (index)</title>
        <link rel="stylesheet" href="payment.css">
        <style>


            .mid-bot{
                /*margin-top: 100px;*/
            }
            .method-container{
                display:flex;
                padding-top: 100px;

                justify-content: center;
            }
            .method-box{
                display: flex;
                background-color: #3500A6;
                min-width: 500px;
                justify-content: space-around;
                flex-direction: column;
                align-items: center;
                padding-bottom: 50px;
                border-radius: 10px;
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





        </style>
    </head>
    <body>
        
        <%@include file="headerPayment.jsp" %>
        <div class='method-container'>
            <div class="method-box">
                <div class='header mid-bot' style="color: white;">
                    Payment Method
                </div>


                <form action="BookingController" method="get">
                    <input type="hidden" name="bookingID" value="${param.bookingID}">
                    <input type="hidden" name="pic" value="${param.pic}">
                    <input type="hidden" name="email" value="${param.email}">
                    <input type="hidden" name="function" value="payment_ewallet">
                    <input class="button-1" type="submit" value="E-Wallet">
                </form>
                <form action="BookingController" method="get">
                    <input type="hidden" name="bookingID" value="${param.bookingID}">
                    <input type="hidden" name="pic" value="${param.pic}">
                    <input type="hidden" name="email" value="${param.email}">
                    <input type="hidden" name="function" value="payment_credit">
                    <input class="button-1" type="submit" value="Credit Card">
                </form>
                <form action="BookingController" method="get">
                    <input type="hidden" name="bookingID" value="${param.bookingID}">
                    <input type="hidden" name="pic" value="${param.pic}">
                    <input type="hidden" name="email" value="${param.email}">
                    <input type="hidden" name="function" value="payment_cash">
                    <input class="button-1" type="submit" value="Cash">
                </form>
                <form action="BookingController" method="get">
                    <input type="hidden" name="bookingID" value="${param.bookingID}">
                    <input type="hidden" name="pic" value="${param.pic}">
                    <input type="hidden" name="email" value="${param.email}">
                    <input type="hidden" name="function" value="payment_transfer">
                    <input class="button-1" type="submit" value="Online Transfer">
                </form>
            </div>
        </div>

    </body>
</html>
