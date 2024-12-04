<%-- 
    Document   : editFood
    Created on : Nov 29, 2024, 11:34:59 PM
    Author     : Gia Huy
--%>
<%@page import="dto.User"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dto.FoodItem" %>

<html>
<head>
    <title>Edit Food</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 60%;
            margin: 50px auto;
            background-color: #fff;
            padding: 20px;
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
        .welcome-message {
            font-size: 18px;
            color: #555;
            text-align: right;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>

<%
    // Check if the user is logged in and has admin privileges
    User user = (User) request.getSession().getAttribute("userLoggedIn");

    if (user == null || !user.getRoleID().equalsIgnoreCase("adm")) {
        response.sendRedirect("login.html");
        return; // Stop further execution
    }
%>

<div class="container">
    <div class="welcome-message">
        Welcome, <%= user.getFullName() %>
    </div>

    <%
        // Fetch the food item to be edited
        FoodItem food = (FoodItem) request.getAttribute("food");
    %>

    <h2>Edit Food: <%= food.getFoodName() %></h2>

    <form action="MainController" method="post">
        <input type="hidden" name="foodID" value="<%= food.getFoodID() %>">

        <label for="foodName">Food Name:</label>
        <input type="text" name="foodName" value="<%= food.getFoodName() %>" required>

        <label for="price">Price:</label>
        <input type="number" step="0.01" name="price" value="<%= food.getPrice() %>" required>

        <label for="quantity">Quantity:</label>
        <input type="number" name="quantity" value="<%= food.getQuantity() %>" required>

        <label for="category">Category:</label>
        <input type="text" name="category" value="<%= food.getCategory() %>" required>

        <input type="submit" name="action" value="UpdateFood">
    </form>
</div>

</body>
</html>
