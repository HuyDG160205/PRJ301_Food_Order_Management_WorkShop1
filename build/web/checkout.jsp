<%-- 
    Document   : checkout
    Created on : Nov 29, 2024, 4:47:33 PM
    Author     : Gia Huy
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="dto.CartItem" %>

<html>
    <head>
        <title>Checkout</title>
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
            td {
                background-color: #f9f9f9;
            }
            td:hover {
                background-color: #f1f1f1;
            }
            .total {
                font-size: 18px;
                font-weight: bold;
                margin-top: 20px;
            }
            input[type="submit"] {
                padding: 10px 20px;
                background-color: #4CAF50;
                color: white;
                border: none;
                cursor: pointer;
                font-size: 16px;
                border-radius: 4px;
                transition: background-color 0.3s ease;
            }
            input[type="submit"]:hover {
                background-color: #45a049;
            }
            .btn-container {
                text-align: center;
                margin-top: 20px;
            }
        </style>
    </head>
    <body>

        <div class="container">
            <h2>Checkout</h2>

            <table>
                <tr>
                    <th>Food Name</th>
                    <th>Quantity</th>
                    <th>Price</th>
                    <th>Total</th>
                </tr>
                <%
                    List<CartItem> cartItems = (List<CartItem>) request.getAttribute("cartItems");
                    double totalAmount = 0.0;
                    if (cartItems != null && !cartItems.isEmpty()) {
                        for (CartItem item : cartItems) {
                            totalAmount += item.getTotal();
                %>
                <tr>
                    <td><%= item.getFoodName()%></td>
                    <td><%= item.getQuantity()%></td>
                    <td><%= item.getPrice()%></td>
                    <td><%= item.getTotal()%></td>
                </tr>
                <%
                        }
                    }
                %>
            </table>

            <div class="total">
                <h3>Total Amount: $<%= totalAmount%></h3>
            </div>

            <div class="btn-container">
                <form action="MainController" method="post" style="display:inline;">
                    <input type="hidden" name="action" value="PlaceOrder">
                    <input type="hidden" name="totalAmount" value="<%= totalAmount%>">
                    <input type="submit" value="Confirm Order">
                </form>
                <form action="MainController" style="display:inline;">
                    <input type="hidden" name="action" value="AddToCart">
                    <input type="submit" value="Go back">
                </form>
            </div>
        </div>

    </body>
</html>
