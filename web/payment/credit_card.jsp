<%-- 
    Document   : credit_card
    Created on : Dec 30, 2021, 2:45:59 AM
    Author     : Amir's pc
--%>
<%@page import="Model.Booking"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Credit Card Payment</title>
        <link rel="stylesheet" href="payment.css">

        <style>


            .mid-bot{

                margin-top: 100px;
            }
            .method-container{
                display:flex;

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
                padding: 10px;
                color: white;
                border-radius: 20px;
            }


        </style>
    </head>
    <body>
        <%@include file="headerPayment.jsp" %>
        <div class='method-container'>
            <div class='method-box'>

                <form action="PaymentController" method="get">
                    <label for="credit">Credit Card</label><br>
                    <input type="text" placeholder="" required><br><br><br>
                    <label>Security Code</label><br>
                    <input placeholder="" required><br><br><br>
                    <label>Exp date</label><br>
                    <input placeholder="" required><br><br><br>
                    <input type="hidden" name="bookingID" value="${param.bookingID}">
                    <input  type="hidden" name="roomType" value="<%=p.getRoomType()%>">
                    <input  type="hidden" name="amount" value="<%=p.getPayment()%>">
                    <input  type="hidden" name="email" value="${param.email}">
                    <input type="hidden" name="paymentType" value="Credit card">
                    <input type="hidden" name="function" value="Create Payment">
                    <div class="form-group">
                        <label class="col-md-4 control-label"></label>
                        <div class="col-md-4">
                            <button type="reset" style="color: red;" >Reset Form</button>
                            <button type="submit" style="color: green;" >Submit Form</button>
                        </div>
                    </div>
                </form> 

            </div>
        </div>
    </body>
</html>
