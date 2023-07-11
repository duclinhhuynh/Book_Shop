<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="allCss.jsp"%>
<style type="text/css">
a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
	color: black;
	cursor:pointer;
}
</style>
</head>
<body style ="backgound-color: #f0f1f2">
	<%@include file="navbar.jsp"%>
	<c:if test="${empty userobj }">
		<c:redirect url="../login.jsp"/>
	</c:if>
	<div class="container">
		<div class="row p-5">
			<div class="col-md-3">
				<a href="add_books.jsp">
					<div class="card">
						<div class="card-body text-center text-primary">
							<i class="fa-solid fa-square-plus fa-3x"></i>
							<h4>Admin home</h4>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-3">
				<a href="all_books.jsp">
					<div class="card">
						<div class="card-body text-center text-danger">
							<i class="fa-solid fa-book fa-3x"></i>
							<h4>all_books</h4>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-3">
				<a href="orders.jsp">
					<div class="card">
						<div class="card-body text-center text-warning">
							<i class="fa-solid fa-box-open fa-3x"></i>
							<h4>order</h4>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-3">
				<a data-toggle="modal" data-target="#exampleModal">
					<div class="card">
						<div class="card-body text-center ">
							<i class="fa-solid fa-right-from-bracket fa-3x"></i>
							<h4>logout</h4>
						</div>
					</div>
				</a>
			</div>
		</div>
	</div>
	<div style="margin-top:130px;">
		<%@include file="footer.jsp" %>
	</div>
</body>
</html>