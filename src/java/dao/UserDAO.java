/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import util.DatabaseConnection;

/**
 *
 * @author Gia Huy
 */
public class UserDAO {
    public User authenticateUser(String userID, String password) throws SQLException {
        User user = null;
        Connection cnn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            cnn = DatabaseConnection.getConnection();
            ptm = cnn.prepareStatement("Select fullname, email, phonenumber, roleID from tblUsers where [userid]=? and [password]=?");
            ptm.setString(1, userID);
            ptm.setString(2, password);
            rs = ptm.executeQuery();
            while(rs.next()){
                String fullname = rs.getString(1);
                String email = rs.getString(2);
                String phoneNumber = rs.getString(3);
                String roleID = rs.getString(4);
                user = new User(userID, fullname, email, phoneNumber, roleID, password); 
            }
            
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (cnn != null) {
                cnn.close();
            }
        }
        
        return user;
    }
    
    public boolean addUser(User user) throws Exception{
        PreparedStatement ptm = null;
        Connection cnn = null;
        try {
            cnn = DatabaseConnection.getConnection();
            ptm = cnn.prepareStatement("insert into tblusers values(?,?,?,?,?,?)");
            ptm.setString(1, user.getUserID());
            ptm.setString(2, user.getFullName());
            ptm.setString(3, user.getEmail());
            ptm.setString(4, user.getPhoneNumber());
            ptm.setString(5, user.getRoleID());
            ptm.setString(6, user.getPassword());
            
            return ptm.executeUpdate() > 0;
        } catch (Exception e) {
            throw e;
        } finally {
            if( cnn != null){
                cnn.close();
            }
            if( ptm != null) {
                ptm.close();
            }
        }
        
    }
}
