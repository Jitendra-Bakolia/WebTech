<%@page import="com.web.tech.entities.User"%>
<%@page import="com.web.tech.dao.LikeDao"%>
<%@page import="com.web.tech.helper.ConnectionProvider"%>
<%@page import="com.web.tech.entities.Post"%>
<%@page import="com.web.tech.dao.PostDao"%>
<div>
	<%
	int searchpPostId = Integer.parseInt(request.getParameter("searchpPostId"));

	PostDao pd = new PostDao(ConnectionProvider.getConnection());

	Post p = pd.getPostByPostId(searchpPostId);
	%>

	<div class="container text-center">
		<div class="col-md-8 offset-md-2 mt-2 md-5">
			<div class="card">
				<%
				String path = p.getPpic();
				if (path.equals(
						"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQCqY-g7jbJ7uHLEG_1mRM267QxikaYfYjcYg&usqp=CAU")) {
				%>
				<img class="card-img-top" src="<%=p.getPpic()%>"
					alt="Card image cap">
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

		<div class="container mt-4">
			<div class="alert alert-dark" role="alert">
				<h5 style="letter-spacing: 3px;">Search result END</h5>
			</div>
		</div>

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