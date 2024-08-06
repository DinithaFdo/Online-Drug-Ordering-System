package com.servlet;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.utils.DBConnect;

@WebServlet("/prescription")
@MultipartConfig
public class prescription extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String description = request.getParameter("description");
        Part filePart = request.getPart("file");

        if (filePart != null) {
            try (InputStream fileContent = filePart.getInputStream();
                 Connection con = DBConnect.getConnection()) {
                String sql = "INSERT INTO prescription (description, prescription) VALUES (?, ?)";
                try (PreparedStatement ps = con.prepareStatement(sql)) {
                    ps.setString(1, description);
                    ps.setBlob(2, fileContent);

                    int rowsInserted = ps.executeUpdate();
                    if (rowsInserted > 0) {
                       
                        response.sendRedirect("home.jsp?success=1");
                    } else {
                        
                        response.sendRedirect("prescription.jsp?error=1");
                    }
                }
            } catch (ClassNotFoundException | SQLException e) {
               
            	request.setAttribute("errorMessage", "An error occurred: " + e.getMessage());
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
        } else {
            
            response.sendRedirect("prescription.jsp?fileError=1");
        }
    }
}
