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

@WebServlet("/updateAccount")
public class updateAccount extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Customer loggedInCustomer = (Customer) session.getAttribute("loggedInCustomer");
        
        if (loggedInCustomer != null) {
            
            String fname = request.getParameter("fname");
            String lname = request.getParameter("lname");
            String email = request.getParameter("email");
            int age = Integer.parseInt(request.getParameter("age"));
            String gender = request.getParameter("gender");
            String tel = request.getParameter("tel");
            String address = request.getParameter("address");

            loggedInCustomer.setFname(fname);
            loggedInCustomer.setLname(lname);
            loggedInCustomer.setEmail(email);
            loggedInCustomer.setAge(age);
            loggedInCustomer.setGender(gender);
            loggedInCustomer.setTel(tel);
            loggedInCustomer.setAddress(address);

            try (Connection con = DBConnect.getConnection()) {
                String sql = "UPDATE customer SET fname = ?, lname = ?, email = ?, age = ?, gender = ?, tel = ?, address = ? WHERE id = ?";
                try (PreparedStatement ps = con.prepareStatement(sql)) {
                    ps.setString(1, fname);
                    ps.setString(2, lname);
                    ps.setString(3, email);
                    ps.setInt(4, age);
                    ps.setString(5, gender);
                    ps.setString(6, tel);
                    ps.setString(7, address);
                    ps.setInt(8, loggedInCustomer.getId());

                    int rowsUpdated = ps.executeUpdate();
                    if (rowsUpdated > 0) {
                        // Update successful
                        session.setAttribute("loggedInCustomer", loggedInCustomer);
                        request.setAttribute("status", "success");
                        response.sendRedirect("customer.jsp?updateSuccess=true");
                    } else {
                    	request.setAttribute("status", "failed");
                        response.sendRedirect("customer.jsp?updateFailed=true");
                    }
                }
            } catch (ClassNotFoundException | SQLException e) {
            	request.setAttribute("errorMessage", "An error occurred: " + e.getMessage());
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
        } else {
            response.sendRedirect("login.jsp"); 
        }
    }
}
