<!-- Authentication of users -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.io.*,java.util.*,helper.UserDAO,account.User" %>

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
					<h3>Login form</h3>
				</div>
				<div class="modal-body modal-spa">

									<!--<div class="error_strip txt-center">
					<img src="images/error.png" alt="error" />User already exists
				</div>
				<div class="success txt-center">
					Successfully Registered
				</div>-->
					<div class="login-form">
						<form action="login.jsp" method="post" id="signup">
						<ol>
												<li>
													<input type="hidden" name="sendbacktopage" value="">
													<input type="email" id="email" name="email" placeholder="e.g. mail@example.com" title="Please enter a valid email" required>
													<p class="validation01">
														<span class="invalid">Please enter a valid email address e.g. ryan@example.com</span>
														<span class="valid">Thank you for entering a valid email</span>
													</p>
												</li>
												<li>
											<input type="password" class="lock" name="password" placeholder="password" id="password" required>

											</li>
							</ol>
							<div class="signin-rit">
								<div class="clear"> </div>
							</div>
							<input type="submit" value="Login">
						</form>
						<p>Don't Have an Account? <a href="/OpenLibrary/signup.jsp">Sign up</a></p>
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
Authenticates a user, sets a session
then redirects to the homepage
*/
	if (request.getParameter("email")!= null)
{
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		User user = new User(0, email, password, false);
		//LoginDAO dao = new LoginDAO();
		boolean done = UserDAO.authenticate(user);
		if (done) {
			session.setAttribute("id", user.getId());
			session.setAttribute("is_admin", user.getIsAdmin());
			session.setAttribute("email", email);
			response.sendRedirect("/OpenLibrary/index.jsp");
		}
		else {
			out.println("Wrong email or password");
		}
	}
%>