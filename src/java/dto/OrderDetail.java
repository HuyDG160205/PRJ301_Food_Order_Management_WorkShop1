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
public class OrderDetail {
    private String ID;
    private String orderID;
    private String foodID;
    private int quantity;
    private double price;

    public OrderDetail() {
    }

    public OrderDetail(String ID, String orderID, String foodID, int quantity, double price) {
        this.ID = ID;
        this.orderID = orderID;
        this.foodID = foodID;
        this.quantity = quantity;
        this.price = price;
    }
    
    public double getTotal(){
        return quantity * price;
    }

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }

    public String getFoodID() {
        return foodID;
    }

    public void setFoodID(String foodID) {
        this.foodID = foodID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
    
    
    
    
}
