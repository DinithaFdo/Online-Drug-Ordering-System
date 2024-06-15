package com.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.utils.DBConnect;

@WebServlet("/regCustomer")
public class regCustomer extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String email = request.getParameter("email");
        String password = request.getParameter("pass");
 
        int age = 0; 

        try {
            age = Integer.parseInt(request.getParameter("age"));
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }

        try (Connection con = DBConnect.getConnection()) {
            String sql = "INSERT INTO customer (fname, lname, age, email, password) VALUES (?, ?, ?, ?, ?)";
            try (PreparedStatement ps = con.prepareStatement(sql)) {
            	
                ps.setString(1, fname);
                ps.setString(2, lname);
                ps.setInt(3, age);
                ps.setString(4, email);
                ps.setString(5, password);
                
                int rowsInserted = ps.executeUpdate();
                
                if (rowsInserted > 0) {
                    request.setAttribute("status", "done");
                    response.sendRedirect("login.jsp?registrationSuccess=true"); 
                } else {
                	request.setAttribute("status", "failed");
                    response.sendRedirect("registration.jsp?registrationFailed=true"); 
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
        	request.setAttribute("errorMessage", "An error occurred: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
