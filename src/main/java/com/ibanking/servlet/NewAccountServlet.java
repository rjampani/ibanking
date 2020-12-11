package com.ibanking.servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.sql.*;
import java.util.*;
import java.io.*;

@WebServlet("/newAccount")
public class NewAccountServlet extends HttpServlet {

    private String driverClassName;
    private String url;
    private String username;
    private String password;

    public void init() throws ServletException {
        Properties props = null;
        props = new Properties();
        try {
            props.load(this.getClass().getClassLoader().getResourceAsStream("db.properties"));
            driverClassName = props.getProperty("db.driverClassName");
            url = props.getProperty("db.url");
            username = props.getProperty("db.username");
            password = props.getProperty("db.password");
        } catch (IOException e) {
            throw new ServletException(e);
        }
    }

    public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException {
        int accountNo = 0;
        String accountHolderName = null;
        String accountType = null;
        double balance = 0;

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            accountNo = Integer.parseInt(request.getParameter("accountNo"));
            accountHolderName = request.getParameter("accountHolderName");
            accountType = request.getParameter("accountType");
            balance = Double.parseDouble(request.getParameter("balance"));

            Class.forName(driverClassName);
            conn = DriverManager.getConnection(url, username, password);
            pstmt = conn.prepareStatement("insert into account(account_no, account_holder_nm, account_type, balance) values (?,?,?,?)");
            pstmt.setInt(1, accountNo);
            pstmt.setString(2, accountHolderName);
            pstmt.setString(3, accountType);
            pstmt.setDouble(4, balance);

            pstmt.executeUpdate();

            response.getWriter().println("<h1>Hi " + accountHolderName + ", Account has been created successfully...</h1>");
        } catch(ClassNotFoundException | SQLException | IOException | NumberFormatException e) {
            throw new ServletException(e);
        } finally {
            try {
                if(pstmt != null) {
                    pstmt.close();
                }
                if(conn != null) {
                    conn.close();
                }
            } catch(SQLException e) {
                throw new ServletException(e);
            }
        }


    }


}