<%-- 
    Document   : Register
    Created on : Nov 29, 2024, 3:57:33 PM
    Author     : Gia Huy
--%><%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>User Registration</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f9;
                margin: 0;
                padding: 20px;
            }
            .container {
                width: 50%;
                margin: 0 auto;
                background-color: white;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            h2 {
                text-align: center;
                color: #333;
            }
            label {
                font-size: 16px;
                color: #555;
            }
            input[type="text"], input[type="email"], input[type="password"] {
                width: 100%;
                padding: 8px;
                margin: 10px 0;
                border: 1px solid #ddd;
                border-radius: 4px;
                font-size: 16px;
            }
            input[type="submit"] {
                background-color: #4CAF50;
                color: white;
                padding: 10px 15px;
                border: none;
                border-radius: 4px;
                font-size: 16px;
                cursor: pointer;
                width: 100%;
                transition: background-color 0.3s;
            }
            input[type="submit"]:hover {
                background-color: #45a049;
            }
            .error-message {
                color: red;
                text-align: center;
                font-size: 16px;
                margin-top: 10px;
            }
            .form-group {
                margin-bottom: 15px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h2>User Registration</h2>
            <form action="MainController" method="post">
                <div class="form-group">
                    <label for="userId">User ID:</label>
                    <input type="text" name="userID" required /><br />
                </div>

                <div class="form-group">
                    <label for="fullName">Full Name:</label>
                    <input type="text" name="fullName" required /><br />
                </div>

                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" name="email" required /><br />
                </div>

                <div class="form-group">
                    <label for="phoneNumber">Phone Number:</label>
                    <input type="text" name="phoneNumber" required /><br />
                </div>

                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="password" name="password" required /><br />
                </div>

                <input type="submit" name="action" value="Register" />
            </form>

            <% 
                String error = (String) request.getAttribute("ERROR");
                if (error != null) {
            %>
            <p class="error-message"><%= error %></p>
            <% 
                }
            %>
        </div>
    </body>
</html>
