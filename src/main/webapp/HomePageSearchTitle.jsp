<%@page import="com.web.tech.entities.Post"%>
<%@page import="com.web.tech.helper.ConnectionProvider"%>
<%@page import="com.web.tech.dao.PostDao"%>
<div>

	<%
	int searchpPostId = Integer.parseInt(request.getParameter("searchpPostId"));
	
	PostDao pd = new PostDao(ConnectionProvider.getConnection());
	
	Post p = pd.getPostByPostId(searchpPostId);
	%>

	<div class="container text-center" >
		<div class="row mb-2 mt-3">
			<div class="col" style="margin-bottom: 15px;">
				<div class="card" style="width: 18rem;">
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
		</div>
	</div>
	<div class="container text-center">
		<div class="alert alert-info" role="alert">
			<h5 style="letter-spacing: 3px;">Search result END</h5>
		</div>
	</div>

</div>