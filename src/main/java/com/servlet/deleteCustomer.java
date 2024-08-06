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
import javax.servlet.http.HttpSession;

import com.model.Customer;
import com.utils.DBConnect;

@WebServlet("/deleteCustomer")
public class deleteCustomer extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
        HttpSession session = request.getSession(false); 
        if (session != null) {
            Customer loggedInCustomer = (Customer) session.getAttribute("loggedInCustomer");
            if (loggedInCustomer != null) {
                int customerId = loggedInCustomer.getId();

                try (Connection con = DBConnect.getConnection()) {
                    String sql = "DELETE FROM customer WHERE id = ?";
                    try (PreparedStatement ps = con.prepareStatement(sql)) {
                        ps.setInt(1, customerId);
                        int rowsAffected = ps.executeUpdate();
                        if (rowsAffected > 0) {
                            
                            session.invalidate(); 
                            response.sendRedirect("home.jsp?accountDeleted=true");
                        } else {
                            
                            response.sendRedirect("customer.jsp?deleteFailed=true");
                        }
                    }
                } catch (ClassNotFoundException | SQLException e) {
                	request.setAttribute("errorMessage", "An error occurred: " + e.getMessage());
                    request.getRequestDispatcher("error.jsp").forward(request, response);
                }
            } else {
                
                response.sendRedirect("login.jsp");
            }
        } else {
            
            response.sendRedirect("login.jsp");
        }
    }
}
