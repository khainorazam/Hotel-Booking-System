<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Booking</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            
            h1,
            h2,
            h3,
            h4,
            h5,
            h6,
            div,
            input,
            p,
            a {
            font-family: "Open Sans";
            margin: 0px;
            }

            body {
            margin: 10px auto;
            padding: 1em 1em;
            background-color: #D3D3D3;
            }

            h2{
            text-align: center;
            box-shadow: rgba(0, 0, 0, 0.16) 0px 3px 6px, rgba(0, 0, 0, 0.23) 0px 3px 6px;
            background-color: #3500A6;
            position: relative;
            border-radius: 10px;
            padding: 1em 1em;
            color: white;
            }

            .container-fluid,
            .container {
            max-width: 100%;
            }

            .card-container {
            padding: 100px 0px;
            -webkit-perspective: 1000;
            perspective: 1000;
            }

            .row{
            max-width: 80%;
            text-align: left;
            background-color: #3500A6;
            box-shadow: rgba(0, 0, 0, 0.16) 0px 3px 6px, rgba(0, 0, 0, 0.23) 0px 3px 6px;
            padding: 1em 1em;
            padding-top: 2em;
            overflow: hidden;
            position: relative;
            margin: 10px auto;
            color: white;
            border-radius: 10px;
            font-size: 20px;
            }
            
            .dp{
            background-color: #ffffff;
            box-shadow: rgba(0, 0, 0, 0.16) 0px 3px 6px, rgba(0, 0, 0, 0.23) 0px 3px 6px;
            padding: 0.5em 0.5em;
            overflow: hidden;
            margin: 10px auto 20px;
            display: block;
            border-radius: 0.5px;
            border-color: white;
            text-align: center;
            }
            
            .wishlist{
            margin: 10px auto 20px;
            display: block;
            }

            button {
            display: inline-block;
            background-color: black;
            border-radius: 20px;
            border: 4px double #cccccc;
            color: #eeeeee;
            text-align: center;
            font-size: 16px;
            padding: 10px;
            width: 150px;
            transition: all 0.5s;
            cursor: pointer;
            margin: 5px;
            float: right;
            }
      
            button:hover {
            background-color: #808080;
            color: black;
            }
            
            form {
            margin: 0 auto;
            text-align: center;
            padding-top: 50px;
            }

            .value-button {
            display: inline-block;
            border: 1px solid #ddd;
            margin: 0px;
            width: 40px;
            height: 20px;
            text-align: center;
            vertical-align: middle;
            padding: 11px 0;
            background: #eee;
            -webkit-touch-callout: none;
            -webkit-user-select: none;
            -khtml-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
            }

            .value-button:hover {
            cursor: pointer;
                }

            form #decrease {
            margin-right: -4px;
            border-radius: 8px 0 0 8px;
            }

            form #increase {
            margin-left: -4px;
            border-radius: 0 8px 8px 0;
            }

            form #input-wrap {
            margin: 0px;
            padding: 0px;
            }

            input#number {
            text-align: center;
            border: none;
            border-top: 1px solid #ddd;
            border-bottom: 1px solid #ddd;
            margin: 0px;
            width: 40px;
            height: 40px;
            }

            input[type=number]::-webkit-inner-spin-button,
            input[type=number]::-webkit-outer-spin-button {
            -webkit-appearance: none;
            margin: 0;
            }
        </style>
        
    </head>
    <body>
        <%! 
            String valid="false";
//            String valid=(String)session.getAttribute("valid");
        %> 
        <div class="container">
	<div>
            <h2><strong>Hotel</strong></h2><br>
            <div class="row">
                <img src="https://th.bing.com/th/id/OIP.2yafwQfSIm9scaOmB6VscgHaFj?pid=ImgDet&rs=1" alt="Snow" style="width:40%" class="dp">
                <%if(valid.equals("true")){%>
               <img src="https://www.nicepng.com/png/detail/172-1723156_heart-love-red-element-wedding-icon-love-heart.png" alt="Snow" style="width:2%" class="wishlist">
               <%} else{%>
               <a href="" >
                   <img src="https://www.clipartmax.com/png/full/78-788944_wish-list-best-wish-christmas-icon-wish-list.png" onclick="myFunction()" alt="Snow" style="width:2%" class="wishlist" id="WS">
               </a>
               
               <%}%>
                <br>
                <div>Name:  </div><br>
                <div>Location: </div><br>
                <div>Email: </div><br>
                <div>Phone no.: </div><br>
                <div>Room Type: </div><br>
                <div>Price per Night: </div>
            <form action="addBooking.java" method="get">
                Check-in Date: <br>
                <input  name="startDate" type="date"><br><br>
                Day: <br>
                <div class="value-button" id="decrease" onclick="decreaseValue()">-</div>
                <input name="duration" type="number" id="number" value="1" />
                <div class="value-button" id="increase" onclick="increaseValue()">+</div>
                <div class="button"><button type="button" >Book</button></div>
            </form>
            </div>
        </div>
        </div>
        <script>
            function increaseValue() {
            var value = parseInt(document.getElementById('number').value, 7);
            value = isNaN(value) ? 1 : value;
            value++;
            document.getElementById('number').value = value;
            }

            function decreaseValue() {
            var value = parseInt(document.getElementById('number').value, 7);
            value = isNaN(value) ? 1 : value;
            value < 2 ? value = 2 : '';
            value--;
            document.getElementById('number').value = value;
            }
            function myFunction() {
            document.getElementById("WS").src = "https://www.nicepng.com/png/detail/172-1723156_heart-love-red-element-wedding-icon-love-heart.png";
            }
         
        </script>
    </body>
</html>