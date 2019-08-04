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
					<h3>Return Book</h3>
				</div>
				<div class="modal-body modal-spa">

					<!--<div class="error_strip txt-center">
				<div class="success txt-center">
				</div>-->
					<div class="login-form">
						<form action="return.jsp" method="post" id="return_book">
							<ol>
								<li><input type="hidden" name="sendbacktopage" value="">
									<input type="text" id="biid" name="bookitemid" placeholder="bookitem" required></li>
							</ol>
							<div class="signin-rit">
								<div class="clear"></div>
							</div>
							<input type="submit" value="Return">
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
	Returns a book
	requires the bookitem id
	*/
	if (request.getParameter("bookitemid") != null) {
		int biid = Integer.parseInt(request.getParameter("bookitemid"));

		if(session.getAttribute("is_admin").equals(true))
		{
			boolean done = BookDAO.ReturnBook(biid);
			out.println(done);
		}
		else{
			response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
			out.println("401 Unauthorized");
		}
		
	}%>