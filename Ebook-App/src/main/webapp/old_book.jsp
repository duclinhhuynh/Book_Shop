<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page isELIgnored="false"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="com.DAO.BookDaoImpl"%>
<!-- Replace "your.package.name" with the actual package name for BookDaoImpl -->
<%@ page import="com.DB.DBConnect"%>
<!-- Replace "your.package.name" with the actual package name for DBConnect -->
<%@ page import="com.entity.BookDtls"%>
<!-- Replace "your.package.name" with the actual package name for BookDaoImpl -->
<%@ page import="java.util.List"%>
<%@ page import="com.entity.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User: Old book</title>
<%@include file="all_component/allCss.jsp"%>
</head>


<body>
	<%@include file="all_component/navbar.jsp"%>
	<c:if test="${not empty succMsg}">
		<p class="text-center text-success">${succMsg}</p>
		<c:remove var="succMsg" scope="session" />
	</c:if>
	<div class="container p-5">
		<table class="table table-striped table-bordered">
			<thead class="thead-primary">
				<tr>
					<th>BookName</th>
					<th>Author</th>
					<th>Price</th>
					<th>Category</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<%
				User u = (User) session.getAttribute("userobj");
				String email = u.getEmail();
				BookDaoImpl dao = new BookDaoImpl(DBConnect.getConnection());
				List<BookDtls> list = dao.getBookByOld(email, "Old");
				for (BookDtls b : list) {
				%>
				<tr>
					<th><%=b.getBookName()%></th>
					<td><%=b.getAuthor()%></td>
					<td><%=b.getPrice()%></td>
					<td><%=b.getBookCategory()%></td>
					<td><a href="delete_old_book?em=<%=email%>&&id=<%=b.getBookId()%>"
						class="btn btn-sm btn-danger">Delete</a></td>
				</tr>
				<%
				}
				%>

			</tbody>
		</table>
	</div>
</body>
</html>