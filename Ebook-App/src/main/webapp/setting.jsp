<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="all_component/allCss.jsp"%>
<style style="text/css">
a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
}
</style>

</head>
<body style="background-color: #f7f7f7">
	<%@include file="all_component/navbar.jsp"%>
	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp" />
	</c:if>
	<div class="container">
	<c:if test="${not empty userobj}">
		<h3 class="text-center">Hello,${userobj.name}</h3>
	</c:if>
		<div class="row p-5">
			<div class="col-md-4 mt-3">
				<a href="sell_book.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fas fa-book-open fa-3x"> </i>
							</div>
							<h3>sell Books</h3>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-4 mt-3">
				<a href="old_book.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fas fa-book-open fa-3x"> </i>
							</div>
							<h3>old Book</h3>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-4 mt-3">
				<a href="edit_profile.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fas fa-book-open fa-3x"> </i>
							</div>
							<h3>Edit Profile</h3>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-4 mt-3">
				<a href="user_address.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-success">
								<i class="fas fa-map-marker-alt fa-3x"> </i>
							</div>
							<h3>Your Address</h3>
							<h5>Edit Address</h5>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-4 mt-3">
				<a href="order.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-success">
								<i class="fas fa-box-open fa-3x"> </i>
							</div>
							<h3>My Order</h3>
							<h5>Track Your Order</h5>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-4 mt-3">
				<a href="helpline">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-success">
								<i class="fas fa-map-marker-alt fa-3x"> </i>
							</div>
							<h3>Your Service</h3>
							<h5>Service</h5>
						</div>
					</div>
				</a>
			</div>
		</div>
	</div>
</body>
</html>