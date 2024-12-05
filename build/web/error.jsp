<%-- 
    Document   : fail
    Created on : May 13, 2024, 10:34:30 AM
    Author     : PC
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Fail Page</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f9;
                text-align: center;
                padding: 50px;
            }
            h1 {
                color: #d9534f;
                font-size: 24px;
                margin-bottom: 20px;
            }
            a {
                display: inline-block;
                background-color: #4CAF50;
                color: white;
                text-decoration: none;
                padding: 12px 20px;
                border-radius: 4px;
                font-size: 16px;
                transition: background-color 0.3s ease;
            }
            a:hover {
                background-color: #45a049;
            }
        </style>
    </head>
    <body>
        <% 
            String error = (String) request.getAttribute("ERROR");
            if (error == null) error = "An unknown error occurred.";
        %>
        
        <h1><%= error %></h1>
        <a href="login.html">Click here to try again</a>
    </body>
</html>
