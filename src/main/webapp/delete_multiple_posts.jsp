<%@page import="com.web.tech.entities.Post"%>
<%@page import="com.web.tech.dao.PostDao"%>
<%@page import="com.web.tech.helper.ConnectionProvider"%>
<%@page import="com.web.tech.entities.User"%>
<%@page import="java.util.List"%>
<%@page import="com.web.tech.entities.Msg"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.web.tech.entities.Category"%>
<%@page import="com.web.tech.dao.DeletedUserDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>delete posts</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link href="style.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
.banner_background {
	clip-path: polygon(0 0, 100% 0, 100% 100%, 84% 96%, 72% 94%, 55% 95%, 36% 97%, 18%
		97%, 7% 96%, 0 93%);
	overflow: hidden;
	position: relative;
}

body {
	/* background-image:
		url("https://cutewallpaper.org/21/1080p-wallpaper-for-pc/Free-download-Full-HD-1080p-Wallpapers-Desktop-Backgrounds-.jpg");
	
	background-size: cover; */
	background-color: #FFDEE9;
	background-image: linear-gradient(0deg, #FFDEE9 0%, #B5FFFC 100%);
	background-attachment: fixed;
}
</style>
</head>
<body>
	<!-- get user data after login -->

	<%
	response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");

	User user = (User) session.getAttribute("currentUser");

	if (user == null) {
		response.sendRedirect("login.jsp");
		return;
	}
	%>

	<!-- END getting user data -->

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

				<li class="nav-item"><a class="nav-link" href="#"
					data-toggle="modal" data-target="#con"><span
						class="fa fa-id-badge"></span>contact-us</a></li>

				<li class="nav-item"><a class="nav-link" href="#"
					data-toggle="modal" data-target="#add_post"><span
						class="fa fa-asterisk"></span>Do-Post</a></li>


			</ul>
			<form class="form-inline my-2 my-lg-0" action="Logout" method="post">
				<a class="navbar-brand" href="#" data-toggle="modal"
					data-target="#exampleModal"><span class="fa fa-street-view"></span><%=user.getUsername()%></a>

				<a class="navbar-brand" data-toggle="modal" data-target="#security"
					href="#"><span class="fa fas fa-lock"></span>Security</a>

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

				</div>

				<!-- END Delete modal -->


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

	<!-- End Connect connect info -->





	<!-- security modal login -->


	<div class="modal fade" id="security" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header p_color text-white">
					<h5 class="modal-title" id="exampleModalLabel"
						style="margin-left: 145px">For security purposes</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<!-- form -->


					<form action="Sequrity_login" method="post">
						<div class="form-group">
							<label for="exampleInputEmail1">Email address</label> <input
								type="email" class="form-control" name="security_email"
								id="exampleInputEmail1" aria-describedby="emailHelp"
								placeholder="Enter email">

						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">Password</label> <input
								type="password" class="form-control" name="security_password"
								id="exampleInputPassword1" placeholder="Password">
						</div>
						<div class="container text-center">
							<button type="submit" class="btn btn-outline-info">Enter
								Security</button>
						</div>

					</form>
					<!-- End form -->


				</div>
			</div>
		</div>
	</div>


	<!-- END security modal -->


	<!-- SMS -->

	<%
	Msg m = (Msg) session.getAttribute("editmsg");

	if (m != null) {
	%>
	<div class="alert <%=m.getCssClass()%>" role="alert"
		style="text-align: center;"><%=m.getContent()%></div>
	<%
	session.removeAttribute("editmsg");
	}
	%>

	<!-- END SMS -->

	<!-- Start Main Codding -->

	<%
	PostDao pd = new PostDao(ConnectionProvider.getConnection());
	List<Post> postlist = pd.getAllPostByUserId(user.getId());
	%>

	<form action="DeletePostMultiple" method="post">

		<main style="padding-bottom: 50px;">
			<div class="container">

				<div class="row">
					<%
					for (Post p : postlist) {
					%>

					<div class="card"
						style="width: 13rem; margin: 10px; padding: 10px; padding-bottom: 0px;">

						<%
						if (p.getPpic().equals(
								"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQCqY-g7jbJ7uHLEG_1mRM267QxikaYfYjcYg&usqp=CAU")) {
						%>
						<img src="<%=p.getPpic()%>" width="100%"
							style="border-radius: 3px;">
						<%
						} else {
						%>


						<img class="card-img-top" src="\WebTech\data\<%=p.getPpic()%>"
							style="border-radius: 3px;">

						<%
						}
						%>


						<div class="card-body">
							<h5 class="card-title" style="text-align: center;"><%=p.getTitle()%></h5>
							<small style="font-size: 12px; float: center;"><%=p.getPdate().toLocaleString()%></small>

							<button class="btn btn-outline-danger btn-sm"
								style="margin-top: 10px;" name="deleteone"
								value="<%=p.getPid()%>">Delete</button>

							<div style="float: right; margin-top: 12px;">
								Select<input type="checkbox" style="margin-left: 5px;"
									name="selectone"/>
							</div>

						</div>
					</div>
					<%
					}
					%>

				</div>
				
			</div>
			<div class="container text-center">
				<button class="btn btn-outline-danger">Delete Selected</button>
			</div>

		</main>
	</form>

	<!-- End Main -->


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

	<script>
		const searchData = () => {
			let filter = document.getElementById("searchtitle").value.toUpperCase();
			let ul = document.getElementById("myUL");
			
			let li = ul.getElementsByTagName("li");
			
			for(var i=0; i<li.length; i++){
                let a = li[i].getElementsByTagName('a')[0];
                let textValue = a.textContent || a.innerHTML;

                if(textValue.toUpperCase().indexOf(filter) > -1){
                    li[i].style.display = '';
                } else {
                    li[i].style.display = 'none';
                }
            }
			
		}
	</script>

	<script>
	function show(){
		$('#searchOption').show();
		$('#searchOp').show();
	}
	</script>


	<script>
		function searchOneTitle(searchpPostId){
			console.log(searchpPostId);
			$('#loader').show();
			$('#searchOption').show();
			$('#searchOp').show();
			
			$.ajax({
				
				url : "webInnerSearch.jsp",
			
				data : {
					searchpPostId : searchpPostId
				},
				success : function(data, textStatus, jqXHR) {
					if (data.trim() != "null") {

						$('#loader').hide();
						
						$('#searchOption').hide();
						$('#searchOp').hide();
						
						$('#post-search-container').html(data);
						console.log(data);
						
					}
				}
			});
		}
	</script>
	<script>
		function searchTitle(searchpPostId){
			console.log(searchpPostId);
			$('#loader').show();
			$('#searchOption').show();
			$('#searchOp').show();
			
			$.ajax({
				
				url : "webInnerSearch.jsp",
			
				data : {
					searchpPostId : searchpPostId
				},
				success : function(data, textStatus, jqXHR) {
					if (data.trim() != "null") {

						$('#loader').hide();
						
						$('#searchOption').hide();
						$('#searchOp').hide();
						
						$('#post-search-user-container').html(data);
						console.log(data);
						
					}
				}
			});
		}
	</script>

</body>
</html>