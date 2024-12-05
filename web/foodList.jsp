<%-- 
    Document   : foodList
    Created on : Dec 2, 2024, 8:49:19 PM
    Author     : Gia Huy
--%>

<%@page import="dto.User"%>
<%@page import="dto.FoodItem"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FoodList</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f9;
                margin: 0;
                padding: 0;
            }
            .container {
                width: 80%;
                margin: 20px auto;
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
            td input[type="text"] {
                width: 50px;
                padding: 5px;
                text-align: center;
            }
            .button {
                padding: 10px 20px;
                background-color: #4CAF50;
                color: white;
                border: none;
                cursor: pointer;
                font-size: 14px;
            }
            .button:hover {
                background-color: #45a049;
            }
            .admin-link {
                margin-top: 20px;
                display: block;
                text-align: center;
            }
        </style>
    </head>
    <body>
        <%
            // Check if user is logged in
            User user = (User) request.getSession().getAttribute("userLoggedIn");
            if (user == null) {
                response.sendRedirect("login.html");
                return; // Stop further execution
            }
            
            String search = (String) request.getAttribute("searchValue");
            if(search == null){
                search = "";
            } 

        %>

        <div class="container">
            <!-- Button to View Foods -->
            <form action="MainController" method="POST">
                <input type="text" name="searchFood"  placeholder="Search" value="<%=search%>" />
                <input class="button" type="submit" name="action" value="ViewFoods"/>
            </form>

            <!-- Display Food List -->
            <table>
                <tr>
                    <th>Food Name</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Category</th>
                    <th>Add</th>
                </tr>
                <%
                    List<FoodItem> foodList = (List<FoodItem>) request.getAttribute("foodItems");
                    if (foodList != null) {
                        for (FoodItem food : foodList) {
                %>
                <tr>
                <form action="MainController" method="post">
                    <input type="hidden" name="foodID" value="<%=food.getFoodID()%>"/>
                    <td><%= food.getFoodName()%></td>
                    <td><%= food.getPrice()%></td>
                    <td>
                        <input type="text" name="quantity"/>
                    </td>
                    <td><%= food.getCategory()%></td>
                    <td>
                        <input class="button" type="submit" name="action" value="AddToCart"/>
                    </td>
                </form>
                </tr>
                <%
                        }
                    }
                %>
            </table>

            <!-- Manage Food Link for Admin -->
            <%
                if ("adm".equalsIgnoreCase(user.getRoleID())) {
            %>
            <div class="admin-link">
                <a href="manageFood.jsp">Manage Food</a>
            </div>
            <div class="admin-link">
                <a href="MainController?action=OrderList">See order List</a>
            </div>
            <%
                }
            %>
            <div>
                <a href="MainController?action=Logout">Log out</a>
            </div>
        </div>
    </body>
</html>
