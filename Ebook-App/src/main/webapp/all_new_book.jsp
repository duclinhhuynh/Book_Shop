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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@ page import="com.entity.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All new book</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
</style>
</head>
<body>
<%
	User u = (User) session.getAttribute("userobj");
	%>

	<c:if test="${not empty addCart}">
		<div id="toast">${addCart}</div>
		<script type="text/javascript">
		showToast();
		function showToast(concent){
			$('#toast').addClass("show");
			$('#toast').html(content);
			setTimeout(()=>{
				$("toast").removeClass("show");
			},2000)
			
		}
	</script>
	</c:if>

	<%@include file="all_component/navbar.jsp"%>
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
						<p>Categories:New</p>
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
								<a href=""
								class="btn btn-success btn-sm p-1 m-1">View Details</a> 
								<a
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