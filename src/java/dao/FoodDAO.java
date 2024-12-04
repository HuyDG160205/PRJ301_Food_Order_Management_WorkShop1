/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.FoodItem;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import util.DatabaseConnection;

/**
 *
 * @author Gia Huy
 */
public class FoodDAO {

    Connection cnn = null;

    public List<FoodItem> getAllFoodItems() throws Exception {
        PreparedStatement ptm = null;
        List<FoodItem> foodList = new ArrayList<>();
        ResultSet rs = null;
        try {
            cnn = DatabaseConnection.getConnection();
            ptm = cnn.prepareStatement("select * from tblFooditems");
            rs = ptm.executeQuery();
            while (rs.next()) {
                String foodid = rs.getString(1);
                String foodname = rs.getString(2);
                double price = rs.getDouble(3);
                int quantiy = rs.getInt(4);
                String category = rs.getString(5);

                foodList.add(new FoodItem(foodid, foodname, price, quantiy, category));
            }
        } catch (Exception e) {
            throw e;
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (cnn != null) {
                cnn.close();
            }
            if (ptm != null) {
                ptm.close();
            }
        }

        if (foodList.isEmpty()) {
            return null;
        }

        return foodList;
    }

    public FoodItem getFoodById(String foodId) throws Exception {
        PreparedStatement ptm = null;
        ResultSet rs = null;
        FoodItem food = null;
        try {
            cnn = DatabaseConnection.getConnection();
            ptm = cnn.prepareStatement("select * from tblFoodItems where [foodID]=?");
            ptm.setString(1, foodId);
            rs = ptm.executeQuery();
            while (rs.next()) {
                String foodname = rs.getString(2);
                double price = rs.getDouble(3);
                int quantity = rs.getInt(4);
                String cate = rs.getString(5);

                food = new FoodItem(foodId, foodname, price, quantity, cate);

            }// end while
        } catch (Exception e) {
            throw e;
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (cnn != null) {
                cnn.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return food;
    }

    public boolean addFood(FoodItem food) throws Exception {
        PreparedStatement ptm = null;
        try {
            cnn = DatabaseConnection.getConnection();
            ptm = cnn.prepareStatement("insert into tblfooditems values (?,?,?,?,?)");
            ptm.setString(1, food.getFoodID());
            ptm.setString(2, food.getFoodName());
            ptm.setDouble(3, food.getPrice());
            ptm.setInt(4, food.getQuantity());
            ptm.setString(5, food.getCategory());

            return ptm.executeUpdate() > 0;
        } catch (Exception e) {
            throw e;
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (cnn != null) {
                cnn.close();
            }
        }
    }

    public boolean updateFood(FoodItem food) throws Exception {

        String sql = "update tblFoodItems set foodname=?,price=?, quantity=?, category=? where foodid=?";

        try (PreparedStatement ptm = DatabaseConnection.getConnection().prepareStatement(sql)) {

            ptm.setString(1, food.getFoodName());
            ptm.setDouble(2, food.getPrice());
            ptm.setInt(3, food.getQuantity());
            ptm.setString(4, food.getCategory());
            ptm.setString(5, food.getFoodID());

            return ptm.executeUpdate() > 0;

        } catch (Exception e) {
            throw e;
        } finally {
            if (cnn != null) {
                cnn.close();
            }
        }
    }

    public boolean deleteFood(String foodID) throws Exception {
        try (PreparedStatement ptm = DatabaseConnection.getConnection().prepareStatement("delete tblFooditems where foodid=?")) {
            ptm.setString(1, foodID);

            return ptm.executeUpdate() > 0;
        } catch (Exception e) {
            throw e;
        } finally {
            if (cnn != null) {
                cnn.close();
            }
        }
    }

}
