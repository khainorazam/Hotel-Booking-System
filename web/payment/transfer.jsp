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
        <title>Online Transfer Payment</title>
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
            a{
                cursor: pointer;
            }



        </style>
    </head>
    <body>
        <%@include file="headerPayment.jsp" %>

        <div class='method-container'>
            <div class='method-box'>

                <form action="PaymentController" method="get">
                    <label for="bank">Choose a bank</label><br>

                    <select name="paymentDesc" id="bank">
                        <option value="maybank">Maybank</option>
                        <option value="cimb">CIMB</option>
                        <option value="bsn">BSN</option>
                        <option value="bankIslam">Bank Islam</option>
                    </select><br><br>
                    <label for="username">Username</label><br>
                    <input type="tel" id="username" name="username" placeholder="" required><br><br><br>
                    <label for="password">Password</label><br>
                    <input type="password" id="password" name="password1" placeholder="" required> <br><br><br>
                    <label for="tac">Tac number</label><br>
                    <input type="tel" id="tac" name="tac" placeholder="" required> 
                    <a  onclick="alert('your tac is 123')">Request</a><br><br><br>
                    <input type="hidden" name="bookingID" value="${param.bookingID}">
                    <input  type="hidden" name="roomType" value="<%=p.getRoomType()%>">
                    <input  type="hidden" name="amount" value="<%=p.getPayment()%>">
                    <input  type="hidden" name="email" value="${param.email}">
                    <input type="hidden" name="paymentType" value="Online Transfer">
                    <input type="hidden" name="function" value="Create Payment">
                    <button type="reset" style="color: red;" >Reset Form</button>
                    <input type="submit" value="Proceed">
                </form> 

            </div>
        </div>
    </body>
</html>
