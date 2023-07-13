<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page errorPage="error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Rejister</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link href="style.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
.banner_background {
	clip-path: polygon(50% 0%, 100% 0, 100% 88%, 82% 92%, 66% 95%, 51% 96%, 33% 97%,
		15% 98%, 0 99%, 0 0);
}

@media only screen and (max-width: 990px) {
	.card {
		width: 45rem;
		margin-bottom: 20px;
	}
}

@media only screen and (max-width: 990px) {
	.col-md-6 {
		display: table;
		margin-left: auto;
		margin-right: auto;
	}
}

@media screen and (min-width: 30em) and (orientation: landscape) {
	.col-md-6 {
		display: table;
	}
}

.worning {
	border: 1px solid red;
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

				<li class="nav-item"><a class="nav-link" href="login.jsp"><span
						class="fa fa-user-o"></span>Login</a></li>
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

	<!-- End Connect connect info -->

	<!-- rejister -->
	<main class="p_color banner_background" style="padding-bottom: 60px;">
		<div class="container">
			<div class="row">
				<div class="col-md-6 offset-md-3">
					<div class="card">
						<div class="card-header text-center p_color text-white">
							<div>
								<h3>
									<span class="fa fa-user-plus"></span>Register here..
								</h3>
							</div>
						</div>
						<div class="card-body">
							<form action="RejisterServlet" method="post" id="formcontrol">
								<div class="mb-3">
									<label for="exampleInputEmail1" class="form-label">User-Name</label>
									<input type="text" class="form-control alertborder"
										id="reg-username" aria-describedby="emailHelp"
										placeholder="Enter User-Name" name="username">
									<p class="text-danger" style="display: none;" id="username">
										<span class="sr-only">Danger: </span> User-Name required
									</p>
									<div id="emailHelp" class="form-text"></div>
								</div>

								<div class="mb-3">
									<label for="exampleInputEmail1" class="form-label">Email-Id</label>
									<input type="email" class="form-control" id="reg-email"
										aria-describedby="emailHelp" placeholder="Enter Email-Id"
										name="useremail">We'll never share your email with
									anyone else.
									<p class="text-danger" style="display: none;" id="useremail">
										<span class="sr-only">Danger: </span> User-Email required
									</p>
									<div id="emailHelp" class="form-text"></div>
								</div>




								<div class="mb-3">
									<label for="exampleInputPassword1" class="form-label">Creat-Password</label>
									<input type="password" class="form-control" id="reg-createpass"
										placeholder="Creat-New-Password" name="password">
									<p class="text-danger" style="display: none;" id="pass">
										<span class="sr-only">Danger: </span> password required
									</p>
								</div>

								<div class="mb-3">
									<label for="exampleInputPassword1" class="form-label">Re-Enter-Password</label>
									<input type="text" class="form-control" id="reg-repass"
										placeholder="Re-Enter-Password" name="repassword">
									<p class="text-danger" style="display: none;" id="re-pass">
										<span class="sr-only">Danger: </span> password Re-Enter
										required
									</p>
								</div>

								<div style="text-align: center;">
									<label for="reg-gen" class="form-label ">Select Gender</label> <br>
									<input type="radio" value="Male" style="margin-right: 5px;"
										name="gender" class="reg-gender">Male<span style="margin-right: 20px;"></span>
									<input type="radio" value="Female" style="margin-right: 5px;"
										name="gender" class="reg-gender">Female<span style="margin-right: 20px;"></span>
									<input type="radio" value="Other" style="margin-right: 5px;"
										name="gender" class="reg-gender">Other
									<p class="text-danger" style="display: none;" id="gender">
										<span class="sr-only">Danger: </span> Please select Gender
									</p>
								</div>

								<br>
								<div class="form-check">
									<textarea rows="2" cols="30" placeholder="About...."
										class="form-control" name="about"></textarea>
								</div>
								<br>

								<div class="mb-3 form-check">
									<input type="checkbox" class="form-check-input"
										id="reg-tdc" name="check"> <label
										class="form-check-label" for="exampleCheck1">Click on
										checkbox accept terms and conditions </label>
									<p class="text-danger" style="display: none;" id="tc">
										<span class="sr-only">Danger: </span> T & C required
									</p>
								</div>
								<br>

								<div style="text-align: center;">
									<button type="submit" id="submit-btn"
										class="btn btn-outline-info btn-lg">Submit</button>
								</div>
							</form>
							<div class="container text-center" id="loader"
								style="display: none;">
								<span class="fa fa-refresh fa-spin fa-2x"></span>
								<h4>Please wait.....</h4>
							</div>
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
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>


	<script>
		$(document).ready(function() {
			console.log("loded ..");

			$('#formcontrol').on('submit', function(event) {
				event.preventDefault();

				let form = new FormData(this);
			
				$('#gender').hide();	
				$('#reg-gen').removeClass("worning");
				
								
				$.ajax({
					url: "RegisterServlet",
					type: 'POST',
					data: form,
					success: function (data, textStatus, jqXHR){
						console.log(data);
						
						$('#formcontrol').show();
						$("#submit-btn").show();
						$("#loader").hide();
						
						if(data.trim() === 'done')
							{
							swal("Registered successfully..We are going to redirect to login page")
							.then((value) => {
							  window.location = "login.jsp"
							});
							}
						else{
							
							if(data.trim() === 'UserName'){
								$('#username').show();							
								$('#reg-username').addClass("worning");
								
								$('#reg-username').click(function () {
								$('#reg-username').removeClass("worning");
								$('#username').hide();
									
								});
							}

							
							if(data.trim() === 'UserEmail'){
								$('#useremail').show();	
								$('#reg-email').addClass("worning");
								
								$('#reg-email').click(function () {
									$('#reg-email').removeClass("worning");
									$('#useremail').hide();
								});
							}
							
							if(data.trim() === 'pass'){
								$('#pass').show();	
								$('#reg-createpass').addClass("worning");
								
								$('#reg-createpass').click(function () {
									$('#reg-createpass').removeClass("worning");
									$('#pass').hide();
								});
							}
							
							if(data.trim() === 'RePass'){
								$('#re-pass').show();
								$('#reg-repass').addClass("worning");
								
								$('#reg-repass').click(function () {
									$('#reg-repass').removeClass("worning");
									$('#re-pass').hide();
								});
							}
							
							if(data.trim() === 'Gen'){
								$('#gender').show();
								
								$('.reg-gender').click(function () {
									$('#gender').hide();	
								})
							}
							
							if(data.trim() === 'tdc'){
								$('#tc').show();	
								$('#reg-tdc').addClass("worning");
								
								$('#reg-tdc').click(function () {
									$('#reg-tdc').removeClass("worning");
									$('#tc').hide();
								});
							}
							
							if(data.trim() === 'pmbs'){
								 swal("Password must be same....");
							}
							if(data.trim() === 'Duplicate'){
								 swal("Duplicate Email Id");
							}
						}
					},
					error: function (jqXHR, textStatus, errorThrown){
						$("#submit-btn").hide();
						$("#loader").show();
						swal("somthing went wrong .. try again")
					},
					processData: false,
					contentType: false
				});

			});

		});
	</script>

</body>
</html>