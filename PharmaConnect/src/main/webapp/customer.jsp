<%@ include file="header.jsp" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<input type="hidden" id="status" value="<%= request.getAttribute("status") %>">

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
                            if (loggedInCustomer != null) {
                       		 %>

<div class="shadow-box">	
	<div class="row mb-4">
    <div class="col-12 text-center">
        <h2 class="fw-bold text-uppercase text-primary mb-0">Customer Profile</h2>
        <hr class="my-3 border-primary">
    </div>
</div>
<!-- User Data -->
<div class="row mb-4">
    <div class="col-md-3"><strong>First Name:</strong></div>
    <div class="col-md-9"><span class="shadow-sm">${loggedInCustomer.fname}</span></div>
</div>
<div class="row mb-4">
    <div class="col-md-3"><strong>Last Name:</strong></div>
    <div class="col-md-9"><span class="shadow-sm">${loggedInCustomer.lname}</span></div>
</div>
<div class="row mb-4">
    <div class="col-md-3"><strong>Email:</strong></div>
    <div class="col-md-9"><span class="shadow-sm">${loggedInCustomer.email}</span></div>
</div>
<div class="row mb-4">
    <div class="col-md-3"><strong>Age:</strong></div>
    <div class="col-md-9"><span class="shadow-sm">${loggedInCustomer.age}</span></div>
</div>
<div class="row mb-4">
    <div class="col-md-3"><strong>Gender:</strong></div>
    <div class="col-md-9"><span class="shadow-sm">${loggedInCustomer.gender}</span></div>
</div>
<div class="row mb-4">
    <div class="col-md-3"><strong>Telephone:</strong></div>
    <div class="col-md-9"><span class="shadow-sm">${loggedInCustomer.tel}</span></div>
</div>
<div class="row mb-4">
    <div class="col-md-3"><strong>Address:</strong></div>
    <div class="col-md-9"><span class="shadow-sm">${loggedInCustomer.address}</span></div>
</div>

<div class="row">
    <div class="col-md-4 mb-3">
        <button type="button" class="btn btn-primary btn-lg btn-block shadow-sm" onclick="location.href='updateAcc.jsp'">Update Account</button>
    </div>
    <div class="col-md-4 mb-3">
        <form action="deleteCustomer" method="POST">
            <button type="submit" class="btn btn-danger btn-lg btn-block shadow-sm">Delete Account</button>
        </form>
    </div>


    <div class="col-md-4 mb-3">
        <button type="button" class="btn btn-primary btn-lg btn-block shadow-sm" onclick="location.href='orders.jsp'">Purchase History</button>
    </div>
</div>

</div>

<% 
            } else {
            	response.sendRedirect("home.jsp?permission-denied");
            
            }
            %>


<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script type="text/javascript">

    // Function to extract URL parameters
    function getUrlParameter(name) {
        name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
        var regex = new RegExp("[\\?&]" + name + "=([^&#]*)");
        var results = regex.exec(location.search);
        return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
    }

    // Get the value of the "updateSuccess" parameter from the URL
    var updateSuccess = getUrlParameter("updateSuccess");

    // Check if the updateSuccess parameter is "true" and show an alert
    if (updateSuccess === "true") {
        Swal.fire({
            title: "Update Success",
            text: "Your update was successful.",
            icon: "success",
            confirmButtonText: "OK"
        });
    }
    
    if (updateFailed === "true") {
        Swal.fire({
            title: "Update Failed",
            text: "Your update failed.",
            icon: "error",
            confirmButtonText: "OK"
        });
    }
    
 // Function to extract URL parameters
    function getUrlParameter(name) {
        name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
        var regex = new RegExp("[\\?&]" + name + "=([^&#]*)");
        var results = regex.exec(location.search);
        return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
    }

    // Get the value of the "accountDeleted" and "deleteFailed" parameters from the URL
    var accountDeleted = getUrlParameter("accountDeleted");
    var deleteFailed = getUrlParameter("deleteFailed");

    // Check if the accountDeleted parameter is "true" and show a success alert
    if (accountDeleted === "true") {
        Swal.fire({
            title: "Account Deleted",
            text: "Your account has been successfully deleted.",
            icon: "success",
            confirmButtonText: "OK"
        });
    }

    // Check if the deleteFailed parameter is "true" and show an error alert
    if (deleteFailed === "true") {
        Swal.fire({
            title: "Delete Failed",
            text: "Failed to delete your account.",
            icon: "error",
            confirmButtonText: "OK"
        });
    }
    
</script>


    





 <%@ include file="footer.jsp" %>       
	
	
	
	
	
	