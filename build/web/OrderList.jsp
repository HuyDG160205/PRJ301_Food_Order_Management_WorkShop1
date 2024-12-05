<%-- 
    Document   : OrderList
    Created on : Dec 5, 2024, 2:56:21 PM
    Author     : Gia Huy
--%>
<%@page import="dto.User"%>
<%@page import="dto.Order"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order List</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f9;
                margin: 0;
                padding: 20px;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin: 20px 0;
            }
            table, th, td {
                border: 1px solid #ddd;
            }
            th, td {
                padding: 10px;
                text-align: left;
            }
            th {
                background-color: #4CAF50;
                color: white;
            }
            tr:nth-child(even) {
                background-color: #f2f2f2;
            }
            tr:hover {
                background-color: #ddd;
            }
            .checkout-btn {
                margin-top: 20px;
            }
            .checkout-btn a {
                display: inline-block;
                padding: 12px 20px;
                background-color: #4CAF50;
                color: white;
                text-decoration: none;
                border-radius: 5px;
                font-size: 16px;
                transition: background-color 0.3s;
            }
            .checkout-btn a:hover {
                background-color: #45a049;
            }
            .no-orders {
                font-size: 18px;
                color: #d9534f;
                text-align: center;
                margin-top: 20px;
            }
        </style>
    </head>
    <body>
        <%
            User user = (User) request.getSession().getAttribute("userLoggedIn");
            if (user == null || !user.getRoleID().equalsIgnoreCase("adm")) {
                response.sendRedirect("login.html");
            }
        %>

        <h2>Order List</h2>

        <table>
            <tr>
                <th>Order Id</th>
                <th>User Id</th>
                <th>Order Date</th>
                <th>Total Amount</th>
            </tr>   

            <%
                List<Order> orderList = (List<Order>) request.getAttribute("orderList");
                if (orderList != null && !orderList.isEmpty()) {
                    for (Order order : orderList) {
            %>
            <tr>
                <td><%=order.getOrderID()%></td>
                <td><%=order.getUserID()%></td>
                <td><%=order.getOrderDate()%></td>
                <td><%=order.getTotalAmount()%></td>
            </tr>
            <%  
                    }
                } else {
            %>
            <tr>
                <td colspan="4" class="no-orders">No orders found.</td>
            </tr>
            <% 
                }
            %>
        </table>

        <div class="checkout-btn">
            <a href="MainController?action=ViewFoods">Continue Shopping</a>
        </div>
    </body>
</html>

