/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author SwordLake
 */
public class DatabaseConnection {
    public static Connection getConnection() 
        throws ClassNotFoundException, SQLException {
        //1. Load Driver
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        //2. Create connection String
            //syntax: protocol:DBMS_Name://ip:port;databaseName=....
        String con = "jdbc:sqlserver://"
                + "localhost:1433;"
                + "databaseName=FoodOrderDB;encrypt=true;trustServerCertificate=true";
        //3. Open connection
        Connection connection = DriverManager.getConnection(con, "sa", "12345");
        
        return connection;
    }
}
