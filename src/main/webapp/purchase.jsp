
<%@ page import="java.sql.*, java.util.*" %>
<%@ page import="com.utils.DBConnect" %>
<%@ page import="com.model.Customer" %>

<%@ include file="header.jsp" %>

<br>
<br>
<br>
<br>
<br>

<body>
    <!-- Navigation-->
    <nav class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top" id="mainNav">
        <div class="container">
            <a href="home.jsp">
                <img src="images/title.PNG" alt="Website Title" />
            </a>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ms-auto">
                    <!-- Add your navigation links here -->
                </ul>
            </div>
        </div>
    </nav>

   <div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-lg-6">
            <div class="card shadow-lg p-3 mb-5 bg-body rounded">
                <div class="card-body">
                    <h2 class="card-title text-center mb-4">Purchase Product</h2>
                    <form action="placeOrder" method="POST">
                        <%
                            if (loggedInCustomer != null) {
                        %>
                        <div class="mb-3">
                            <label for="firstName" class="form-label">First Name</label>
                            <input type="text" class="form-control" id="firstName" name="firstName"
                                value="<%= loggedInCustomer.getFname() %>" readonly>
                        </div>
                        <div class="mb-3">
                            <label for="lastName" class="form-label">Last Name</label>
                            <input type="text" class="form-control" id="lastName" name="lastName"
                                value="<%= loggedInCustomer.getLname() %>" readonly>
                        </div>
                        <div class="mb-3">
                            <label for="email" class="form-label">Email</label>
                            <input type="email" class="form-control" id="email" name="email"
                                value="<%= loggedInCustomer.getEmail() %>" readonly>
                        </div>
                        <div class="mb-3">
                            <label for="deliveryAddress" class="form-label">Delivery Address</label>
                            <textarea class="form-control" id="deliveryAddress" name="deliveryAddress" rows="3"
                               > <%= loggedInCustomer.getAddress() %> </textarea>
                        </div>
                        <div class="mb-3">
                            <label for="tel" class="form-label">Telephone Number</label>
                            <input type="tel" class="form-control" id="tel" name="tel"
                                value="<%= loggedInCustomer.getTel() %>" required>
                        </div>
                        <% } else { %>
                        <div class="alert alert-danger" role="alert">
                            Please log in to complete the purchase.
                        </div>
                        <% } %>
                        <div class="mb-3">
                            <label for="productName" class="form-label">Product Name</label>
                            <input type="text" class="form-control" id="productName" name="productName"
                                value="<%= request.getParameter("product") %>" readonly>
                        </div>
                        <div class="mb-3">
                            <label for="quantity" class="form-label">Quantity</label>
                            <input type="number" class="form-control" id="quantity" name="quantity" required>
                        </div>
                        <div class="mb-3">
                            <label for="paymentMethod" class="form-label">Payment Method</label>
                            <select class="form-select" id="paymentMethod" name="paymentMethod" required>
                                <option value="">Select Payment Method</option>
                                <option value="Frimi">Debit Card</option>
                                <option value="Genie">Credit Card</option>
                                <option value="Bank Transfer">Bank Transfer</option>
                                <option value="Bank Transfer">Lanka QR</option>
                                <!-- Add more payment options if needed -->
                            </select>
                        
                        </div>
                        <%
                            if (loggedInCustomer != null) {
                       		 %>
                        <div class="text-center">
                        
                            <button type="submit" class="btn btn-primary">Purchase</button>
                 
                        </div>
                        <% } else { %>
                        <div class="alert alert-danger" role="alert">
                            Please log in to complete the purchase.
                        </div>
                        <% } %>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="footer.jsp" %>
