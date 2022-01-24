
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
         
        <style>
            .parent {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            grid-template-rows: repeat(2, 1fr);
            grid-column-gap: 0px;
            grid-row-gap: 0px;
            }

            .div1 { grid-area: 1 / 1 / 2 / 2; }
            .div2 { grid-area: 1 / 2 / 2 / 3; }
            .div3 { grid-area: 2 / 1 / 3 / 2; }
            .div4 { grid-area: 2 / 2 / 3 / 3; }
        </style>
        
    </head>
    <body>
        <h1>HOMEPAGE</h1>
        
       <div class="parent">
           <div class="div1"> <a href=""><h2>Div 1</h2></a> </div>
            <div class="div2"> <a href=""><h2>Div 2</h2></a> </div>
            <div class="div3"> <a href=""><h2>Div 3</h2></a></div>
           <div class="div4"> <a href=""><h2>Div 4</h2></a></div>
        </div>
    </body>
</html>