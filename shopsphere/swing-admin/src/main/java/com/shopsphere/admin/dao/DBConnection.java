package com.shopsphere.admin.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    private static final String DEFAULT_URL = "jdbc:mysql://localhost:3306/shopsphere?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
    private static final String DEFAULT_USER = "root";
    private static final String DEFAULT_PASS = "root";

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            System.err.println("MySQL Driver not found on classpath: " + e.getMessage());
        }
    }

    private DBConnection() {}

    public static Connection getConnection() throws SQLException {
        String url = System.getenv("SHOPSPHERE_DB_URL");
        if (url == null || url.trim().isEmpty()) url = DEFAULT_URL;

        String user = System.getenv("SHOPSPHERE_DB_USER");
        if (user == null || user.trim().isEmpty()) user = DEFAULT_USER;

        String pass = System.getenv("SHOPSPHERE_DB_PASS");
        if (pass == null) pass = DEFAULT_PASS;

        return DriverManager.getConnection(url, user, pass);
    }
}
