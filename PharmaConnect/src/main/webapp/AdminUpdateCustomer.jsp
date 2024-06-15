<%@ include file="header.jsp" %>
<%@ page import="java.sql.*, java.util.*" %>
<%@ page import="com.utils.DBConnect" %>

<style>
    .shadow-box {
        background-color: #ffffff;
        border-radius: 10px;
        box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
        padding: 100px;
        margin: 200px;
    }
</style>

<% 
    int cusId = Integer.parseInt(request.getParameter("cusId"));
    String fname = "";
    String lname = "";
    String email = "";
    String password = "";
    String age = "";
    String tel = "";
    String gender = "";
    String address = "";
    

    try (Connection con = DBConnect.getConnection()) {
        String sql = "SELECT * FROM customer WHERE id = ?";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, cusId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    fname = rs.getString("fname");
                    lname = rs.getString("lname");
                    email = rs.getString("email");
                    password = rs.getString("password");
                    age = rs.getString("age");
                    tel = rs.getString("tel");
                    address = rs.getString("address");
                    gender = rs.getString("gender");
                    
                }
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<div class="shadow-box">    
<form action="upCustomer" method="POST">
    <input type="hidden" name="id" value="<%= cusId %>">
    <div class="row mb-4">
        <div class="col-12 text-center">
            <h2 class="fw-bold text-uppercase text-primary mb-0">Update Details</h2>
            <hr class="my-3 border-primary">
        </div>
    </div>

    <div class="mb-3">
    <label for="firstName" class="form-label">First Name</label>
    <input type="text" class="form-control shadow-sm" id="firstName" name="fname"  value="<%= fname %>" required>
</div>
<div class="mb-3">
    <label for="lastName" class="form-label">Last Name</label>
    <input type="text" class="form-control shadow-sm" id="lastName" name="lname"  value="<%= lname %>" required>
</div>
<div class="mb-3">
    <label for="email" class="form-label">Email</label>
    <input type="email" class="form-control shadow-sm" id="email" name="email"  value="<%= email %>" required>
</div>
<div class="mb-3">
    <label for="age" class="form-label">Age</label>
    <input type="number" class="form-control shadow-sm" id="age" name="age"  value="<%= age %>"required>
</div>
<div class="mb-3">
    <label for="gender" class="form-label">Gender</label>
    <select class="form-select shadow-sm" id="gender" name="gender">
        <option value="Male">Male</option>
        <option value="Female">Female</option>
        <option value="Other">Other</option>
    </select>
</div>
<div class="mb-3">
    <label for="tel" class="form-label">Phone Number</label>
    <input type="number" class="form-control shadow-sm" id="tel" name="tel"  value="<%= tel %>">
</div>
<div class="mb-3">
    <label for="address" class="form-label">Address</label>
    <textarea class="form-control shadow-sm" id="address" name="address" rows="3"><%= address %></textarea>
</div>

    <button type="submit" class="btn btn-primary">Update Account</button>
</form>
</div>
 

<%@ include file="footer.jsp" %>
