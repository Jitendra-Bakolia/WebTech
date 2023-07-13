<%@page import="com.web.tech.entities.Msg"%>
<%@page import="com.web.tech.entities.Security"%>
<%@page import="com.web.tech.dao.SecurityDao"%>
<%@page import="com.web.tech.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.web.tech.helper.ConnectionProvider"%>
<%@page import="com.web.tech.dao.PostDao"%>
<%@page import="com.web.tech.entities.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>sequrity</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link href="style.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
.banner_background {
	clip-path: polygon(50% 0%, 100% 0, 100% 35%, 100% 70%, 78% 84%, 51% 92%, 20% 96%, 0
		100%, 0% 35%, 0 0);
}
</style>
</head>
<body>
	<%
	response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");

	User user = (User) session.getAttribute("currentUser");

	if (user == null) {
		response.sendRedirect("login.jsp");
		return;
	}
	%>


	<!-- nav start -->

	<nav class="navbar navbar-expand-lg navbar-dark p_color">
		<a class="navbar-brand" href="profile.jsp"><span
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

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <span class="fa fa-sliders"></span>Categories
				</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">Action</a> <a
							class="dropdown-item" href="#">Another action</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Something else here</a>
					</div></li>

				<li class="nav-item"><a class="nav-link" href="#"
					data-toggle="modal" data-target="#con"><span
						class="fa fa-id-badge"></span>contact</a></li>

				<li class="nav-item"><a class="nav-link" href="#"
					data-toggle="modal" data-target="#add_post"><span
						class="fa fa-asterisk"></span>Do-Post</a></li>


			</ul>
			<form class="form-inline my-2 my-lg-0" action="Logout" method="post">
				<a class="navbar-brand" href="#" data-toggle="modal"
					data-target="#exampleModal"><span class="fa fa-street-view"></span><%=user.getUsername()%></a>

				<button class="btn btn-outline-light my-2 my-sm-0" type="submit">
					<span class="fa fa-share-square-o"></span>Logout
				</button>
			</form>
		</div>
	</nav>

	<!-- End nav -->

	<!-- Modal start -->

	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header p_color">
					<h5 class="modal-title text-white" style="margin-left: 190px;"
						id="exampleModalLabel">WebTech</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<!-- main modal body -->
					<div class="container text-center">
						<img src="\WebTech\data\<%=user.getImgname()%>"
							style="width: 30%; height: 50%; border-radius: 50%;"><br>
						<h4><%=user.getUsername()%></h4>
					</div>

					<table class="table" id="userinfo">
						<tbody>
							<tr>
								<th scope="row">ID<span
									style="float: right; margin-right: 30px;">:</span></th>
								<td><%=user.getId()%></td>
							</tr>
							<tr>
								<th scope="row">Name <span
									style="float: right; margin-right: 30px;">:</span></th>
								<td><%=user.getUsername()%></td>

							</tr>
							<tr>
								<th scope="row">Email <span
									style="float: right; margin-right: 30px;">:</span></th>
								<td><%=user.getUseremail()%></td>

							</tr>
							<tr>
								<th scope="row">Gender <span
									style="float: right; margin-right: 30px;">:</span></th>
								<td><%=user.getGender()%></td>

							</tr>
							<tr>
								<th scope="row">About <span
									style="float: right; margin-right: 30px;">:</span></th>
								<td><%=user.getAbout()%></td>

							</tr>
						</tbody>
					</table>

					<!-- END main modal body -->


					<!-- Edit modal -->

					<div style="display: none;" id="edit_account">
						<form action="EditServlet" method="post"
							enctype="multipart/form-data">
							<table class="table">
								<tbody>
									<tr>
										<th scope="row">ID<span
											style="float: right; margin-right: 30px;">:</span></th>
										<td><%=user.getId()%></td>
									</tr>
									<tr>
										<th scope="row">Name <span
											style="float: right; margin-right: 30px;">:</span></th>
										<td><input type="text" name="edit_username"
											value="<%=user.getUsername()%>"></td>

									</tr>
									<tr>
										<th scope="row">Email <span
											style="float: right; margin-right: 30px;">:</span></th>
										<td><input type="email" name="edit_useremail"
											value="<%=user.getUseremail()%>"></td>

									</tr>
									<tr>
										<th scope="row">Gender <span
											style="float: right; margin-right: 30px;">:</span></th>
										<td><%=user.getGender()%></td>

									</tr>
									<tr>
										<th scope="row">About <span
											style="float: right; margin-right: 30px;">:</span></th>
										<td><textarea name="edit_about" class="form-control"><%=user.getAbout()%></textarea></td>

									</tr>

									<tr>
										<th scope="row">Profile <span
											style="float: right; margin-right: 30px;">:</span></th>
										<td><input type="file" class="form-control"
											name="profileimg"></td>

									</tr>

									<tr style="background-color: #f4ff81">
										<td colspan="2" align="center"><h5>Password and
												Re-Password must be same if you want to edit your password</h5></td>
									</tr>

									<tr>
										<th scope="row">Old Password</th>
										<td><input type="password" name="edit_old_password"
											value="<%=user.getPassword()%>"></td>

									</tr>

									<tr>
										<th scope="row">New Password</th>
										<td><input type="password" name="edit_password"
											value="<%=user.getPassword()%>"></td>

									</tr>
									<tr>
										<th scope="row">Re-Password</th>
										<td><input type="password" name="edit_repassword"
											value="<%=user.getRepassword()%>"></td>

									</tr>

									<tr style="background-color: #f4ff81">
										<td colspan="2" align="center"><h5>Enter Real
												password if you want to update your profile</h5></td>
									</tr>

									<tr>
										<th scope="row">Password</th>
										<td><input type="password" name="edit_old_real_password"
											placeholder="Enter real password"></td>

									</tr>

								</tbody>
							</table>
							<div class="container text-center">
								<button type="submit" class="btn btn-outline-info">Update</button>
							</div>
						</form>
					</div>

					<!-- END edit modal -->

					<!-- Delete modal -->

					<div style="display: none;" id="delete_account">
						<form action="DeleteUser" method="post">
							<table class="table">
								<tbody>
									<tr>
										<td colspan="2" align="center"><h5 style="color: red">Are
												you sure you want to delete your account</h5></td>
									</tr>
									<tr>
										<th scope="row">ID<span
											style="float: right; margin-right: 30px;">:</span></th>
										<td><%=user.getId()%></td>
									</tr>

									<tr>
										<th scope="row">Email <span
											style="float: right; margin-right: 30px;">:</span></th>
										<td><input type="email" name="real_useremail"
											placeholder="Enter User - Email"></td>

									</tr>

									<tr>
										<th scope="row">Password</th>
										<td><input type="password" name="real_password"
											placeholder="Enter password"></td>

									</tr>

								</tbody>
							</table>
							<div class="container text-center">
								<button type="submit" class="btn btn-outline-danger">Delete
									Account permanently</button>
							</div>
						</form>
					</div>

					<!-- END Delete modal -->


				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-info" id="delete_btn">Delete
						Account</button>
					<button type="button" class="btn btn-info" id="edit_btn">EDIT</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal END -->

	<!-- Do-Post modal -->

	<div class="modal fade" id="add_post" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header p_color text-white">
					<h5 class="modal-title" id="exampleModalLabel"
						style="margin-left: 125px;">Provide the post details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="AddPostServlet" method="post" id="add-post-form"
						enctype="multipart/form-data">
						<div class="form-group">
							<select class="form-control" name="cid">
								<option selected="selected" disabled="disabled">----Select
									Category----</option>

								<%
								PostDao dao = new PostDao(ConnectionProvider.getConnection());
								ArrayList<Category> list = dao.getAllCategories();
								for (Category c : list) {
								%>
								<option value="<%=c.getCid()%>"><%=c.getName()%></option>
								<%
								}
								%>

							</select> <input type="text" class="form-control mt-3 text-center"
								placeholder="Enter post Title" name="ptitle">
							<textarea rows="5" cols="3" class="form-control mt-3"
								placeholder="Enter your content" name="pcontent"></textarea>
							<textarea rows="5" cols="3" class="form-control mt-3"
								placeholder="Enter your program (if any)" name="pcode"></textarea>
							<div class="container text-center mt-3 alert alert-info"
								role="alert">Select a picture for your post</div>
							<input type="file" class="form-control" name="ppic">

						</div>
						<div class="container text-center">
							<button type="submit" class="btn btn-outline-info mt-4">Post</button>
						</div>
					</form>
				</div>

			</div>
		</div>
	</div>

	<!-- End Do-Post modal -->

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



	<!-- update security que -->

	<div class="modal fade" id="securityque" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header text-white p_color">
					<h5 class="modal-title" id="exampleModalLabel" style="margin-left: 200px;">Security</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">



					<div class="alert alert-success text-center" role="alert">
						<h3>This answer will require for forget password issue</h3>
					</div>

					<form method="post" action="Security_Que">
						<div class="form-group">
							<label for="exampleInputEmail1">Your first school name .</label>
							<input type="text" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp"
								placeholder="Enter your first school name" name="school_name">

						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">What city were you born
								in?</label> <input type="text" class="form-control"
								id="exampleInputEmail1" aria-describedby="emailHelp"
								placeholder="Enter your born city" name="born">

						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">who is your best-friend</label> <input
								type="text" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp"
								placeholder="Enter your best friend name" name="best_fr">

						</div>

						<div class="container text-center">
							<button type="submit" class="btn btn-outline-info">Update</button>
						</div>
					</form>



				</div>
			</div>
		</div>
	</div>

	<!-- End Security que. -->




	<%
	SecurityDao sd = new SecurityDao(ConnectionProvider.getConnection());
	Security s = sd.getSecurity(user.getUseremail());
	%>


	<main class="banner_background p_color">


		<%
		Msg m = (Msg) session.getAttribute("security");
		if (m != null) {
		%>
		<div class="alert <%=m.getCssClass()%>" style="text-align: center;"
			role="alert"><%=m.getContent()%></div>
		<%
		session.removeAttribute("security");
		}
		%>

		<div class="container">
			<div class="row">
				<div class="col-md-8 offset-2">
					<div class="card">

						<%
						if (s == null) {
						%>


						<div class="alert alert-success text-center" role="alert">
							<h3>This answer will require for forget password issue</h3>
						</div>

						<form method="post" action="Security_Que"
							style="margin-bottom: 80px;">
							<div class="form-group">
								<label for="exampleInputEmail1">Your first school name .</label>
								<input type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp"
									placeholder="Enter your first school name" name="school_name">

							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">What city were you born
									in?</label> <input type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="Enter your born city" name="born">

							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">who is your best-friend</label>
								<input type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp"
									placeholder="Enter your best friend name" name="best_fr">

							</div>

							<div class="container text-center" style="margin-top: 50px;">
								<button type="submit" class="btn btn-outline-info">Submit</button>
							</div>
						</form>


						<%
						} else {
						%>

						<div
							style="margin-bottom: 60px; display: block; margin-left: auto; margin-right: auto">
							<table border="0" cellpadding="10">
								<tr>
									<td colspan="3"><div
											class="alert alert-success text-center" role="alert">
											<h3>Your security questions for forget password issue</h3>
										</div></td>
								</tr>
								<tr>
									<td>Your first school name .</td>
									<td>:</td>
									<td><%=s.getFirst_school_name()%></td>
								</tr>
								<tr>
									<td>City were you born in.</td>
									<td>:</td>
									<td><%=s.getBorn()%></td>
								</tr>
								<tr>
									<td>Your best-friend Name</td>
									<td>:</td>
									<td><%=s.getFev_fr()%></td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td colspan="3" align="center"><button type="button"
											class="btn btn-outline-info" data-toggle="modal"
											data-target="#securityque">Update</button></td>
								</tr>
							</table>
						</div>

						<%
						}
						%>
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
			let f = false;
			$('#edit_btn').click(function() {
				if (f) {
					$('#userinfo').show();
					$("#edit_account").hide();
					$('#delete_btn').show();
					$('#edit_btn').html("EDIT");
					f = false;
				} else {
					$('#userinfo').hide();
					$("#edit_account").show();
					$('#delete_btn').hide();
					$('#edit_btn').html("back");
					f = true;
				}
			});
			$('#delete_btn').click(function() {
				if (f) {
					$('#userinfo').show();
					$("#delete_account").hide();
					$('#edit_btn').show();
					$('#delete_btn').html("Delete Account");
					f = false;
				} else {
					$('#userinfo').hide();
					$("#delete_account").show();
					$('#edit_btn').hide();
					$('#delete_btn').html("back");
					f = true;
				}
			})
		});
	</script>

	<!-- Add Post ajax js -->

	<script>
		$(document).ready(function() {

			$('#add-post-form').on("submit", function(event) {
				//this code gets called when is submitted....
				event.preventDefault();
				let form = new FormData(this);

				//now requesting to server....
				$.ajax({
					url : "AddPostServlet",
					type : 'POST',
					data : form,
					success : function(data, textStatus, jqXHR) {
						//success....
						if (data.trim() == 'save') {
							swal("Good job!", "saved successfully", "success");
						} else {
							swal("Error", "Somthing went wrong", "error");
						}
					},
					error : function(jqXHR, textStatus, errorTrown) {
						//error...
						swal("Error", "Somthing went wrong", "error");
					},
					processData : false,
					contentType : false
				})

			})

		})
	</script>

	<!-- End Add post ajax js -->


</body>
</html>