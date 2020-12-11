package com.ibanking.testdb;

import java.io.*;
import java.sql.*;
import java.util.*;

public class TestConnection {

    public static void main(String[] args) {
        System.out.println("=====main executing=====");
        String driverClassName = null;
        String url = null;
        String username = null;
        String password = null;
        Connection conn = null;

        try {
            Properties props = new Properties();
            System.out.println("resource: " + TestConnection.class.getClassLoader().getResourceAsStream("db.properties"));
            props.load(TestConnection.class.getClassLoader().getResourceAsStream("db.properties"));
            driverClassName = props.getProperty("db.driverClassName");
            url = props.getProperty("db.url");
            username = props.getProperty("db.username");
            password = props.getProperty("db.password");
          
        } catch(IOException e) {
            e.printStackTrace();
        }

        try {
            Class.forName(driverClassName);
            conn = DriverManager.getConnection(url, username, password);
            System.out.println("Connection established successfully : " + conn);
        } catch(ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if(conn != null) {
                    conn.close();
                }
            } catch(SQLException e) {
                e.printStackTrace();
            }
        }

    }
}