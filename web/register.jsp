<html>  
    <head>
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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    </head>
<body>  
    <%@include file="header.jsp" %>
    <div class="container">
        <h1>Register</h1>
        <br/>
<form action="register" method="get">  
  
Name : <input type="text" name="name"/><br/><br/> 
Email : <input type="email" name="email"/><br/><br/>  
Password : <input type="password" name="password"/><br/><br/> 


Phone No : <input type="text" name="phoneno"/><br/><br/> 

<p>Register as :</p>
<input type="radio" id="level1" name="level" value="1">
<label for="level1"> Customer</label>
<input type="radio" id="level2" name="level" value="2">
<label for="level2"> Admin</label><br><br>

Address :  
<select name="address" id="address">  
<option value="Kuala Lumpur">Kuala Lumpur</option>  
<option value="Johor">Johor</option>  
<option value="Sabah">Sabah</option>  
</select>  



  
  
<br/><br/>  
<input type="submit" value="Register"/>  
  
    </div>

</form>  
    

</body>  
</html>  