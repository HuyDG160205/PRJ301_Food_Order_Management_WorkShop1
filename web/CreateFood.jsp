<%-- 
    Document   : CreateFood
    Created on : Nov 29, 2024, 11:34:34 PM
    Author     : Gia Huy
--%>
<%@page import="dto.User"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
    <head>
        <title>Create Food</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f9;
                margin: 0;
                padding: 0;
            }
            .container {
                width: 50%;
                margin: 50px auto;
                background-color: #fff;
                padding: 30px;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }
            h2 {
                text-align: center;
                color: #333;
            }
            label {
                font-size: 14px;
                color: #555;
                display: block;
                margin-bottom: 8px;
            }
            input[type="text"], input[type="number"], input[type="submit"] {
                width: 100%;
                padding: 10px;
                margin-bottom: 15px;
                border: 1px solid #ccc;
                border-radius: 4px;
                font-size: 14px;
            }
            input[type="submit"] {
                background-color: #4CAF50;
                color: white;
                border: none;
                cursor: pointer;
                font-size: 16px;
                transition: background-color 0.3s ease;
            }
            input[type="submit"]:hover {
                background-color: #45a049;
            }
        </style>
    </head>
    <body>

        <%
            // Check if user is logged in and has admin privileges
            User user = (User) request.getSession().getAttribute("userLoggedIn");
            if (user == null || !user.getRoleID().equalsIgnoreCase("adm")) {
                response.sendRedirect("login.html");
                return; // Stop further execution
            }
        %>

        <div class="container">
            <h2>Create a New Food Item</h2>

            <form action="MainController" method="post">
                <input type="hidden" name="action" value="CreateFood">

                <label for="foodID">FoodID:</label>
                <input type="text" name="foodID" required><br>

                <label for="foodName">Food Name:</label>
                <input type="text" name="foodName" required><br>

                <label for="price">Price:</label>
                <input type="number" step="0.01" name="price" required><br>

                <label for="quantity">Quantity:</label>
                <input type="number" name="quantity" required><br>

                <label for="category">Category:</label>
                <input type="text" name="category" required><br>

                <input type="submit" value="Create Food">
            </form>
        </div>

    </body>
</html>
