/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.CartDAO;
import dao.OrderDAO;
import dto.CartItem;
import dto.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Gia Huy
 */

@WebServlet("/OrderController")
public class OrderController extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        OrderDAO orderDAO = new OrderDAO();
        CartDAO cartDAO = new CartDAO();
        

        try {
            if ("Checkout".equals(action)) {
                List<CartItem> cartItems = cartDAO.getCartItems(session);
                request.setAttribute("cartItems", cartItems);
                request.getRequestDispatcher("checkout.jsp").forward(request, response);
            } else if ("PlaceOrder".equals(action)) {
                String userID = ((User) session.getAttribute("userLoggedIn")).getUserID();
                double totalAmount = Double.parseDouble(request.getParameter("totalAmount"));
                orderDAO.placeOrder(userID, totalAmount, session);
                session.removeAttribute("cartItems");  // Clear the cart after placing order
                response.sendRedirect("orderConfirmation.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("ERROR", "Failed to process order.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}

