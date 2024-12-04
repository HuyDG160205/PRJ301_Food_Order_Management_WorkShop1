/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.CartItem;
import dto.FoodItem;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;
import util.DatabaseConnection;

/**
 *
 * @author Gia Huy
 */
public class CartDAO {

    public List<CartItem> getCartItems(HttpSession session) {
        List<CartItem> cartList = (List<CartItem>) session.getAttribute("cartItems");
        if (cartList != null) {
            return cartList;
        }

        cartList = new ArrayList<>();

        return cartList;
    }

    public void addToCart(HttpSession session, String foodID, int quantity) {
        List<FoodItem> foodList = (List<FoodItem>) session.getAttribute("foodItems");
        FoodItem food = null;
        for (FoodItem foodItem : foodList) {
            if (foodItem.getFoodID().equals(foodID)) {
                food = foodItem;
                break;
            }
        }

        List<CartItem> cartList = (List<CartItem>) session.getAttribute("cartItems");

        if (cartList != null) {

            //if cartitem already exist then increase quantity
            for (CartItem cartItem : cartList) {
                if (cartItem.getFoodID().equalsIgnoreCase(foodID)) {
                    cartItem.setQuantity(quantity + cartItem.getQuantity());
                    session.setAttribute("cartItems", cartList);
                    return;
                }
            }

            //else make new cart
            cartList.add(new CartItem(food.getFoodID(), food.getPrice(), quantity, food.getFoodName()));
        } else {

            //if cartItem doesnt exist then make a new one
            cartList = new ArrayList<>();
            cartList.add(new CartItem(food.getFoodID(), food.getPrice(), quantity, food.getFoodName()));
        }

        //set cartItem as cartList
        session.setAttribute("cartItems", cartList);

    }

    public void updateCart(HttpSession session, String foodID, int quantity) {
        List<CartItem> cartList = (List<CartItem>) session.getAttribute("cartItems");

        for (CartItem cartItem : cartList) {
            if (cartItem.getFoodID().equalsIgnoreCase(foodID)) {
                cartItem.setQuantity(quantity);
                session.setAttribute("cartItems", cartList);
                return;
            }
        }
    }

    public void removeFromCart(HttpSession session, String foodID) {
        List<CartItem> cartList = (List<CartItem>) session.getAttribute("cartItems");

        int indexToRemove = -1;
        
        for(int i =0 ;i<= cartList.size() -1 ;i++){
            if(cartList.get(i).getFoodID().equalsIgnoreCase(foodID)){
                indexToRemove = i;
                break;
            }
        }
        
        cartList.remove(indexToRemove);
        
        session.setAttribute("cartItems", cartList);
        
    }

}
