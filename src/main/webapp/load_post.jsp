<%@page import="com.web.tech.dao.LikeDao"%>
<%@page import="com.web.tech.entities.User"%>
<%@page import="java.io.File"%>
<%@page import="com.web.tech.entities.Post"%>
<%@page import="com.web.tech.helper.ConnectionProvider"%>
<%@page import="com.web.tech.dao.PostDao"%>
<%@page import="java.util.List"%>


<%
PostDao d = new PostDao(ConnectionProvider.getConnection());
int cid = Integer.parseInt(request.getParameter("cidd"));
List<Post> posts = null;
%>


<input type="search" id="searchtitle" placeholder="Search"
	onkeyup="searchData()" onclick="show()" />



<div class="row" style="overflow: hidden; position: relative;">
	<div class="container-fluid" id="post-search-container"></div>
	<%
	if (cid == 0) {
		posts = d.getAllPost();

	} else {
		posts = d.getPostByCatId(cid);

	}

	if (posts.size() == 0) {
		out.println(
		"<div style='margin-left:70px;'><h3 class='display-3 text-center'>No posts in this category....</h3></div>");
		return;
	}
	%>
	<%
	for (Post p : posts) {
	%>
	<div class="col-md-6 mt-2 md-5" id="hidepost">
		<div class="card">
			<%
			String path = p.getPpic();
			if (path.equals(
					"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQCqY-g7jbJ7uHLEG_1mRM267QxikaYfYjcYg&usqp=CAU")) {
			%>
			<img class="card-img-top" src="<%=p.getPpic()%>" alt="Card image cap">
			<%
			} else {
			%>
			<img class="card-img-top" src="\WebTech\data\<%=p.getPpic()%>"
				alt="Card image cap">
			<%
			}
			%>

			<div class="card-body">
				<p style="text-align: center;">
					<b><%=p.getTitle()%></b>
				</p>
				<hr>
				<p style="text-align: right;"><%=p.getPdate().toLocaleString()%></p>
			</div>
			<div class="card-footer text-center p_color">

				<%
				User user = (User) session.getAttribute("currentUser");
				%>

				<%
				LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
				%>

				<a href="#" class="btn btn-outline-light btn-sm"
					onclick="doLike(<%=p.getPid()%>,<%=user.getId()%>)"><i
					class="fa fa-thumbs-o-up"></i><span class="like-counter"><%=ld.countLikesOnPost(p.getPid())%></span></a>
				<a href="show_tech_page.jsp?postid=<%=p.getPid()%>"
					class="btn btn-outline-light btn-sm">Read more ...</a> <a
					href="show_tech_page.jsp?postid=<%=p.getPid()%>"
					class="btn btn-outline-light btn-sm" id="cmt"> <i
					class="fa fa-commenting-o"
					style="margin-left: 4px; margin-right: 5px"></i>
				</a>
			</div>
		</div>
	</div>

	<div class="st" id="hidemoble">
		<div class="card">
			<%
			if (path.equals(
					"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQCqY-g7jbJ7uHLEG_1mRM267QxikaYfYjcYg&usqp=CAU")) {
			%>
			<img class="card-img-top" src="<%=p.getPpic()%>" alt="Card image cap">
			<%
			} else {
			%>
			<img class="card-img-top" src="\WebTech\data\<%=p.getPpic()%>"
				alt="Card image cap">
			<%
			}
			%>

			<div class="card-body">
				<p style="text-align: center;">
					<b><%=p.getTitle()%></b>
				</p>
				<hr>
				<p style="text-align: right;"><%=p.getPdate().toLocaleString()%></p>
			</div>
			<div class="card-footer text-center p_color">
				<a href="#" class="btn btn-outline-light btn-sm"
					onclick="doLike(<%=p.getPid()%>,<%=user.getId()%>)"><i
					class="fa fa-thumbs-o-up"></i><span class="like-counter"><%=ld.countLikesOnPost(p.getPid())%></span></a>
				<a href="show_tech_page.jsp?postid=<%=p.getPid()%>"
					class="btn btn-outline-light btn-sm">Read more ...</a> <a
					href="show_tech_page.jsp?postid=<%=p.getPid()%>"
					class="btn btn-outline-light btn-sm" id="cmt"> <i
					class="fa fa-commenting-o"
					style="margin-left: 4px; margin-right: 5px"></i>
				</a>
			</div>
		</div>
	</div>

	<%
	}
	%>

	<div id="searchOption"
		style="position: absolute; right: 0; width: 280px; margin-right: 20px; margin-top: 3px; display: none;">
		<ul id="myUL" class="list-group">

			<%
			for (Post pt : posts) {
			%>

			<li class="list-group-item" id="searchlist"
				onclick="searchOneTitle(<%=pt.getPid()%>)"><a id="pointer"
				style="color: white"><%=pt.getTitle()%></a></li>
			<%
			}
			%>
		</ul>
	</div>

</div>
<script>
	function doLike(pid, uid) {
		console.log("pid : "+pid+"  uid  : "+uid);
		
		const d = {
				uid: uid,
				pid: pid,
				opreation : 'like'
			}
		
		$.ajax({
			url : 'LikeServlet',
			data : d,
			success: function(data, textStatus, jqXHR){
				console.log(data);
				if(data.trim() == 'true'){
					let c = $('.like-counter').html();
					c++;
					$('.like-counter').html(c);
				}
				if(data.trim() != 'true'){
					let c = $('.like-counter').html();
					c--;
					$('.like-counter').html(c);
				}
			},
			error: function(jqXHR, textStatus, errorThrown){
				console.loh(data);				
			}
			
		});
		
	}
	
/* 	$(document).ready(function (e){
		e.preventDeafult();
	}); */
</script>