package com.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.Customer;
import com.utils.DBConnect;

@WebServlet("/logCustomer")
public class logCustomer extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try (Connection con = DBConnect.getConnection()) {
        	
            String sql = "SELECT * FROM customer WHERE email = ? AND password = ?";
            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setString(1, email);
                ps.setString(2, password);
                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                       
                        Customer customer = new Customer();
                        customer.setId(rs.getInt("id"));
                        customer.setFname(rs.getString("fname"));
                        customer.setLname(rs.getString("lname"));
                        customer.setEmail(rs.getString("email"));
                        customer.setAge(rs.getInt("age"));
                        customer.setGender(rs.getString("gender"));
                        customer.setTel(rs.getString("tel"));
                        customer.setAddress(rs.getString("address"));

                       
                        HttpSession session = request.getSession();
                        session.setAttribute("loggedInCustomer", customer);

                        
                        String mail = rs.getString("email");
                        if ("admin@admin.com".equals(mail)) {
                            request.setAttribute("status", "admin");
                            response.sendRedirect("admin.jsp?loginSuccess=true"); 
                        } else {
                        	request.setAttribute("status", "success");
                            request.getRequestDispatcher("home.jsp?loginSuccess=true").forward(request, response);
                        }
                    } else {
                    	request.setAttribute("status", "failed");
                        request.getRequestDispatcher("login.jsp").forward(request, response);
                    }
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
        	request.setAttribute("errorMessage", "An error occurred: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
