<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Open Library</title>
</head>
<body>

<%
session.invalidate();
response.sendRedirect("/OpenLibrary/index.jsp");
%>

</body>
</html>

