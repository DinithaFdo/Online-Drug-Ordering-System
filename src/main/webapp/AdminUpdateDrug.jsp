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
    int drugId = Integer.parseInt(request.getParameter("drugId"));
    String name = "";
    String photo = "";
    double price = 0.0;

    try (Connection con = DBConnect.getConnection()) {
        String sql = "SELECT * FROM drugs WHERE id = ?";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, drugId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    name = rs.getString("name");
                    photo = rs.getString("photo");
                    price = rs.getDouble("price");
                }
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<div class="shadow-box">    
<form action="upDrug" method="POST">
    <input type="hidden" name="id" value="<%= drugId %>">
    <div class="row mb-4">
        <div class="col-12 text-center">
            <h2 class="fw-bold text-uppercase text-primary mb-0">Update Details</h2>
            <hr class="my-3 border-primary">
        </div>
    </div>

    <div class="mb-3">
        <label for="photo" class="form-label">Photo</label>
        <input type="text" class="form-control shadow-sm" id="photo" name="photo" value="<%= photo %>" required>
    </div>
    <div class="mb-3">
        <label for="Name" class="form-label">Medicine Item</label>
        <input type="text" class="form-control shadow-sm" id="Name" name="name" value="<%= name %>" required>
    </div>
    <div class="mb-3">
        <label for="price" class="form-label">Price</label>
        <input type="text" class="form-control shadow-sm" id="price" name="price" value="<%= price %>" required>
    </div>

    <button type="submit" class="btn btn-primary">Update</button>
</form>
</div>

<%@ include file="footer.jsp" %>
