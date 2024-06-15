<%@ include file="header.jsp" %>

<input type="hidden" id="status" value="<%= request.getAttribute("status") %>">

	<!-- Masthead-->
	<header class="masthead bg-primary text-white text-center">
		<div class="container d-flex align-items-center flex-column">
			<!-- Masthead Avatar Image-->
			<img class="masthead-avatar mb-5" src="assets/img/bg.png"
				alt="..." />
			<!-- Masthead Heading-->
			<h1 class="masthead-heading text-uppercase mb-0">Your Health Matters</h1>
			<!-- Icon Divider-->
			<div class="divider-custom divider-light">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>
			<!-- Masthead Subheading-->
			<p class="masthead-subheading font-weight-light mb-0">Pharma-Connect team aims to provide everything you need</p>
		</div>
		<div class="text-center mt-4">
		    <a class="btn btn-primary btn-lg" href="prescription.jsp">
		        <i class="fas fa-upload me-2"></i> Upload Your Prescription Online for a FREE Quote
		    </a>
		</div>

	</header>

		
<section class="page-section" id="product">	
<h2
				class="page-section-heading text-center text-uppercase text-secondary mb-0">Browse Products</h2>
				<!-- Icon Divider-->
			<div class="divider-custom">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>
<%@ include file="prodcutlist.jsp" %>
</section>




	<!-- About Section-->
	<section class="page-section bg-primary text-white mb-0" id="about">
		<div class="container">
			<!-- About Section Heading-->
			<h2
				class="page-section-heading text-center text-uppercase text-white">About</h2>
			<!-- Icon Divider-->
			<div class="divider-custom divider-light">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>
			<!-- About Section Content-->
			<div class="container">
    <div class="row">

    </div>
    <div class="row">
        <div class="col-lg-4 mx-auto">
            <p class="lead">Pharma-Connect is a comprehensive online platform for ordering pharmaceutical products. Our platform provides a seamless experience for customers to browse and purchase medications, manage their prescriptions, and interact with pharmacies.</p>
        </div>
        <div class="col-lg-4 mx-auto">
            <p class="lead">With Pharma-Connect, customers can upload prescriptions securely, track their orders, and receive personalized recommendations based on their medical history. Our goal is to simplify the process of obtaining medications while ensuring safety and convenience.</p>
        </div>
    </div>
</div>

			<!-- About Section Button-->
			<div class="text-center mt-4">
				<a href="product.jsp" class="btn btn-primary" aria-label="View 3 items in your shopping cart">Browse Products
				 <i class="fa fa-shopping-cart" aria-hidden="true"></i>
				</a>
			</div>
		</div>
	</section>
	<!-- Contact Section-->
	<section class="page-section" id="contact">
		<div class="container">
			<!-- Contact Section Heading-->
			<h2
				class="page-section-heading text-center text-uppercase text-secondary mb-0">Contact
				Us</h2>
			<!-- Icon Divider-->
			<div class="divider-custom">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>
			<!-- Contact Section Form-->
			<div class="row justify-content-center">
    <div class="col-lg-8 col-xl-7">
        <form id="contactForm" action="contactForm" method="POST">
            <!-- Name input-->
            <div class="form-floating mb-3">
                <input class="form-control" id="name" type="text" placeholder="Enter your name..." name="name" required />
                <label for="name">Full name</label>
            </div>
            <!-- Email address input-->
            <div class="form-floating mb-3">
                <input class="form-control" id="email" type="email" placeholder="name@example.com" name="email" required />
                <label for="email">Email address</label>
            </div>
            <!-- Phone number input-->
            <div class="form-floating mb-3">
                <input class="form-control" id="phone" type="tel" placeholder="(123) 456-7890" name="tel" required />
                <label for="phone">Phone number</label>
            </div>
            <!-- Message input-->
            <div class="form-floating mb-3">
                <textarea class="form-control" id="message" placeholder="Enter your message here..." style="height: 10rem" name="message" required></textarea>
                <label for="message">Message</label>
            </div>
            <!-- Submit Button-->
            <button class="btn btn-primary btn-xl" id="submitButton" type="submit">Send</button>
        </form>
    </div>
</div>

		</div>
	</section>
	
<!-- Include SweetAlert library -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script type="text/javascript">

    function getUrlParameter(name) {
        name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
        var regex = new RegExp("[\\?&]" + name + "=([^&#]*)");
        var results = regex.exec(location.search);
        return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
    }

    
    var accountDeleted = getUrlParameter("accountDeleted");
    var deleteFailed = getUrlParameter("deleteFailed");

   
    if (accountDeleted === "true") {
        Swal.fire({
            title: "Account Deleted",
            text: "Your account has been successfully deleted.",
            icon: "success",
            confirmButtonText: "OK"
        });
    }

    
    if (deleteFailed === "true") {
        Swal.fire({
            title: "Delete Failed",
            text: "Failed to delete your account.",
            icon: "error",
            confirmButtonText: "OK"
        });
    }
    
    var loginSuccess = getUrlParameter("loginSuccess");

   
    if (loginSuccess === "true") {
        Swal.fire({
            title: "Login Success",
            text: "You have successfully logged in.",
            icon: "success",
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

   
    var logout = getUrlParameter("logout");

  
    if (logout === "true") {
        Swal.fire({
            title: "Logged Out",
            text: "You have been successfully logged out.",
            icon: "info",
            confirmButtonText: "OK"
        });
    }
</script>


	


<%@ include file="footer.jsp" %>