<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="com.DAO.BookDaoImpl"%>
<!-- Replace "your.package.name" with the actual package name for BookDaoImpl -->
<%@ page import="com.DB.DBConnect"%>
<!-- Replace "your.package.name" with the actual package name for DBConnect -->
<%@ page import="com.entity.BookDtls"%>
<!-- Replace "your.package.name" with the actual package name for BookDaoImpl -->
<%@ page import="java.util.List"%>
<%@ page import="com.entity.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ebook : index</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
.back-img {
	background: url("img/b.jpg");
	height: 80vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}

.crd-ho:hover {
	background-color: #fcf7f7;
}
</style>
</head>
<body style="background-color: #f7f7f7;">
	<%
	User u = (User) session.getAttribute("userobj");
	%>
	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid back-img">
		<h2 class="text-center text-danger">Book Management</h2>
	</div>
	<div class="container">
		<h3 class="text-center">New book</h3>
		<div class="row">
			<%
			BookDaoImpl dao2 = new BookDaoImpl(DBConnect.getConnection());
			List<BookDtls> list2 = dao2.getNewBooks();
			for (BookDtls b : list2) {
			%>
			<div class=col-md-3>
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px" class="img-thumblin">

						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p><%=b.getBookCategory()%></p>
						<div class="row">
							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm p-1 m-1 ml-2"><i
								class="fa-solid fa-cart-shopping"></i>Add cart</a>
							<%
							} else {
							%>
							<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm p-1 m-1 ml-2"><i
								class="fa-solid fa-cart-shopping"></i>Add cart</a>

							<%
							}
							%>
							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm p-1 m-1">View Details</a> <a
								href="" class="btn btn-danger btn-sm p-1 m-1"><%=b.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
	</div>
	<div class="text-center">
		<a href="all_new_book.jsp"
			class="btn btn-danger btn-sm test-white mt-2 m-3">View All</a>
	</div>
	<!-- Start recent book -->
	<div class="container">
		<h3 class="text-center">Popular Book</h3>
		<div class="row">
			<%
			BookDaoImpl dao = new BookDaoImpl(DBConnect.getConnection());
			List<BookDtls> list = dao.getRecentBooks();
			for (BookDtls b : list) {
			%>
			<div class=col-md-3>
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px" class="img-thumblin">

						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							Categories:
							<%=b.getBookCategory()%></p>
						<div class="row">
							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm p-1 m-1 ml-2"><i
								class="fa-solid fa-cart-shopping"></i>Add cart</a>
							<%
							} else {
							%>
							<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm p-1 m-1 ml-2"><i
								class="fa-solid fa-cart-shopping"></i>Add cart</a>

							<%
							}
							%>

							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm p-1 m-1">View Details</a> <a
								href="" class="btn btn-danger btn-sm p-1 m-1"><%=b.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
	</div>

	<div class="text-center">
		<a href="all_recent_book.jsp"
			class="btn btn-danger btn-sm test-white mt-2 m-3">View All</a>
	</div>
	<!-- End recent book -->
	<hr>
	<!-- Start New book -->

	<div class="container">
		<h3 class="text-center">Deal book</h3>
		<div class="row">
			<%
			BookDaoImpl dao3 = new BookDaoImpl(DBConnect.getConnection());
			List<BookDtls> list3 = dao3.getOldBooks();
			for (BookDtls b : list3) {
			%>
			<div class=col-md-3>
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px" class="img-thumblin">

						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p><%=b.getBookCategory()%></p>
						<div class="row">
							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm p-1 m-1 ml-2"><i
								class="fa-solid fa-cart-shopping"></i>Add cart</a>
							<%
							} else {
							%>
							<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm p-1 m-1 ml-2"><i
								class="fa-solid fa-cart-shopping"></i>Add cart</a>

							<%
							}
							%>
							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm p-1 m-1">View Details</a> <a
								href="" class="btn btn-danger btn-sm p-1 m-1"><%=b.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
	</div>
	<div class="text-center">
		<a href="all_old_book.jsp"
			class="btn btn-danger btn-sm test-white mt-2 m-3">View All</a>
	</div>
	<%@include file="all_component/footer.jsp"%>
</body>
</html>