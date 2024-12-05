/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.FoodDAO;
import dto.FoodItem;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Gia Huy
 */
@WebServlet("/FoodController")
public class FoodController extends HttpServlet {
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        FoodDAO foodDAO = new FoodDAO();
        
        try {
            if ("ViewFoods".equals(action)) {
                List<FoodItem> foodItems = foodDAO.getAllFoodItems();
                request.setAttribute("foodItems", foodItems);
                request.getSession().setAttribute("foodItems", foodItems);
                request.getRequestDispatcher("foodList.jsp").forward(request, response);
            } else if ("EditFood".equals(action)) {
                String foodID = request.getParameter("foodID");
                FoodItem food = foodDAO.getFoodById(foodID);
                request.setAttribute("food", food);
                request.getRequestDispatcher("editFood.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("ERROR", "Error processing food request.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        FoodDAO foodDAO = new FoodDAO();
        
        try {
            if ("CreateFood".equals(action)) {
                String foodId = request.getParameter("foodID");
                String foodName = request.getParameter("foodName");
                double price = Double.parseDouble(request.getParameter("price"));
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                String category = request.getParameter("category");
                
                FoodItem food = new FoodItem(foodId, foodName, price, quantity, category);
                foodDAO.addFood(food);
                response.sendRedirect("MainController?action=ViewFoods");
            } else if ("UpdateFood".equals(action)) {
                String foodID = request.getParameter("foodID");
                String foodName = request.getParameter("foodName");
                double price = Double.parseDouble(request.getParameter("price"));
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                String category = request.getParameter("category");
                
                FoodItem food = new FoodItem(foodID, foodName, price, quantity, category);
                foodDAO.updateFood(food);
                response.sendRedirect("MainController?action=ViewFoods");
            } else if ("DeleteFood".equals(action)) {
                String foodID = request.getParameter("foodID");
                foodDAO.deleteFood(foodID);
                response.sendRedirect("MainController?action=ViewFoods");
            } else if ("ViewFoods".equals(action)) {
                String search = request.getParameter("searchFood");
                List<FoodItem> foodItems = foodDAO.getFoodByName(search);
                
                request.setAttribute("foodItems", foodItems);
                request.setAttribute("searchValue", search);
                request.getRequestDispatcher("foodList.jsp").forward(request, response);
                
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("ERROR", "Error processing food request.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
