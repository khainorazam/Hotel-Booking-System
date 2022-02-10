<%-- 
    Document   : thanks
    Created on : Jan 2, 2022, 11:14:50 PM
    Author     : Amir's pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thank you Page</title>
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

                margin-top: 100px;
                justify-content: center;
            }
            .method-box{
                display: flex;

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


        </style>
    </head>

    <body>


        <div class="container">
            <div>
                <h2><strong>Payment (Complete)</strong></h2><br>
                <div class="row">
                    <br>
                    <form action="home.jsp">
                        <h1>Thank you for your payment</h1>
                        <h3>Please proceed to the homepage</h3><br>
                        <button >Homepage</button>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
