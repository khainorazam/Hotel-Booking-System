
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
        <title>Help Center (Admin)</title>
    </head>
    <body>
        <%String email=(String)session.getAttribute("email");%>
        <%@include file="adminheader.jsp" %>
        <div class="container">
        <h1>Help Center (Admin)</h1>
        <!-- 1. Display all messages
        2. Pick one messageID
        3. Put in reply and submit
        4. Send to servlet to process into database
        -->
        
        <h1>List of questions</h1>
        
        <table class="table table-dark">
            <thead>
                <tr>
                    <th scope="col">Message ID</th>
                    <th scope="col">From</th>
                    <th scope="col">Question</th>
                    <th scope="col">Reply</th>
                    
                </tr>
            </thead>
            
            <tbody>
        
                        <%
                    String driver= "com.mysql.jdbc.Driver";
                    String database= "myproject";
                    String url= "jdbc:mysql://localhost:3306/owohotel";
                    String user= "root";
                    String password = "";
                    
                    try {
        
        //1 import packages -->sql 
        
        //2 load & register the driver
        Class.forName(driver);
        //3 create a connection            
        Connection conn = DriverManager.getConnection(url, user, password);
        
        //step 4 : create an sql statement
        String sqlselect = "select * from helpcenter";
        //step 5 : execute the statement
//        Statement stmt = conn.createStatement();
        PreparedStatement ps = conn.prepareStatement(sqlselect);

        
       
        ResultSet rs = ps.executeQuery();
        
        //step 6 : process the result
        while (rs.next()){
//            out.println("<h4> user id : " +rs.getString(1) +" user name :" +rs.getString(2)  +" Email : " +rs.getString("email")+"</h4>");
        
        %>
        
         <tr>
                    <th scope="row"><%=rs.getString("hcID")%></th>
                    
                    <td><%=rs.getString("email")%></td>
                    <td><%=rs.getString("message")%></td>
                    <td><%=rs.getString("reply")%></td>
                    
                    
                </tr>
        
                <%
                    }
        //step 7: close connection
        conn.close();
        
        }
        catch (Exception ex){
            
        }   
    

                %>
        
                        </tbody>
            
        </table>
        
                <form action="HelpAdminServlet" method="post">
                        Reply to:
            <select name="id">
            <option>Message ID</option>
            
            <%
             
                    
                    try {
        
        //1 import packages -->sql 
        
        //2 load & register the driver
        Class.forName(driver);
        //3 create a connection            
        Connection conn = DriverManager.getConnection(url, user, password);
        
        //step 4 : create an sql statement
        String sqlselect = "select * from helpcenter";
       
        //step 5 : execute the statement
//        Statement stmt = conn.createStatement();
        PreparedStatement ps = conn.prepareStatement(sqlselect);
        
        ResultSet rs = ps.executeQuery();
        while(rs.next()){
            %>
            <option><%=rs.getString("hcID")%></option>
            <%
        }
        
} catch (Exception e){

}
            
            %>
            </select>
            <br/><br/>
            
            <label for="reply">Reply:</label>
            <br>
            
            <textarea id="question" name="reply" rows="4" cols="50" required>
                      
            
            </textarea>
            <br><br>

            <input type="submit" value="Submit">
        </form>
                <h3>Message Status: <%=request.getParameter("name")%></h3>
                </div>
    </body>
</html>


