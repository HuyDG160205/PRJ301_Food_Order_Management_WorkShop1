/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.CartDAO;
import dto.CartItem;
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
@WebServlet("/CartController")
public class CartController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        CartDAO cartDAO = new CartDAO();

        try {
            List<CartItem> cartItems = cartDAO.getCartItems(session);
            request.setAttribute("cartItems", cartItems);
            request.getRequestDispatcher("cart.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("ERROR", "Failed to retrieve cart items.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        CartDAO cartDAO = new CartDAO();

        try {
            if ("AddToCart".equals(action)) {
                String foodID = request.getParameter("foodID");
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                cartDAO.addToCart(session, foodID, quantity);
                response.sendRedirect("MainController?action=ViewCart");
            } else if ("UpdateCart".equals(action)) {
                String foodID = request.getParameter("foodID");
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                cartDAO.updateCart(session, foodID, quantity);
                response.sendRedirect("MainController?action=ViewCart");
            } else if ("RemoveFromCart".equals(action)) {
                String foodID = request.getParameter("foodID");
                cartDAO.removeFromCart(session, foodID);
                response.sendRedirect("MainController?action=ViewCart");
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("ERROR", "Failed to process cart action.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}

