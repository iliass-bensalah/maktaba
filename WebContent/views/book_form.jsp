<%@ page import = "java.io.*,java.util.*,helper.BookDAO,bookstore.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>Open Library - login</title>
<link rel="stylesheet" href="/OpenLibrary/Style/form_style.css">
<link rel="stylesheet" href="/OpenLibrary/Style/openlibrary_style.css">
<link href="//fonts.googleapis.com/css?family=Open+Sans:400,700,800"
	rel="stylesheet" type="text/css">
<link href="//fonts.googleapis.com/css?family=Oxygen:400,700,300"
	rel="stylesheet" type="text/css">
</head>
<body>
	<%@ include file="/views/nav_bar.jsp"%>
	<div class="signup-section">
		<div class="signup">
			<div class="modal-content modal-info">
				<div class="modal-header">
					<h3>Add Book</h3>
				</div>
				<div class="modal-body modal-spa">

					<!--<div class="error_strip txt-center">
				<div class="success txt-center">
				</div>-->
					<div class="login-form">
						<form action="manage.jsp" method="post" id="add_book">
							<ol>
								<li><input type="hidden" name="sendbacktopage" value="">
									<input type="text" id="title" name="title" placeholder="Title"
									title="Please enter a title" required></li>
								<li><input type="text" name="author" placeholder="author"
									id="author" required></li>
								<li><input type="text" name="isbn" placeholder="ISBN"
									id="isbn" required></li>
								<li><input type="number" name="copies" placeholder="1"
									id="copies" step="1" min="1" max="20" required></li>
							</ol>
							<div class="signin-rit">
								<div class="clear"></div>
							</div>
							<input type="submit" value="Add">
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- //sign up -->
		<div class="clear"></div>
	</div>
</body>
</html>

<%
	/*
	Adds books to the database
	*/
	if (request.getParameter("title") != null) {
		String title = request.getParameter("title");
		String author = request.getParameter("author");
		String ISBN = request.getParameter("isbn");
		int copies = Integer.parseInt(request.getParameter("copies"));

		Book book = new Book(title, author, ISBN);
		if(session.getAttribute("is_admin").equals(true))
		{
			boolean done = BookDAO.saveBookItem(book, copies);
			out.println(done);
		}
		else{
			response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
			out.println("401 Unauthorized");
		}
		
	}
%>