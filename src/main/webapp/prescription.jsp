<%@ include file="header.jsp" %>

<style>
    .shadow-box {
        background-color: #ffffff;
        border-radius: 10px;
        box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
        padding: 50px;
        margin: 200px;
    }
</style>
</head>
<body>
<div class="shadow-box">
	<form action="prescription" method="POST" enctype="multipart/form-data">
		<div class="row mb-4">
			<div class="col-12 text-center">
				<h2 class="fw-bold text-uppercase text-primary mb-0">Upload Prescription</h2>
				<hr class="my-3 border-primary">
			</div>
		</div>
		<div class="mb-3">
			<label for="prescriptionFile" class="form-label">Select Prescription File</label>
			<input type="file" class="form-control shadow-sm" id="prescriptionFile" name="file" required>
		</div>
		<div class="mb-3">
			<label for="description" class="form-label">Description</label>
			<textarea class="form-control shadow-sm" id="description" name="description" rows="3" required></textarea>
		</div>
		<button type="submit" class="btn btn-primary">Upload Prescription</button>
	</form>
</div>

<%@ include file="footer.jsp" %>
