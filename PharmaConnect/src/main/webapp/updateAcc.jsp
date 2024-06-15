<%@ include file="header.jsp" %>
	
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
<form action="updateAccount" method="POST">
	<div class="row mb-4">
    <div class="col-12 text-center">
        <h2 class="fw-bold text-uppercase text-primary mb-0">Update Account</h2>
        <hr class="my-3 border-primary">
    </div>
</div>


    <div class="mb-3">
    <label for="firstName" class="form-label">First Name</label>
    <input type="text" class="form-control shadow-sm" id="firstName" name="fname"  value="<%= loggedInCustomer.getFname() %>" required>
</div>
<div class="mb-3">
    <label for="lastName" class="form-label">Last Name</label>
    <input type="text" class="form-control shadow-sm" id="lastName" name="lname"  value="<%= loggedInCustomer.getLname() %>" required>
</div>
<div class="mb-3">
    <label for="email" class="form-label">Email</label>
    <input type="email" class="form-control shadow-sm" id="email" name="email"  value="<%= loggedInCustomer.getEmail() %>" required>
</div>
<div class="mb-3">
    <label for="age" class="form-label">Age</label>
    <input type="number" class="form-control shadow-sm" id="age" name="age"  value="<%= loggedInCustomer.getAge() %>"required>
</div>
<div class="mb-3">
    <label for="gender" class="form-label">Gender</label>
    <select class="form-select shadow-sm" id="gender" name="gender">
        <option value="Male" <%= loggedInCustomer.getGender().equals("Male") ? "selected" : "" %>>Male</option>
        <option value="Female" <%= loggedInCustomer.getGender().equals("Female") ? "selected" : "" %>>Female</option>
        <option value="Other" <%= loggedInCustomer.getGender().equals("Other") ? "selected" : "" %>>Other</option>
    </select>
</div>
<div class="mb-3">
    <label for="tel" class="form-label">Phone Number</label>
    <input type="number" class="form-control shadow-sm" id="tel" name="tel"  value="<%= loggedInCustomer.getTel() %>">
</div>
<div class="mb-3">
    <label for="address" class="form-label">Address</label>
    <textarea class="form-control shadow-sm" id="address" name="address" rows="3"><%= loggedInCustomer.getAddress() %></textarea>
</div>

    <button type="submit" class="btn btn-primary">Update Account</button>
</form>
</div>

<% 
            } else {
            	response.sendRedirect("home.jsp?permission-denied");
            
            }
            %>


	<%@ include file="footer.jsp" %>