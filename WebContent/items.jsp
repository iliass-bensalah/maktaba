<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,helper.BookDAO,bookstore.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="/OpenLibrary/Style/openlibrary_style.css">
<title>Open Library - Items</title>
</head>
<body>

	<%@ include file="/views/nav_bar.jsp"%>
	<%@ include file="/views/search_bar.jsp"%>
	<%
int uid = 0;
if (session.getAttribute("id")!= null)
{
	uid = Integer.parseInt(session.getAttribute("id").toString());
	ArrayList<BookItem> list = BookDAO.fetchBookitemByUser(uid);
	if (list.size()>0)
	{
%>
	<div class="cardview">
		<%for (int i = 0; i< list.size(); i++)
	{
	%>
		<div class="card">
			<h4 class="card_title">
				<b>Title: <%out.println(list.get(i).getTitle()); %></b>
			</h4>
			<p class="card_author">
				Author:
				<%out.println(list.get(i).getAuthor()); %>
			</p>
			<p class="card_isbn">
				ISBN:
				<%out.println(list.get(i).getISBN()); %>
			</p>
			<p class="card_biid">
				BIID:
				<%out.println(list.get(i).getBookItemId()); %>
			</p>
			<p class="card_brdate">
				Borrow Date:
				<%out.println(list.get(i).getBorrowDate()); %>
			</p>
			
		</div>
	<%}%>
		</div>
	<%}
	}%>


</body>
</html>