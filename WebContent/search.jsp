<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.io.*,java.util.*,helper.BookDAO,bookstore.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="/OpenLibrary/Style/openlibrary_style.css">
<title>Open Library - Search</title>
</head>
<body>
<%@ include file="/views/nav_bar.jsp" %>
<%@ include file="/views/search_bar.jsp" %>
<%
/*
Search Function
*/
	if (request.getParameter("keyword")!= null && request.getParameter("search_by") != null)
{
		String keyword = request.getParameter("keyword");
		String searchBy = request.getParameter("search_by").toString();
		if (searchBy.equals("title"))
		{ 
			
	        String[] splitKeyword = keyword.split(" ", 0);
	        keyword = "";
	        for (String a : splitKeyword) 
	             keyword += "%"+a;
	        keyword+= "%";
	        ArrayList<Book> list = BookDAO.searchByTitle(keyword+"%");
	        %>
			<div class="cardview">
			<%
			for (int i = 0; i< list.size(); i++)
			{%>
				<a href="record.jsp?id=<%out.println(list.get(i).getId()); %>">
					<div class="card">
   				 		<h4 class="card_title"><b>Title: <%out.println(list.get(i).getTitle()); %></b></h4>
   				 		<p class="card_author">Author: <%out.println(list.get(i).getAuthor()); %></p>
   				 		<p class="card_isbn">ISBN: <%out.println(list.get(i).getISBN()); %></p>
   				 		<p class="card_availability">
   				 			<%if(list.get(i).getAvailable())
   					 		out.println("Available");
   				 			else out.println("Not Available");%>
   						</p>
  				</div>
  				</a>
		  <%}%>
		  </div>
		  <%
		}
		else if (searchBy.equals("author"))
		{
			String[] splitKeyword = keyword.split(" ", 0);
	        keyword = "";
	        for (String a : splitKeyword) 
	             keyword += "%"+a;
	        ArrayList<Book> list = BookDAO.searchByAuthor(keyword+"%");
	        %>
			<div class="cardview">
			<%
			for (int i = 0; i< list.size(); i++)
			{%>
				<a href="record.jsp?id=<%out.println(list.get(i).getId()); %>">
					<div class="card">
   				 		<h4 class="card_title"><b>Title: <%out.println(list.get(i).getTitle()); %></b></h4>
   				 		<p class="card_author">Author: <%out.println(list.get(i).getAuthor()); %></p>
   				 		<p class="card_isbn">ISBN: <%out.println(list.get(i).getISBN()); %></p>
   				 		<p class="card_availability">
   				 			<%if(list.get(i).getAvailable())
   					 		out.println("Available");
   				 			else out.println("Not Available");%>
   						</p>
  				</div>
  				</a>
		  <%}%>
		  </div>
		  <%
		}
		else if (searchBy.equals("isbn"))
		{
			ArrayList<Book> list = BookDAO.searchByISBN("%"+keyword+"%");
			%>
			<div class="cardview">
			<%
			for (int i = 0; i< list.size(); i++)
			{%>
				<a href="record.jsp?id=<%out.println(list.get(i).getId()); %>">
					<div class="card">
   				 		<h4 class="card_title"><b>Title: <%out.println(list.get(i).getTitle()); %></b></h4>
   				 		<p class="card_author">Author: <%out.println(list.get(i).getAuthor()); %></p>
   				 		<p class="card_isbn">ISBN: <%out.println(list.get(i).getISBN()); %></p>
   				 		<p class="card_availability">
   				 			<%if(list.get(i).getAvailable())
   					 		out.println("Available");
   				 			else out.println("Not Available");%>
   						</p>
  				</div>
  				</a>
		  <%}%>
		  </div>
		  <%
		}
		else
		{
			ArrayList<Book> list = BookDAO.search("%"+keyword+"%");
			%>
			<div class="cardview">
			<%
			for (int i = 0; i< list.size(); i++)
			{%>
				<a href="record.jsp?id=<%out.println(list.get(i).getId()); %>">
					<div class="card">
   				 		<h4 class="card_title"><b>Title: <%out.println(list.get(i).getTitle()); %></b></h4>
   				 		<p class="card_author">Author: <%out.println(list.get(i).getAuthor()); %></p>
   				 		<p class="card_isbn">ISBN: <%out.println(list.get(i).getISBN()); %></p>
   				 		<p class="card_availability">
   				 			<%if(list.get(i).getAvailable())
   					 		out.println("Available");
   				 			else out.println("Not Available");%>
   						</p>
  				</div>
  				</a>
		  <%}%>
		  </div>
		  <%
		}
	}
%>
<body>

</body>
</html>