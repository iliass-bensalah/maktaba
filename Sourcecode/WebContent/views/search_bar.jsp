<!-- Search bar with 4 options to tune the search operation,
for better usability, it keeps the last selected option as default -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<div id="home">
	<div class="bg-container">
		<div class=bg-text>
			<h4>Open Library</h4>
		</div>
		<form action="search.jsp" method="get">
			<div class="bg-grid-container">
				<div class="bg-grid">
					<div>
						<input type="text" name="keyword" id="keyword"
							placeholder="search the library" required>
					</div>
					<div>
						<select name="search_by" id=search_selector size="1">
						<%
						int select = 0;
						if (request.getParameter("search_by")!= null)
							{
								if (request.getParameter("search_by").equals("title"))
								{
									select = 1;
								}
								else if (request.getParameter("search_by").equals("author"))
								{
									select = 2;
								}
								else if (request.getParameter("search_by").equals("isbn"))
								{
									select = 3;
								}
								else select = 0;
							}
							%>
							<option <%if (select==0)out.println("selected"); %>>all</option>
							<option <%if (select==1)out.println("selected"); %>>title</option>
							<option <%if (select==2)out.println("selected"); %>>author</option>
							<option <%if (select==3)out.println("selected"); %>>isbn</option>
						</select>
					</div>
					<div>
						<input id="search-button" type="submit" value="Find">
					</div>
				</div>
			</div>
		</form>

	</div>
</div>