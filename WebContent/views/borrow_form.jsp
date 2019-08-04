<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.io.*,java.util.*,helper.*,account.*, bookstore.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title>Open Library - login</title>
<link rel="stylesheet" href="/OpenLibrary/Style/form_style.css">
<link rel="stylesheet" href="/OpenLibrary/Style/openlibrary_style.css">
<link href="//fonts.googleapis.com/css?family=Open+Sans:400,700,800" rel="stylesheet" type="text/css">
<link href="//fonts.googleapis.com/css?family=Oxygen:400,700,300" rel="stylesheet" type="text/css">
</head>
<body>
<%@ include file="/views/nav_bar.jsp" %>
<div class="signup-section">
		<div class="signup">
			<div class="modal-content modal-info">
				<div class="modal-header">
					<h3>Borrow</h3>
				</div>
				<div class="modal-body modal-spa">
					<div class="login-form">
						<form action="borrow.jsp" method="post" id="signup">
						<ol>
												<li>
													<input type="hidden" name="sendbacktopage" value="">
													<input type="email" id="useremail" name="useremail" placeholder="e.g. mail@example.com" title="Please enter a valid email" required>
													<p class="validation01">
														<span class="invalid">Please enter a valid email address e.g. ryan@example.com</span>
														<span class="valid">Thank you for entering a valid email</span>
													</p>
												</li>
												<li>
											<input type="text" class="lock" name="bookitem_id" placeholder="bookitem id" id="bookitem_id" required>

											</li>
							</ol>
							<div class="signin-rit">
								<div class="clear"> </div>
							</div>
							<input type="submit" value="Borrow">
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
	if (request.getParameter("useremail") != null && request.getParameter("bookitem_id") != null ) {
		String userEmail = request.getParameter("useremail");
		int biid = Integer.parseInt(request.getParameter("bookitem_id"));

		BookItem bookitem = new BookItem();
		bookitem.setId(biid);
		if(session.getAttribute("is_admin").equals(true))
		{
			if(BookDAO.isBookItemAvailable(biid))
			{
				Boolean done = BookDAO.BorrowBook(userEmail, biid);
				out.println("done");
			}
			else out.println("bookitem not available");
			
		}
		else{
			response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
			out.println("401 Unauthorized");
		}
		
	}
%>