<%-- 
    Document   : headerPayment
    Created on : Feb 9, 2022, 5:21:27 AM
    Author     : Amir's pc
--%>


<%@page import="Model.Booking"%>
<html>
    <head>
        <link rel="stylesheet" href="payment.css">
    </head>
    <body>
        <%
            Booking p = new Booking();
            p = (Booking) request.getAttribute("booking");
        %>

        <div class="header-container">

            <div class="header" >
                Payment</div>
        </div>
        <div class='middle'>

            <div class='flex-item img'>
                <img src="img/<%=p.getRoomType()%>.jpg" alt="cat" border="0">
            </div>
            <div class="flex-item details">
                <h2>Booking Details</h2>
                <p>Room Type: <%=p.getRoomType()%></p>
                <p>Duration of Stay: <%=p.getDuration()%> days</p>
                <h2>Customer Details</h2>
                <p><%=p.getEmail()%></p>
                
            </div>
            <div class="flex-item total">
                <h1>Total: RM <%=p.getPayment()%></h1>
            </div>

        </div>
    </body>
</html>
