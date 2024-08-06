<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Pharma Connect</title>
<!-- Favicon-->
<link rel="icon" type="image/png" href="assets/favic.png" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="cs/index-styles.css" rel="stylesheet" />


<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>


</head>
<body id="page-top">
	<!-- Navigation-->
	<nav
		class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top"
		id="mainNav">
		<div class="container">
			<a href="home.jsp">
    	<img src="images/title.PNG" alt="Website Title" />
		</a>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="/PharmaConnect/home.jsp#product">Products</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="/PharmaConnect/home.jsp#about">About</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="/PharmaConnect/home.jsp#contact">Contact</a></li>
						
					<ul class="navbar-nav ms-auto">
				    <% com.model.Customer loggedInCustomer = (com.model.Customer) session.getAttribute("loggedInCustomer"); %>

<% if (loggedInCustomer != null) { %>
    <!-- Display user's first name and logout button if logged in -->
    <li class="nav-item mx-0 mx-lg-1">
        <a class="nav-link py-3 px-0 px-lg-3 rounded" href="customer.jsp">Welcome, <%= loggedInCustomer.getFname() %></a>
    </li>
    <li class="nav-item mx-0 mx-lg-1">
        <a class="nav-link py-3 px-0 px-lg-3 rounded btn btn-danger" href="logoutCustomer">Logout</a>
    </li>
<% } else { %>
    <!-- Display login and new user options if not logged in -->
    <li class="nav-item mx-0 mx-lg-1">
        <a class="nav-link py-3 px-0 px-lg-3 rounded" href="registration.jsp">New user</a>
    </li>
    <li class="nav-item mx-0 mx-lg-1">
        <a class="nav-link py-3 px-0 px-lg-3 rounded btn btn-success" href="login.jsp">Login</a>
    </li>
<% } %>

				</ul>

					
				</ul>
			</div>
		</div>
	</nav>

	</header>
	
		<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
<body>