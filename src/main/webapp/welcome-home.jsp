<%@page import="com.web.tech.entities.Category"%>
<%@page import="com.web.tech.entities.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.web.tech.helper.ConnectionProvider"%>
<%@page import="com.web.tech.dao.PostDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page errorPage="error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome-Home</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link href="style.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
.banner_background {
	clip-path: polygon(50% 0%, 80% 0, 100% 0, 100% 80%, 73% 85%, 45% 96%, 18% 98%, 0
		93%, 0 0, 20% 0);
	overflow: hidden;
	position: relative;
}

#mainHeader {
	overflow: hidden;
	position: relative;
}

#searchOption {
	top: 0px;;
	right: 0px;
	position: absolute;
	width: 193px;
}

#hoverIffect {
	background-color: black;
}

#hoverIffect:hover {
	background-color: #424242;
}

@media only screen and (max-width: 600px) {
	#searchOption {
		top: 0px;;
		left: 0px;
		position: absolute;
		width: 193px;
	}
}

@media only screen and (max-width: 990px) {
	#searchOption {
		top: 0px;;
		left: 0px;
		position: absolute;
		width: 193px;
	}
}

#pointer {
	cursor: pointer;
}

.st {
	display: flex;
	margin-left: auto;
	margin-right: auto;
}

.card {
	width: 18rem;
}

@media only screen and (max-width: 990px) {
	.st {
		display: flex;
		margin-left: auto;
		margin-right: auto;
	}
	.card {
		width: 45rem;
		margin-bottom: 20px;
	}
}

@media screen and (min-width: 30em) and (orientation: landscape) {
	.card {
		width: 20rem;
	}
}
</style>

</head>
<body>
	<!-- nav-bar -->
	<%@include file="nav.jsp"%>
	<%
	PostDao dao = new PostDao(ConnectionProvider.getConnection());
	%>


	<!-- banner -->
	<div class="container-fluld p-0 m-0">
		<div class="jambotron p_color text-white banner_background">
			<div class="container" id="mainHeader">
				<br> <br>
				<h3 class="display-4">Welcome to Web-Tech</h3>
				<p style="margin-bottom: 10px;" id="mm">Most programming
					languages consist of instructions for computers. There are
					programmable machines that use a set of specific instructions,
					rather than general programming languages. Since the early 1800s,
					programs have been used to direct the behavior of machines such as
					Jacquard looms, music boxes and player pianos.[1] The programs for
					these machines (such as a player piano's scrolls) did not produce
					different behavior in response to different inputs or conditions.</p>
				<br> <br> <a href="register.jsp"
					class="btn btn-outline-light btn-lg"><span
					class="fa fa-user-plus"></span>Start ! Its Free</a> <a href="login.jsp"
					class="btn btn-outline-light btn-lg"><span
					class="fa fa-user-o fa-spin"></span>LOGIN</a> <br> <br>


				<div id="searchOption" style="display: none;">
					<ul id="myUL" class="list-group">
						<%
						List<Post> postlist = dao.getAllPost();
						for (Post l : postlist) {
						%>

						<li class="list-group-item" id="hoverIffect"
							onclick="getTitleSearchResult(<%=l.getPid()%>)"><a
							id="pointer" style="color: white"><%=l.getTitle()%></a></li>
						<%
						}
						%>
					</ul>
				</div>


			</div>
		</div>
	</div>

	<!-- categories result -->

	<div id="mainSearch" style="display: none;">

		<div id="searchData"></div>

	</div>


	<!-- title result -->

	<div id="titleSearch" style="display: none;">

		<div id="data"></div>

	</div>



	<div id="Loader" class="container text-center" style="display: none">
		<i class="fa fa-refresh  fa-4x fa-spin mt-4"></i>
		<h3 class="mt-4">Loading....</h3>
	</div>



	<br>

	<%
	List<Post> posts = dao.getAllPost();
	%>


	<div class="container">
		<div class="container-fluld">
			<div class="row mb-2">
				<%
				for (Post p : posts) {
				%>

				<div class="st" id="responsive" style="margin-bottom: 15px;">
					<div class="card">
						<div class="card-header p_color text-white text-center">
							<h5 class="card-title"><%=p.getTitle()%></h5>
						</div>
						<div class="card-body">

							<%
							if (p.getPpic().equals(
									"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQCqY-g7jbJ7uHLEG_1mRM267QxikaYfYjcYg&usqp=CAU")) {
							%>
							<img src="<%=p.getPpic()%>" width="100%"
								style="margin-bottom: 10px; border-radius: 3px;">
							<%
							} else {
							%>
							<img src="\WebTech\data\<%=p.getPpic()%>" width="100%"
								style="margin-bottom: 10px; border-radius: 3px;">
							<%
							}
							%>
							<p class="card-text"><%=p.getPcontent()%></p>
							<small class="card-text"
								style="float: right; margin-bottom: 10px;"><%=p.getPdate().toLocaleString()%></small>
							<a href="login.jsp" class="btn btn-outline-primary">Read
								more...</a><a href="login.jsp" style="margin-left: 15px">Need to
								login...</a>
						</div>

					</div>
				</div>
				<%
				}
				%>
			</div>
		</div>
	</div>








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


	<script>
		function getSearchResult() {
			var catname = document.getElementById("searchBox").value;

			$('#Loader').show();

			$.ajax({
				url : "HomePageSearch.jsp",
				data : {
					catname : catname
				},
				success : function(data, textStatus, jqXHR) {
					if (data.trim() != "null") {

						$('#Loader').hide();
						$('#mainSearch').show();
						console.log(data);
						$('#searchData').html(data);

					}
				}

			})

		}
	</script>

	<script>

        const SearchData = () => {
			
        	
            let filter = document.getElementById("searchBox").value.toUpperCase();

            $('#searchOption').show();
            
            if(filter != null){
            
            let ul =document.getElementById("myUL");

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
            } else {
            	$('#searchOption').hide();
            }
        }

    </script>


	<script>
    const getTitleSearchResult = (searchpPostId) => {
		console.log(searchpPostId);
		
		$('#Loader').show();
		$('#searchOption').hide();
		$.ajax({
			
			url : "HomePageSearchTitle.jsp",
		
			data : {
				searchpPostId : searchpPostId
			},
			success : function(data, textStatus, jqXHR) {
				if (data.trim() != "null") {

					$('#Loader').hide();
					$('#titleSearch').show();
					$('#data').html(data);
					console.log(data);
					
				}
			}
		});
	}
    </script>
</body>
</html>