<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.io.*,java.util.*,helper.BookDAO,bookstore.*,com.google.gson.*" %>
<%
/**
*Search Function
*This function takes the input keywords, split them into single words, 
*and adds a % symbol before and after each word, so that the DB can use the LIKE command
**/
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
	        Gson gson = new Gson();
	        String json = gson.toJson(list);
	        out.println(json);
		}
		else if (searchBy.equals("author"))
		{
			String[] splitKeyword = keyword.split(" ", 0);
	        keyword = "";
	        for (String a : splitKeyword) 
	             keyword += "%"+a;
	        ArrayList<Book> list = BookDAO.searchByAuthor(keyword+"%");
	        Gson gson = new Gson();
	        String json = gson.toJson(list);
	       	out.println(json);
		}
		else if (searchBy.equals("isbn"))
		{
			ArrayList<Book> list = BookDAO.searchByISBN("%"+keyword+"%");
			String json = new Gson().toJson(list);
	        out.println(json);
		}
		else
		{
			ArrayList<Book> list = BookDAO.search("%"+keyword+"%");
			Gson gson = new Gson();
	        String json = gson.toJson(list);
	        out.println(json);
		}
	}
%>