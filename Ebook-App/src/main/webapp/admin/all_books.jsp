<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.DAO.BookDaoImpl" %> <!-- Replace "your.package.name" with the actual package name for BookDaoImpl -->
<%@ page import="com.DB.DBConnect" %> <!-- Replace "your.package.name" with the actual package name for DBConnect -->
<%@ page import="com.entity.BookDtls" %> <!-- Replace "your.package.name" with the actual package name for BookDaoImpl -->
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: All Books</title>
<%@include file="allCss.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<h3 class="text-center">Admin</h3>
	<c:if test="${not empty succMsg }">
		<p class="text-center text-success">${succMsg}</p>
		<c:remove var="succMsg" scope="session"/>
	</c:if>
	<c:if test="${not empty failedMsg }">
		<p class="text-center text-success">${failedMsg}</p>
		<c:remove var="succMsg" scope="session"/>
	</c:if>
	
	<table class="table table-striped text-center">
		<thead class="bg-primary text-white">
			<tr>
				<th scope="col">ID</th>
				<th scope="col">Image</th>
				<th scope="col">BookName</th>
				<th scope="col">Author</th>
				<th scope="col">Price</th>
				<th scope="col">Categories</th>
				<th scope="col">Status</th>
				<th scope="col">Action</th>
			</tr>
		</thead>
		<tbody>
			<%
			BookDaoImpl dao = new BookDaoImpl(DBConnect.getConnection());
			List<BookDtls> list = dao.getAllBooks();
			for(BookDtls b : list) {	
			%>
			<tr>
				<td><%= b.getBookId() %></td>
				<td><img src="../book/<%=b.getPhotoName()%>"
					style="width: 50px; height: 50px;"></td>					
				<td><%=b.getBookName() %></td>
				<td><%=b.getAuthor() %></td>
				<td><%=b.getPrice() %></td>
				<td><%=b.getBookCategory()%></td>
				<td><%=b.getStatus()%></td>
				<td><a href="edit_books.jsp?id=<%=b.getBookId() %>" class="btn btn-sm btn-primary"><i class="fa-solid fa-pen-to-square"></i> Edit</a>
					<a href="../delete?id=<%=b.getBookId() %>" class="btn btn-sm btn-danger"><i class="fa-solid fa-trash"></i> Delete</a>
				</td>
			</tr>
			<%
			}
			%>

		</tbody>
	</table>
	<%@include file="footer.jsp" %>
</body>
</html>