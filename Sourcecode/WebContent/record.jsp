<!-- Displays basic informations of the selected book (and if implemented, additional informations
 to the book, like description, language...) -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,helper.BookDAO,bookstore.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="/OpenLibrary/Style/openlibrary_style.css">
<title>Open Library - Record</title>
</head>
<body>
	<%@ include file="/views/nav_bar.jsp"%>
	<%@ include file="/views/search_bar.jsp"%>

	<%
int id = 0;
if (request.getParameter("id")!= null)
{
	id = Integer.parseInt(request.getParameter("id"));
}
Book book = BookDAO.searchById(id);
if (book.getId()!=0)
{
%>
	<div class="cardview">
		<div class="card">
			<h4 class="card_title">
				<b>Title: <%out.println(book.getTitle()); %></b>
			</h4>
			<p class="card_author">
				Author:
				<%out.println(book.getAuthor()); %>
			</p>
			<p class="card_isbn">
				ISBN:
				<%out.println(book.getISBN()); %>
			</p>
			<p class="card_availability">
				<%if(book.getAvailable())
   					 		out.println("Available");
   				 			else out.println("Not Available");%>
			</p>
		</div>
	</div>
	<%}%>