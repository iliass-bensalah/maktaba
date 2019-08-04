<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,helper.UserDAO,account.User"%>
<%
String link1 = "login";
String name1 = "login";
String link2 = "signup";
String name2 = "register";
if (session.getAttribute("email") != null)
{
	link1 = "items";
	link2 = "logout";
	name1 = "items";
	name2 = "logout";
}
%>

<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<link href="test_style.css" rel="stylesheet" type="text/css">
<title>Open Library</title>
</head>

<body>
	<header>
		<nav>
			<ul class="left_side">
				<li><a href="/OpenLibrary/index.jsp">Home</a></li>
			</ul>

			<ul class="right_side">

				<% 
                    if (session.getAttribute("email") != null)
                    {
                     if (session.getAttribute("is_admin").equals(true))
                		{
                    	 out.println("<li><a href=\"/OpenLibrary/borrow.jsp\">borrow</a></li>");
                    	 out.println("<li><a href=\"/OpenLibrary/return.jsp\">return</a></li>");
                    	 out.println("<li><a href=\"/OpenLibrary/manage.jsp\">manage</a></li>");
                    	
                		} 
                    }
                	%>
				<li><a href="/OpenLibrary/<%out.println(link1);%>.jsp">
						<%out.println(name1);%>
				</a></li>
				<li><a href="/OpenLibrary/<%out.println(link2);%>.jsp">
						<%out.println(name2);%>
				</a></li>
			</ul>
		</nav>
	</header>

</body>

</html>