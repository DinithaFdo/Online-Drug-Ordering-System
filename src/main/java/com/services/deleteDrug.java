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

@WebServlet("/deleteDrug")
public class deleteDrug extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int paymentId = Integer.parseInt(request.getParameter("drugId"));

        try (Connection con = DBConnect.getConnection()) {
            String sql = "DELETE FROM drugs WHERE id = ?";
            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setInt(1, paymentId);
                int rowsDeleted = ps.executeUpdate();

                if (rowsDeleted > 0) {
                    response.sendRedirect("admin.jsp?delete=sucess");
                } else {
                    response.sendRedirect("admin.jsp?delete=failed"); 
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.sendRedirect("erros.jsp");
        }
    }
}
