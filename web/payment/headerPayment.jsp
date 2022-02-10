<%-- 
    Document   : headerPayment
    Created on : Feb 9, 2022, 5:21:27 AM
    Author     : Amir's pc
--%>


<%@page import="Model.Booking"%>
<html>
    <head>
        <link rel="stylesheet" href="payment.css">
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <%
            Booking p = new Booking();
            p = (Booking) request.getAttribute("booking");
        %>
        

        <div class="header-container" style="background-color: #3500A6;">

            <div class="header" style="color: white">
                Payment</div>
        </div>
        <div class='middle'>

            <div class='flex-item img'>
                <img src="img/${param.pic}" alt="cat" border="0">
            </div>
            <div class="flex-item details">
                <h2 style="font-size:26px">Booking Details</h2>
                <p style="font-size:22px">Room Type: <%=p.getRoomType()%></p>
                <p style="font-size:22px">Duration of Stay: <%=p.getDuration()%> days</p>
                <h2 style="font-size:26px">Customer Details</h2>
                <p style="font-size:22px"><%=p.getEmail()%></p>
                
            </div>
            <div class="flex-item total">
                <h1>Total: RM <%=p.getPayment()%></h1>
            </div>

        </div>
    </body>
</html>
