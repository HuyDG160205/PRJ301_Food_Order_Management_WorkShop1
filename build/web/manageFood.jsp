<%-- 
    Document   : manageFood
    Created on : Nov 29, 2024, 5:04:41 PM
    Author     : Gia Huy
--%>

<%@page import="dto.User"%>
<%@page import="dao.FoodDAO"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="dto.FoodItem" %>

<html>
    <head>
        <title>Manage Food</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f9;
                margin: 0;
                padding: 0;
            }
            .container {
                width: 80%;
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
            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }
            th, td {
                padding: 10px;
                text-align: center;
                border: 1px solid #ddd;
            }
            th {
                background-color: #4CAF50;
                color: white;
            }
            td input[type="submit"] {
                padding: 6px 12px;
                background-color: #4CAF50;
                color: white;
                border: none;
                cursor: pointer;
                font-size: 14px;
                transition: background-color 0.3s ease;
            }
            td input[type="submit"]:hover {
                background-color: #45a049;
            }
            a {
                padding: 8px 15px;
                background-color: #4CAF50;
                color: white;
                text-decoration: none;
                border-radius: 4px;
                margin-bottom: 20px;
                display: inline-block;
                font-size: 16px;
            }
            a:hover {
                background-color: #45a049;
            }
        </style>
    </head>
    <body>

        <%
            // Check if user is logged in and has admin privileges
            User user = (User) request.getSession().getAttribute("userLoggedIn");
            if (user == null || !user.getRoleID().equalsIgnoreCase("ADM")) {
                response.sendRedirect("login.html");
                return; // Stop further execution
            }
        %>

        <div class="container">
            <h2>Manage Food Items</h2>
            <a href="CreateFood.jsp">Add New Food Item</a>

            <table>
                <tr>
                    <th>Food Name</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Category</th>
                    <th>Actions</th>
                </tr>

                <%
                    // Get the list of food items from the session
                    List<FoodItem> foodItems = (List<FoodItem>) request.getSession().getAttribute("foodItems");
                    if (foodItems != null) {
                        for (FoodItem item : foodItems) {
                %>
                <tr>
                    <td><%= item.getFoodName()%></td>
                    <td><%= item.getPrice()%></td>
                    <td><%= item.getQuantity()%></td>
                    <td><%= item.getCategory()%></td>
                    <td>
                        <!-- Edit Food Form -->
                        <form action="MainController" method="get" style="display:inline;">
                            <input type="hidden" name="foodID" value="<%= item.getFoodID()%>">
                            <input type="submit" name="action" value="EditFood">
                        </form>

                        <!-- Delete Food Form -->
                        <form action="MainController" method="post" style="display:inline;">
                            <input type="hidden" name="foodID" value="<%= item.getFoodID()%>">
                            <input type="submit" name="action" value="DeleteFood">
                        </form>
                    </td>
                </tr>
                <%
                        }
                    }
                %>
            </table>
            <div class="checkout-btn">
                <a href="MainController?action=ViewFoods">Continue Shopping</a>
            </div>
        </div>

    </body>
</html>
