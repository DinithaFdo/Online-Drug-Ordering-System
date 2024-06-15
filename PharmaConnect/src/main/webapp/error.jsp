<%@ include file="header.jsp" %>
<body>
<br>
<br>
<br>
<br>
<br>
<br>
<title>Error</title>
    <div class="container mt-5">
        <div class="alert alert-danger">
            <h4 class="alert-heading">Error</h4>
            <p>An error occurred while completing your action:</p>
            <ul>
                <%-- Display specific error messages based on exception types --%>
                <li><%= request.getAttribute("errorMessage") %></li>
                <li><%= request.getAttribute("exceptionMessage") %></li>
            </ul>
            <hr>
            <p class="mb-0">Please try again or contact support.</p>
            <a href="javascript:history.back()" class="btn btn-primary mt-3">Back</a>
        </div>
    </div>

    <br>
<br>
<br>
<br>
</body>
<%@ include file="footer.jsp" %>
