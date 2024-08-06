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

@WebServlet("/upCustomer")
public class AdminUpdateCustomer extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String email = request.getParameter("email");
        String gender = request.getParameter("gender");
        String tel = request.getParameter("tel");
        String ageStr = request.getParameter("age");
        String address = request.getParameter("address");
        String idStr = request.getParameter("id");

        try {
            int age = Integer.parseInt(ageStr);
            int id = Integer.parseInt(idStr);

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
                    ps.setInt(8, id);

                    int rowsUpdated = ps.executeUpdate();
                    if (rowsUpdated > 0) {
                        response.sendRedirect("admin.jsp?updateSuccess=true");
                    } else {
                        response.sendRedirect("admin.jsp?updateFailed=true");
                    }
                }
            } catch (SQLException e) {
                request.setAttribute("errorMessage", "An error occurred: " + e.getMessage());
                request.getRequestDispatcher("error.jsp").forward(request, response);
            } catch (ClassNotFoundException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Invalid age or ID format: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
