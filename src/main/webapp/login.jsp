<%@page import="com.web.tech.entities.Security"%>
<%@page import="com.web.tech.entities.Msg"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page errorPage="error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>LOGIN</title>
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

.st {
	display: flex;
	margin-left: auto;
	margin-right: auto;
}

@media only screen and (max-width: 990px) {
	.st {
		display: flex;
		margin-left: auto;
		margin-right: auto;
	}
	.card{
		width: 500px;
	}
}

@media screen and (min-width: 30em) and (orientation: landscape) {
	.st {
		display: table;
	}
}
</style>
</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-dark p_color">
		<a class="navbar-brand" href="welcome-home.jsp"><span
			class="fa fa-cubes"></span>Web-Tech</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="#"><span
						class="fa fa-graduation-cap"></span>LearnCodeWith DeviL <span
						class="sr-only">(current)</span></a></li>

				<li class="nav-item"><a class="nav-link" href="#"
					data-toggle="modal" data-target="#con"><span
						class="fa fa-id-badge"></span>contact-us</a></li>


				<li class="nav-item"><a class="nav-link" href="register.jsp"><span
						class="fa fa-user-plus"></span>Register</a></li>

			</ul>
		</div>
	</nav>


	<!-- Connect info -->

	<div class="modal fade" id="con" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header p_color text-white text-center">
					<h5 class="modal-title" id="exampleModalLongTitle"
						style="margin-left: 200px;">Connect</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body text-center">
					<h4>Jiten & DeviL</h4>
					<h5>
						Email : <small style="color: blue;"><a
							href="https://accounts.google.com/signin/v2/identifier?continue=https%3A%2F%2Fmail.google.com%2Fmail%2F&service=mail&sacu=1&rip=1&flowName=GlifWebSignIn&flowEntry=ServiceLogin">bablubakolia@gmail.com</a>
							</td> </small>
					</h5>
					<h5>Connect no. : +919057729697</h5>
					<h6>Address : Ward no. 09 surajgarh</h6>
					<h6>Rajasthan India</h6>

				</div>
				<div class="modal-footer">
					<div class="container text-center">
						<button type="button" class="btn btn-outline-danger"
							data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- login modul -->
	<main class="p_color banner_background" style="padding-bottom: 60px;">
		<div class="container">
			<div class="row">
				<div class="st">
					<div class="card" style="margin-top: 50px;">
						<div class="card-header p_color text-center text-white">
							<h3>
								<span class="fa fa-user-o fa-spin"></span>Login
							</h3>
						</div>

						<%
						Msg msg = (Msg) session.getAttribute("msg");

						if (msg != null) {
						%>
						<div class="alert <%=msg.getCssClass()%>"
							style="text-align: center;" role="alert"><%=msg.getContent()%></div>
						<%
						session.removeAttribute("msg");
						}
						%>

						<div class="card-body">
							<form action="LoginServlet" method="post">
								<div class="mb-3">
									<label for="exampleInputEmail1" class="form-label">Email
										address</label> <input placeholder="Emter user email" type="email"
										name="email" class="form-control" id="exampleInputEmail1"
										aria-describedby="emailHelp">
									<div id="emailHelp" class="form-text">
										<small class="form-text text-muted">We'll never share
											your email with anyone else.</small>
									</div>
								</div>
								<div class="mb-3">
									<label for="exampleInputPassword1" class="form-label">Password</label>
									<input type="password" name="userpassword" class="form-control"
										id="exampleInputPassword1" placeholder="Enter password">
								</div>
								<div class="mb-3 form-check">
									<input type="checkbox" name="condution"
										class="form-check-input" id="exampleCheck1"> <label
										class="form-check-label" for="exampleCheck1"><small>click
											on checkbox accept terms and conditions</small></label>
								</div>
								<br>
								<div style="text-align: center;">
									<button type="submit" class="btn btn-outline-info btn-lg">Login</button>
									<a href="#" style="margin-left: 10px;" data-toggle="modal"
										data-target="#securityque">Forgotten password?</a>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>


	<!-- update security que -->

	<div class="modal fade" id="securityque" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header text-white p_color">
					<h5 class="modal-title" id="exampleModalLabel"
						style="margin-left: 200px;">Security</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">



					<div class="alert alert-success text-center" role="alert">
						<h3>All answer must be right</h3>
					</div>

					<form method="post" action="ForgotPassword">
						<div class="form-group">
							<label for="exampleInputEmail1">Your first school name .</label>
							<input type="text" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp"
								placeholder="Enter your first school name"
								name="forgot_school_name">

						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">What city were you born
								in?</label> <input type="text" class="form-control"
								id="exampleInputEmail1" aria-describedby="emailHelp"
								placeholder="Enter your born city" name="forgot_born">

						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">who is your best-friend</label> <input
								type="text" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp"
								placeholder="Enter your best friend name" name="forgot_best_fr">

						</div>

						<div class="container text-center">
							<button type="submit" class="btn btn-outline-info">Submit</button>
						</div>
					</form>



				</div>
			</div>
		</div>
	</div>




	<!-- End Security que. -->




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