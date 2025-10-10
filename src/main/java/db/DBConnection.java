package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    public static Connection getConnection() {
        Connection conn = null;
        try {
            // Load the MySQL driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Create connection
            conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/habit_tracker?useSSL=false&serverTimezone=UTC",
                "root", 
                "Pavxx@02"
            );
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }
}

