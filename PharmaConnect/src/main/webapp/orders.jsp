<%@ include file="header.jsp" %>

<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.utils.DBConnect" %>
<%@ page import="com.model.Order" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.model.Customer" %>


<body>

<%

if (loggedInCustomer != null) {

String customerEmail = loggedInCustomer.getEmail();


List<Order> orders = new ArrayList<>();

try (Connection con = DBConnect.getConnection()) {
    String sql = "SELECT * FROM orders WHERE email = ?";
    try (PreparedStatement ps = con.prepareStatement(sql)) {
        ps.setString(1, customerEmail);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
        	int orderId = rs.getInt("id");
            String fname = rs.getString("fname");
            String lname = rs.getString("lname");
            String address = rs.getString("address");
            String tel = rs.getString("tel");
            String pname = rs.getString("pname");
            String qty = rs.getString("qty");
            String payment = rs.getString("payment");

            Order order = new Order(orderId, fname, lname, customerEmail, address, tel, pname, qty, payment);
            orders.add(order);
        }
    }
} catch (Exception e) {
    e.printStackTrace();
    // Handle exception (redirect to error page, show error message, etc.)
}

%>
<input type="hidden" id="status" value="<%= request.getAttribute("status") %>">
<div class="container mt-5">
<br>
<br>
<br>
<br>
<br>

    <h1 class="mb-4">Orders for <%= customerEmail %></h1>

    <table class="table table-bordered">
        <thead class="thead-dark">
            <tr>
                <th scope="col">Order ID</th>
                <th scope="col">First Name</th>
                <th scope="col">Last Name</th>
                <th scope="col">Address</th>
                <th scope="col">Telephone</th>
                <th scope="col">Product Name</th>
                <th scope="col">Quantity</th>
                <th scope="col">Payment Method</th>
                <th scope="col">Action</th>
            </tr>
        </thead>
        <tbody>
            <% for (Order order : orders) { %>
            <tr>
                <td><%= order.getId() %></td>
                <td><%= order.getFname() %></td>
                <td><%= order.getLname() %></td>
                <td><%= order.getAddress() %></td>
                <td><%= order.getTel() %></td>
                <td><%= order.getPname() %></td>
                <td><%= order.getQty() %></td>
                <td><%= order.getPayment() %></td>
                <td>
                    <form action="cancelOrder" method="post">
                        <input type="hidden" name="orderId" value="<%= order.getId() %>">
                        <button type="submit" class="btn btn-danger">Cancel</button>
                    </form>
                </td>
            </tr>
            <% }
            } else {
            	response.sendRedirect("home.jsp?permission-denied");
            
            }
            %>
        </tbody>
    </table>
</div>

<br>
<br>
<br>
<br>
</body>

<script type="text/javascript">
    var status = document.getElementById("status").value;
    if (status == "success") {
        Swal.fire({
            title: "Order Canceled",
            text: "You have successfully canceled order.",
            icon: "success",
            confirmButtonText: "OK"
        });
    } else if (status == "failed") {
        Swal.fire({
            title: "Cancel Failed",
            text: "Order cancellation failed.",
            icon: "error",
            confirmButtonText: "OK"
        });
    }
</script>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script type="text/javascript">

    function getUrlParameter(name) {
        name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
        var regex = new RegExp("[\\?&]" + name + "=([^&#]*)");
        var results = regex.exec(location.search);
        return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
    }

   
    var cancel = getUrlParameter("cancel");

  
    if (cancel === "success") {
        Swal.fire({
            title: "Order Canceled",
            text: "Your order has been successfully canceled.",
            icon: "success",
            confirmButtonText: "OK"
        });
    } else if (cancel === "failed") {
        Swal.fire({
            title: "Cancellation Failed",
            text: "Failed to cancel your order.",
            icon: "error",
            confirmButtonText: "OK"
        });
    }
</script>

<!-- Include SweetAlert library -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script type="text/javascript">

    function getUrlParameter(name) {
        name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
        var regex = new RegExp("[\\?&]" + name + "=([^&#]*)");
        var results = regex.exec(location.search);
        return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
    }

   
    var orderSuccess = getUrlParameter("orderSuccess");

  
    if (orderSuccess === "true") {
        Swal.fire({
            title: "Order Success",
            text: "Your order was successfully placed.",
            icon: "success",
            confirmButtonText: "OK"
        });
    }
</script>



<%@ include file="footer.jsp" %>
