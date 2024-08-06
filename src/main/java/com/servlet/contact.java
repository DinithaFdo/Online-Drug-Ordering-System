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

@WebServlet("/contactForm")
public class contact extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String tel = request.getParameter("tel");
        String message = request.getParameter("message");

       
        if (name == null || email == null || tel == null || message == null) {
          
            request.setAttribute("errorMessage", "Please fill in all fields.");
            request.getRequestDispatcher("contact.jsp").forward(request, response);
            return;
        }

       
        try (Connection con = DBConnect.getConnection()) {
            String sql = "INSERT INTO contact (name, email, tel, message) VALUES (?, ?, ?, ?)";
            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setString(1, name);
                ps.setString(2, email);
                ps.setString(3, tel);
                ps.setString(4, message);

                int rowsInserted = ps.executeUpdate();
                if (rowsInserted > 0) {
                   
                    request.setAttribute("successMessage", "Your message has been sent successfully!");
                    request.getRequestDispatcher("home.jsp").forward(request, response);
                } else {
                    
                    request.setAttribute("errorMessage", "Failed to send message. Please try again.");
                    request.getRequestDispatcher("/PharmaConnect/home.jsp#contact").forward(request, response);
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
           
        	request.setAttribute("errorMessage", "An error occurred: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
