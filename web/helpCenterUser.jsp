<%-- 
    Document   : messageUser
    Created on : Jan 19, 2022, 12:51:02 AM
    Author     : khain
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Help Center (User)</title>
    </head>
    <body>
        <h1>Help Center</h1>
        
        <form action="helpsvlt">
            <label for="question">Hi! How can we help?</label>
            <br>
            <textarea id="question" name="question" rows="4" cols="50" required>
                      
            
            </textarea>
            <br><br>
            
            <input type="submit" value="Submit">
        </form>
    </body>
</html>
