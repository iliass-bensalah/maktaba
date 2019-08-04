<!-- Includes the corresponding form if the user has admin rights,
else returns status 401 -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,helper.*,bookstore.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="/OpenLibrary/Style/openlibrary_style.css">
<title>Open Library - Borrow</title>
</head>
<body>
<% if (session.getAttribute("email") != null && session.getAttribute("is_admin").equals(true)){ %>
<jsp:include page="/views/borrow_form.jsp" flush="true"/>
<%
} 
else
{
	response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
	out.println("401 Unauthorized");
}
%>