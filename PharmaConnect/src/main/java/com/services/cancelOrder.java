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

import com.utils.DBConnect;;

@WebServlet("/cancelOrder")
public class cancelOrder extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int paymentId = Integer.parseInt(request.getParameter("orderId"));

        try (Connection con = DBConnect.getConnection()) {
            String sql = "DELETE FROM orders WHERE id = ?";
            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setInt(1, paymentId);
                int rowsDeleted = ps.executeUpdate();

                if (rowsDeleted > 0) {
                	request.setAttribute("status", "success");
                    response.sendRedirect("orders.jsp?cancel=success");
                } else {
                	request.setAttribute("status", "failed");
                    response.sendRedirect("orders.jsp?cancel=failed"); 
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
        	request.setAttribute("errorMessage", "An error occurred: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
