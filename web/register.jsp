<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<html>  
    <head>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"  crossorigin="anonymous">

                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </head>
<body>  
    
    <%@include file="indexheader.jsp" %>

    <div class="container">
        <br/>
        <h1>Register</h1>
        <h4>Register an account today!</h4>
        <br/>
<form action="register" method="get">  
  
Name : <input type="text" name="name"/><br/><br/> 
Email : <input type="email" name="email"/><br/><br/>  
Password : <input type="password" name="password"/><br/><br/> 


Phone No : <input type="text" name="phoneno"/><br/><br/> 

<p>Register as :</p>
<input type="radio" id="level2" name="level" value="2">
<label for="level2"> Customer</label>
<input type="radio" id="level1" name="level" value="1">
<label for="level1"> Admin</label><br><br>

Address :  
<select name="address" id="address">  
      <option value="Johor">Johor</option>
      <option value="Kedah">Kedah</option>
      <option value="Kelantan">Kelantan</option>
      <option value="Kuala Lumpur">Kuala Lumpur</option>
      <option value="Labuan">Labuan</option>
      <option value="Melaka">Melaka</option>
      <option value="Negeri Sembilan">Negeri Sembilan</option>
      <option value="Pahang">Pahang</option>
      <option value="Penang">Penang</option>
      <option value="Perak">Perak</option>
      <option value="Perlis">Perlis</option>
      <option value="Putrajaya">Putrajaya</option>
      <option value="Sabah">Sabah</option>
      <option value="Sarawak">Sarawak</option>
      <option value="Selangor">Selangor</option>
      <option value="Terengganu">Terengganu</option> 

</select>  



  
  
<br/><br/>  
<input type="submit" value="Register"/>  
  
    </div>

</form>  
    

</body>  
</html>  