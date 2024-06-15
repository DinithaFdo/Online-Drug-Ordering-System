<%@ page import="com.model.Customer" %>
<%@ page import="com.utils.DBConnect" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Account</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <h2>Update Account</h2>
        <form action="updateAccount" method="POST">
            <%-- Get the ID from the database --%>
            <% int customerId = rs.getInt("id"); %>
            <%-- Query the customer table based on the ID --%>
            <% Customer customer = getCustomerById(customerId); %>
            <% if (customer != null) { %>
                <input type="hidden" name="customerId" value="<%= customer.getId() %>">
                <div class="form-group">
                    <label for="firstName">First Name</label>
                    <input type="text" class="form-control" id="firstName" name="fname" value="<%= customer.getFname() %>" required>
                </div>
                <div class="form-group">
                    <label for="lastName">Last Name</label>
                    <input type="text" class="form-control" id="lastName" name="lname" value="<%= customer.getLname() %>" required>
                </div>
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" class="form-control" id="email" name="email" value="<%= customer.getEmail() %>" required>
                </div>
                <div class="form-group">
                    <label for="age">Age</label>
                    <input type="number" class="form-control" id="age" name="age" value="<%= customer.getAge() %>" required>
                </div>
                <!-- Add other form fields as needed -->
                <button type="submit" class="btn btn-primary">Update Account</button>
            <% } else { %>
                <div class="alert alert-danger" role="alert">
                    Customer details not found.
                </div>
            <% } %>
        </form>
    </div>
    <!-- Include Bootstrap JS at the end of the body -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
