package com.services;

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

@WebServlet("/placeOrder")
public class createOrder extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
        String fname = request.getParameter("firstName");
        String lname = request.getParameter("lastName");
        String email = request.getParameter("email");
        String address = request.getParameter("deliveryAddress");
        String tel= request.getParameter("tel");
        String pname = request.getParameter("productName");
        String quantity = request.getParameter("quantity");
        String payment = request.getParameter("paymentMethod");

        try (Connection con = DBConnect.getConnection()) {
            String sql = "INSERT INTO orders (fname, lname, email, address, tel, pname, qty, payment) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            try (PreparedStatement ps = con.prepareStatement(sql)) {
            	
                ps.setString(1, fname);
                ps.setString(2, lname);
                ps.setString(3, email);
                ps.setString(4, address);
                ps.setString(5, tel);
                ps.setString(6, pname);
                ps.setString(7, quantity);
                ps.setString(8, payment);
                
                int rowsInserted = ps.executeUpdate();
                
                if (rowsInserted > 0) {
                    request.setAttribute("status", "success");
                    response.sendRedirect("orders.jsp?orderSuccess=true"); 
                } else {
                	request.setAttribute("status", "failed");
                    response.sendRedirect("orders.jsp?orderSuccess=failed"); 
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
        	request.setAttribute("errorMessage", "An error occurred: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
