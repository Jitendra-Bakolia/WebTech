<%@page import="com.web.tech.entities.Security"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link href="style.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
.banner_background {
	clip-path: polygon(50% 0%, 78% 0, 100% 0, 100% 79%, 80% 87%, 54% 92%, 21% 95%, 0
		100%, 0 0, 19% 0);
}
</style>

</head>
<body>

	<%
	response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");

	Security s = (Security) session.getAttribute("forgot");

	if (s == null) {
		response.sendRedirect("login.jsp");
		return;
	}
	%>

	<main class="banner_background p_color">

		<div class="container">
			<div class="row">
				<div class="col-md-6 offset-md-3">
					<div class="card" style="margin-top: 50px;">
						<div class="card-header p_color text-white text-center">
							<h3>Your Email-ID and Password</h3>
						</div>
						<div class="card-body" style="margin-bottom: 50px;">
							<table border="0" cellpadding="10" width="100%">
								<tr>
									<td><h3>Email-ID</h3></td>
									<td><h3>:</h3></td>
									<td><h3><%=s.getEmail()%></h3></td>
								</tr>
								<tr>
									<td><h3>Password</h3></td>
									<td><h3>:</h3></td>
									<td><h3><%=s.getPassword()%></h3></td>
								</tr>
								<tr>
									<td align="center" colspan="3"><a href="login.jsp"
										class="btn btn-outline-info"><span
											class="fa fa-user-o fa-spin"></span>Login</a></td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>

	</main>



	<!-- java-script -->

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	<script src="script.js" type="text/javascript"></script>

</body>
</html>