/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.CartItem;
import dto.Order;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import javax.servlet.http.HttpSession;
import util.DatabaseConnection;

/**
 *
 * @author Gia Huy
 */
public class OrderDAO {

    private final String insertIntoOrder = "INSERT INTO tblorders values(?,?,?,?)";
    private final String insertIntoOrderId = "INSERT INTO tblorderDetails (orderid, foodid, quantity, price) VALUES (?,?,?,?)";

    public void placeOrder(String userID, double totalAmount, HttpSession session) throws Exception {
        List<CartItem> cartList = (List<CartItem>) session.getAttribute("cartItems");
        String uniqueID = UUID.randomUUID().toString();

        //create a new javadate
        java.util.Date utilDate = new java.util.Date();

        // Convert java.util.Date to java.sql.Date
        java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
        Connection conn = null;
        try {
            conn = DatabaseConnection.getConnection();
            conn.setAutoCommit(false); // Start transaction

            try (PreparedStatement ptm = conn.prepareStatement(insertIntoOrder)) {
                ptm.setString(1, uniqueID);
                ptm.setString(2, userID);
                ptm.setDate(3, sqlDate);
                ptm.setDouble(4, totalAmount);
                ptm.executeUpdate();
            }

            for (CartItem cartItem : cartList) {
                try (PreparedStatement ptm = conn.prepareStatement(insertIntoOrderId)) {
                    ptm.setString(1, uniqueID);
                    ptm.setString(2, cartItem.getFoodID());
                    ptm.setInt(3, cartItem.getQuantity());
                    ptm.setDouble(4, cartItem.getPrice());
                    ptm.executeUpdate();
                }
            }

            conn.commit(); // Commit transaction if all operations succeed
        } catch (Exception e) {
            if (conn != null) {
                conn.rollback(); // Rollback transaction on failure
            }
            throw e;
        } finally {
            if (conn != null) {
                conn.setAutoCommit(true); // Reset auto-commit
                conn.close();
            }
        }
    }
    
    public List<Order> getListOrder() throws Exception {
        List<Order> orderList = new ArrayList<>();
        ResultSet rs = null;
        
        final String sql = "select * from tblOrders";
        
        try (PreparedStatement ptm = DatabaseConnection.getConnection().prepareStatement(sql)) {
            rs = ptm.executeQuery();
            while(rs.next()){
                String orderID = rs.getString(1);
                String userID = rs.getString(2);
                Date orderDat = rs.getDate(3);
                double totalAmount = rs.getDouble(4);
                orderList.add(new Order(orderID, userID, orderDat, totalAmount));
            }
            
        } catch (Exception e) {
            throw e;
        } finally {
            if(rs != null){
                rs.close();
            }
        }
        
        return orderList;
    }
}
