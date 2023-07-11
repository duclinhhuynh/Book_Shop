<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.DAO.CartDaoImpl"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.DB.DBConnect" %> 
<%@ page import="com.DAO.CartDao" %> 
<%@ page import="com.entity.BookDtls" %> 
<%@ page import="com.entity.Cart" %> 
<%@ page import="com.entity.User" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cart Page</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_component/navbar.jsp"%>
	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp"> </c:redirect>
	</c:if>
	
	<c:if test="${not empty succMsg}">
		<div class="alert alert-success" role="alert">${succMsg}
		</div>
		<c:remove var="succMsg" scope="session"></c:remove>
	</c:if>
	
	<c:if test="${not empty failedMsg}">
		<div class="alert alert-danger text-center" role="alert">${failedMsg }
		</div>
		<c:remove var="failedMsg" scope="session"></c:remove>
	</c:if>
	<div class="container">
		<div class="row p-2">
			<div class="col-md-6">
				<div class="card bg-while">
					<h3 class="text-center text-success">Your Selected Item</h3>
					<div class="card-body">
						<table class="table">
							<thead>
								<tr>
									<th scope="col">BookName</th>
									<th scope="col">Author</th>
									<th scope="col">Price</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
					
								<%
								User u =(User) session.getAttribute("userobj");
								
								CartDaoImpl dao = new CartDaoImpl(DBConnect.getConnection());
								List<Cart> cart = dao.getBookByUser(u.getId());
								Double totalPrice = 0.0;
								for(Cart c : cart){
									totalPrice = c.getTotalPrice();
								%>
								
								<tr>
									<th scope="row"><%=c.getBookName()%></th>
									<td><%=c.getAuthor() %></td>
									<td><%=c.getPrice() %></td>
									<td><a href="remove_book?bid=<%=c.getBid()%>&&uid=<%=c.getUserid()%>&&cid=<%=c.getCid()%>" class = "btn btn-sm btn-danger">Remove</a></td>
								</tr>
								<%
								}
								%>	
								
								<tr>
									<td>Total Price</td>
									<td></td>
									<td><%=totalPrice%></td>
									<td></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="card bg-while">
					<div class="card-body">
						<form action="order" method="post">
						<input type="hidden" value = "${userobj.id}" name = "id">
						
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="">Name</label> <input type="Text" name ="name"
										class="form-control" id="inputName4" placeholder="Name" value="${userobj.name}"
										readonly="readonly">
								</div>
								<div class="form-group col-md-6">
									<label for="inputEmail4">Email</label> <input type="email" name="email"
										class="form-control" id="inputEmail" placeholder="Email" value="${userobj.email}"
										readonly="readonly">
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="">Phone</label> <input type="number" name="phone"
										class="form-control" id="inputName4" placeholder="Phone" value="${userobj.phone}" required
										>
								</div>
								<div class="form-group col-md-6">
									<label for="inputEmail4">Address</label> <input type="text" name ="address" required
										class="form-control" id="inputEmail" placeholder="Address" value="${userobj.address}"
										>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="">LandMark</label> <input type="text" name="landmark" required
										class="form-control" id="inputName4" placeholder="LandMark" value="${userobj.landmark}"
										>
								</div>
								<div class="form-group col-md-6">
									<label for="inputEmail4">City</label> <input type="text" required
										class="form-control" id="inputEmail" placeholder="City" name ="city"
										>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="">State</label> <input type = "text" required
										class="form-control" id="inputName4" placeholder="State" name = "state"
										>
								</div>
								<div class="form-group col-md-6">
									<label for="inputEmail4">Pin code</label> <input type="text" required
										class="form-control" id="inputEmail" placeholder="Pin code" name="pincode">
								</div>
							</div>
							<div class="form-group">
								<label>Payment Mode</label> <select id="paymentType" name ="paymentType"
									class="form-control">
									<option value="noselect" >Choose...</option>
									<option value="CarhOD">Cash On Delivery</option>
									<option value ="CardOD">Card On Delivery</option>
								</select>
							</div>
							<div>
								<button class="btn btn-warning">Order Now</button>
								<a href="order_success.jsp" class="btn btn-success">Continue
									Shopping</a>

							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		</div>
</body>
</html>