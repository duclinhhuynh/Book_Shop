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
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All recent book</title>
<%@include file="all_component/allCss.jsp" %>
</head>
<body>
	<%@include file="all_component/navbar.jsp" %>
	<div class="container">
		<h3 class="text-center">Recent book</h3>
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
						
						<%
						if(b.getBookCategory().equals("Old")){
						%>
						<p>Categories:<%=b.getBookCategory()%></p>
						<div class="row">
								<a href="" class="btn btn-success btn-sm p-1 m-1">View Details</a> <a
								href="" class="btn btn-danger btn-sm p-1 m-1"><%=b.getPrice()%></a>
						</div>					
						<%	
						}else{
								
						}
						%>
						<p>Categories:<%=b.getBookCategory()%></p>
						<div class="row">
							<a href="" class="btn btn-danger btn-sm p-1 m-1"><i
								class="fa-solid fa-cart-shopping"></i> Add Cart</a> <a href=""
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
</body>
</html>