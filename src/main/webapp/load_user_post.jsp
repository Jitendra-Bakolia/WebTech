<%@page import="com.web.tech.dao.UserDao"%>
<%@page import="com.web.tech.dao.LikeDao"%>
<%@page import="com.web.tech.entities.User"%>
<%@page import="java.io.File"%>
<%@page import="com.web.tech.entities.Post"%>
<%@page import="com.web.tech.helper.ConnectionProvider"%>
<%@page import="com.web.tech.dao.PostDao"%>
<%@page import="java.util.List"%>

<%
PostDao d = new PostDao(ConnectionProvider.getConnection());
int uid = Integer.parseInt(request.getParameter("user_post"));
List<Post> posts = d.getAllPostByUserId(uid);
%>
<a class="btn btn-danger btn-sm" id="multiple_delete"
	href="delete_multiple_posts.jsp">Delete multiple posts</a>
<div id="your_choice">
	<input type="search" id="searchtitle"
		style="margin-left: 50%; margin-top: 15px; margin-bottom: 0;"
		placeholder="Search" onkeyup="searchData()" onclick="show()">
</div>



<div class="row" style="overflow: hidden; position: relative;">
	<div class="container-fluid" id="post-search-user-container"></div>
	<%
	if (posts.isEmpty()) {
		out.println(
		"<div style='margin-left:70px;'><h3 class='display-3 text-center'>Sorry ! No posts posted by you....</h3></div>");
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

			<%
			LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
			%>

			<%
			HttpSession ses = request.getSession();
			User u = (User) ses.getAttribute("currentUser");
			%>

			<div class="card-footer text-center p_color">
				<a href="#" class="btn btn-outline-light btn-sm"
					onclick="doLike(<%=p.getPid()%>,<%=u.getId()%>)"><i
					class="fa fa-thumbs-o-up"></i><span class="like_count"><%=ld.countLikesOnPost(p.getPid())%></span></a>
				<a href="show_tech_page.jsp?postid=<%=p.getPid()%>"
					class="btn btn-outline-light btn-sm">Read more ...</a> <a
					href="show_tech_page.jsp?postid=<%=p.getPid()%>"
					class="btn btn-outline-light btn-sm"><i
					class="fa fa-commenting-o"
					style="margin-left: 4px; margin-right: 5px"></i></a>
			</div>
		</div>
	</div>

	<div class="st" id="hidemoble">
		<div class="card" id="card-user">
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
					onclick="doLike(<%=p.getPid()%>,<%=u.getId()%>)"><i
					class="fa fa-thumbs-o-up"></i><span class="like_count"><%=ld.countLikesOnPost(p.getPid())%></span></a>
				<a href="show_tech_page.jsp?postid=<%=p.getPid()%>"
					class="btn btn-outline-light btn-sm">Read more ...</a> <a
					href="show_tech_page.jsp?postid=<%=p.getPid()%>"
					class="btn btn-outline-light btn-sm"><i
					class="fa fa-commenting-o"
					style="margin-left: 4px; margin-right: 5px"></i></a>
			</div>
		</div>
	</div>


	<%
	}
	%>


	<div id="searchOp"
		style="position: absolute; right: 0; width: 280px; margin-right: 20px; margin-top: 3px; display: none;">
		<ul id="myTitle" class="list-group">

			<%
			for (Post pt : posts) {
			%>

			<li class="list-group-item" id="searchlist"
				onclick="searchTitle(<%=pt.getPid()%>)"><a id="pointer"
				style="color: white"><%=pt.getTitle()%></a></li>
			<%
			}
			%>
		</ul>
	</div>


</div>

<script>
	function doLike(pid,uid){
		const d = {
				pid : pid,
				uid : uid,
				opreation : 'like'
		}
		
		$.ajax({
			url : 'LikeServlet',
			data : d,
			success: function(data, textStatus, jqXHR){
				if(data.trim() == 'true'){
					let c = $('.like_count').html();
					c++;
					$('.like_count').html(c);
				} else {
					let c = $('.like_count').html();
					c--;
					$('.like_count').html(c);	
				}
			},
			error: function(jqXHR, textStatus, errorThrown){
				console.log(data);
			}
		});
		
	}
</script>
