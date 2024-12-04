<%-- 
    Document   : orderConfirmation
    Created on : Dec 4, 2024, 10:40:43 PM
    Author     : Gia Huy
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Confirmation</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f9;
                text-align: center;
                padding: 50px;
            }
            h1 {
                color: #4CAF50;
                font-size: 2.5em;
            }
            a {
                display: inline-block;
                margin-top: 20px;
                padding: 12px 20px;
                background-color: #4CAF50;
                color: white;
                text-decoration: none;
                border-radius: 4px;
                font-size: 1.2em;
                transition: background-color 0.3s ease;
            }
            a:hover {
                background-color: #45a049;
            }
        </style>
    </head>
    <body>

        <h1>Ordered Successfully!</h1>
        <p>Your order has been placed successfully. Thank you for shopping with us!</p>

        <a href="foodList.jsp">Order More</a>

    </body>
</html>
