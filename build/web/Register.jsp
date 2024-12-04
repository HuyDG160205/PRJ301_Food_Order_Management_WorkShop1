<%-- 
    Document   : Register
    Created on : Nov 29, 2024, 3:57:33 PM
    Author     : Gia Huy
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>User Registration</title>
    </head>
    <body>
        <h2>Register</h2>
        <form action="MainController" method="post">

            <label for="userId"> userId </label>
            <input type="text" name="userID" /> <br/>
            
            <label for="fullName">Full Name:</label>
            <input type="text" name="fullName" required><br><br>

            <label for="email">Email:</label>
            <input type="email" name="email" required><br><br>

            <label for="phoneNumber">Phone Number:</label>
            <input type="text" name="phoneNumber" required><br><br>

            <label for="password">Password:</label>
            <input type="password" name="password" required><br><br>

            <input type="submit"  name="action" value="Register">
        </form>
        <%
            String error = (String) request.getAttribute("ERROR");
            if (error != null) {
        %>
        <p style="color:red;"><%= error%></p>
        <%
            }
        %>
    </body>
</html>
