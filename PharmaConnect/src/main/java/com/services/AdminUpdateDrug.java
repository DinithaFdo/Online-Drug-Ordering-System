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

@WebServlet("/upDrug")
public class AdminUpdateDrug extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Retrieve parameters from the request
        String idStr = request.getParameter("id");
        String name = request.getParameter("name");
        String photo = request.getParameter("photo");
        String priceStr = request.getParameter("price");

        try {
            // Convert id and price to appropriate data types
            int id = Integer.parseInt(idStr);
            double price = Double.parseDouble(priceStr);

            // Database update logic
            try (Connection con = DBConnect.getConnection()) {
                String sql = "UPDATE drugs SET name = ?, photo = ?, price = ? WHERE id = ?";
                try (PreparedStatement ps = con.prepareStatement(sql)) {
                    ps.setString(1, name);
                    ps.setString(2, photo);
                    ps.setDouble(3, price);
                    ps.setInt(4, id);

                    int rowsUpdated = ps.executeUpdate();
                    if (rowsUpdated > 0) {
                        // Redirect to a success page if the update was successful
                        response.sendRedirect("admin.jsp?updateSuccess=true");
                    } else {
                        // Redirect to a failure page if the update failed
                        response.sendRedirect("admin.jsp?updateFailed=true");
                    }
                }
            } catch (SQLException | ClassNotFoundException e) {
                // Handle SQL exceptions
                request.setAttribute("errorMessage", "An error occurred: " + e.getMessage());
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
        } catch (NumberFormatException e) {
            // Handle number format exceptions for id and price
            request.setAttribute("errorMessage", "Invalid ID or price format: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
