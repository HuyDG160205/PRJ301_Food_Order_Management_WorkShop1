/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

/**
 *
 * @author Gia Huy
 */
public class CartItem {
    private String foodID;
    private double price;
    private int quantity;
    private String foodName;

    public CartItem() {
    }

    public CartItem(String foodID, double price, int quantity, String foodName) {
        this.foodID = foodID;
        this.price = price;
        this.quantity = quantity;
        this.foodName = foodName;
    }
    
    
    public double getTotal(){
        return quantity * price;
    }

    public String getFoodID() {
        return foodID;
    }

    public void setFoodID(String foodID) {
        this.foodID = foodID;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getFoodName() {
        return foodName;
    }

    public void setFoodName(String foodName) {
        this.foodName = foodName;
    }
    
    
    
}
