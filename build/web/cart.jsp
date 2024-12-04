<%-- 
    Document   : cart.jsp
    Created on : Nov 29, 2024, 3:59:29 PM
    Author     : Gia Huy
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="dto.CartItem" %>
<html>
    <head>
        <title>Your Cart</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f9;
                padding: 20px;
                margin: 0;
            }
            .container {
                width: 80%;
                margin: auto;
                background-color: white;
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
                padding: 12px;
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
            td input[type="number"] {
                width: 60px;
                padding: 5px;
            }
            td input[type="submit"] {
                padding: 5px 10px;
                background-color: #4CAF50;
                color: white;
                border: none;
                cursor: pointer;
                font-size: 14px;
                border-radius: 4px;
                transition: background-color 0.3s ease;
            }
            td input[type="submit"]:hover {
                background-color: #45a049;
            }
            a {
                display: inline-block;
                margin-top: 20px;
                padding: 12px 20px;
                background-color: #4CAF50;
                color: white;
                text-decoration: none;
                border-radius: 4px;
                font-size: 16px;
                transition: background-color 0.3s ease;
            }
            a:hover {
                background-color: #45a049;
            }
            .checkout-btn {
                text-align: center;
                margin-top: 30px;
            }
            .empty-cart {
                text-align: center;
                color: #ff0000;
                font-size: 18px;
            }
        </style>
    </head>
    <body>

        <div class="container">
            <h2>Your Shopping Cart</h2>

            <table>
                <tr>
                    <th>Food Name</th>
                    <th>Quantity</th>
                    <th>Price</th>
                    <th>Total</th>
                    <th>Actions</th>
                </tr>
                <%
                    List<CartItem> cartItems = (List<CartItem>) request.getAttribute("cartItems");
                    if (cartItems != null && !cartItems.isEmpty()) {
                        for (CartItem item : cartItems) {
                %>
                <tr>
                    <td><%= item.getFoodName()%></td>
                    <td><%= item.getQuantity()%></td>
                    <td>$<%= item.getPrice()%></td>
                    <td>$<%= item.getTotal()%></td>
                    <td>
                        <form action="MainController" method="post" style="display:inline;">
                            <input type="hidden" name="action" value="UpdateCart">
                            <input type="hidden" name="foodID" value="<%= item.getFoodID()%>">
                            <input type="number" name="quantity" value="<%= item.getQuantity()%>" min="1">
                            <input type="submit" value="Update">
                        </form>
                        <form action="MainController" method="post" style="display:inline;">
                            <input type="hidden" name="action" value="RemoveFromCart">
                            <input type="hidden" name="foodID" value="<%= item.getFoodID()%>">
                            <input type="submit" value="Remove">
                        </form>
                    </td>
                </tr>
                <%
                    }
                } else {
                %>
                <tr>
                    <td colspan="5" class="empty-cart">Your cart is empty.</td>
                </tr>
                <%
                    }
                %>
            </table>

            <div class="checkout-btn">
                <a href="MainController?action=ViewFoods">Continue Shopping</a>
            </div>

            <div class="checkout-btn">
                <form action="MainController" method="post">
                    <input type="hidden" name="action" value="Checkout">
                    <input type="submit" value="Proceed to Checkout">
                </form>
            </div>
        </div>

    </body>
</html>

