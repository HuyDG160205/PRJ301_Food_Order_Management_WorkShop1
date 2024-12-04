<%-- 
    Document   : fail
    Created on : May 13, 2024, 10:34:30 AM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Fail Page</title>
    </head>
    <body>
        <% 
            String error= (String)request.getAttribute("ERROR");
            if(error== null) error= "";
        %>
        <h1><%= error %></h1>
        <a href="login.html">Click here to try again</a>
    </body>
</html>
