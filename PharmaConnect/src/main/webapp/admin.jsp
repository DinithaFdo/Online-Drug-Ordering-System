<%@ page import="java.sql.*, java.util.*" %>
<%@ page import="com.utils.DBConnect" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp" %>
    <title>Admin Page</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
 
    <style>
        .table-responsive {
            margin-top: 30px;
        }
    </style>
<br>
<br>
<br>
<br>
<br>
<br>

<%
                            if (loggedInCustomer != null) {
                       		 %>

<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <h2 class="my-4">Customer List</h2>
            <div class="table-responsive">
                <table class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th>Email</th>
                            <th>Password</th>
                            <th>Gender</th>
                            <th>Phone Number</th>
                            <th>Address</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% try {
                            Connection con = DBConnect.getConnection();
                            Statement stmt = con.createStatement();
                            ResultSet rs = stmt.executeQuery("SELECT * FROM customer");

                            while (rs.next()) {
                                String fname = rs.getString("fname");
                                String lname = rs.getString("lname");
                                String email = rs.getString("email");
                                String password = rs.getString("password");
                                String gender = rs.getString("gender");
                                String tel = rs.getString("tel");
                                String address = rs.getString("address");

                                %>
                                <tr>
                                    <td><%= fname %></td>
                                    <td><%= lname %></td>
                                    <td><%= email %></td>
                                    <td><%= password %></td>
                                    <td><%= gender %></td>
                                    <td><%= tel %></td>
                                    <td><%= address %></td>
                                    
                                    <td>
                <form action="AdminUpdateCustomer.jsp" method="POST">
                    <input type="hidden" name="cusId" value="<%= rs.getInt("id") %>">
                    <button type="submit" class="btn btn-primary">Update</button>
                </form>
                <form action="deleteAccount" method="POST">
                    <input type="hidden" name="cusId" value="<%= rs.getInt("id") %>">
                    <button type="submit" class="btn btn-danger">Delete</button>
                </form>
            </td>
                                </tr>
                                <%
                            }
                            con.close();
                        } catch (Exception e) {
                            out.println("Error: " + e.getMessage());
                        }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<br>
<br>

<div class="container">
    <h2>Drugs Table</h2>
    <table class="table">
        <thead>
            <tr>
                <th>Photo</th>
                <th>Name</th>
                <th>Price</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <% try {
                Connection con = DBConnect.getConnection();
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM drugs");

                while (rs.next()) {
                    String photo = rs.getString("photo");
                    String name = rs.getString("name");
                    double price = rs.getDouble("price");
                    int id = rs.getInt("id");

                    out.println("<tr>");
                    out.println("<td><img src='" + photo + "' style='max-width: 100px;'></td>");
                    out.println("<td>" + name + "</td>");
                    out.println("<td>Rs " + price + "</td>");
                    out.println("<td>");
                    out.println("<form action='AdminUpdateDrug.jsp' method='POST'>");
                    out.println("<input type='hidden' name='drugId' value='" + id + "'>");
                    out.println("<button type='submit' class='btn btn-primary'>Update</button>");
                    out.println("</form>");
                    out.println("<form action='deleteDrug' method='POST'>");
                    out.println("<input type='hidden' name='drugId' value='" + id + "'>");
                    out.println("<button type='submit' class='btn btn-danger'>Delete</button>");
                    out.println("</form>");
                    out.println("</td>");
                    out.println("</tr>");
                }
                con.close();
            } catch (Exception e) {
                out.println("Error: " + e.getMessage());
            }
            %>
        </tbody>
    </table>
    
    <br>
<br>

    <h2>Contact Table</h2>
    <table class="table">
        <thead>
            <tr>
                <th>Name</th>
                <th>Email</th>
                <th>Tel</th>
                <th>Message</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <% try {
                Connection con = DBConnect.getConnection();
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM contact");

                while (rs.next()) {
                    String name = rs.getString("name");
                    String email = rs.getString("email");
                    String tel = rs.getString("tel");
                    String message = rs.getString("message");
                    int id = rs.getInt("id");

                    out.println("<tr>");
                    out.println("<td>" + name + "</td>");
                    out.println("<td>" + email + "</td>");
                    out.println("<td>" + tel + "</td>");
                    out.println("<td>" + message + "</td>");
                    out.println("<td>");
                    out.println("</form>");
                    out.println("<form action='deleteContact' method='POST'>");
                    out.println("<input type='hidden' name='contactId' value='" + id + "'>");
                    out.println("<button type='submit' class='btn btn-danger'>Delete</button>");
                    out.println("</form>");
                    out.println("</td>");
                    out.println("</tr>");
                }
                con.close();
            } catch (Exception e) {
                out.println("Error: " + e.getMessage());
            }
            %>
        </tbody>
    </table>
</div>

<% 
            } else {
            	response.sendRedirect("home.jsp?permission-denied");
            
            }
            %>


<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.1/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<br>
<br>

<%@ include file="footer.jsp" %>
