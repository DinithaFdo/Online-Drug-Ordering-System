<%@ page import="java.sql.*, java.util.*" %>
<%@ page import="com.utils.DBConnect" %>
<%@ page import="com.model.Customer" %>


<style>
    .product-card {
            margin-top: 50px;
         
        }
</style>

<div class="container">
    <div class="row">
        <% try {
            Connection con = DBConnect.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM drugs");

            while (rs.next()) {
                String productName = rs.getString("name");
                String productPhoto = rs.getString("photo");
                double productPrice = rs.getDouble("price");
                String productDescription = rs.getString("description"); // Retrieve description data

        %>
        <div class="col-lg-4 col-md-6 product-card">
            <div class="card">
                <img src="<%= productPhoto %>" class="card-img-top" alt="<%= productName %>" style="width: 200px; height: 200px;">
                <div class="card-body">
                    <h5 class="card-title"><%= productName %></h5>
                    <p class="card-text">Rs. <%= productPrice %></p>
                    
                    <%
                            if (loggedInCustomer != null) {
                       		 %>
                        
                            <a href="purchase.jsp?product=<%= productName %>" class="btn btn-primary">Purchase</a>
                
                       
                        <% } else { %>
                        <div class="alert alert-danger" role="alert">
                            Please log in to complete the purchase.
                        </div>
                        <% } %>
                    
                    <!-- Add margin top and bottom to the buttons -->
                    <button type="button" class="btn btn-primary mt-2" data-toggle="modal" data-target="#productDetailModal<%= rs.getInt("id") %>">View Details</button>
                </div>
            </div>
        </div>
        

        <!-- Product Detail Modal -->
        <div class="modal fade" id="productDetailModal<%= rs.getInt("id") %>" tabindex="-1" role="dialog" aria-labelledby="productDetailModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="productDetailModalLabel"><%= productName %></h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <!-- Add product details here -->
                        <p>Product Name: <%= productName %></p>
                        <p>Price: Rs. <%= productPrice %></p>
                        <p>Description: <%= productDescription %></p> <!-- Display description -->
                        <!-- Add more details as needed -->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <!-- Add buttons or actions here -->
                    </div>
                </div>
            </div>
        </div>
        <%
            }
            con.close();
        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
        }
        %>
        
        <!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.1/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </div>
</div>