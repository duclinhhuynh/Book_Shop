<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.Connection"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="com.DAO.CartDao"%>
<%@ page import="com.DAO.BookOrderImpl"%>
<%@ page import="com.entity.BookDtls"%>
<%@ page import="com.entity.Book_Order"%>
<%@ page import="com.entity.Cart"%>
<%@ page import="com.entity.User"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: orders Books</title>
<%@include file="allCss.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<h3 class="text-center">Admin</h3>
	<table class="table table-striped text-center">
		<thead class="bg-primary text-white">
			<tr>
				<th scope="col">Order Id</th>
				<th scope="col">Name</th>
				<th scope="col">Email</th>
				<th scope="col">Address</th>
				<th scope="col">Phone</th>
				<th scope="col">Book Name</th>
				<th scope="col">Author</th>
				<th scope="col">Price</th>
				<th scope="col">Payment type</th>
			</tr>
		</thead>
		<tbody>
		<%
			BookOrderImpl dao = new BookOrderImpl(DBConnect.getConnection());
			List<Book_Order> blist = dao.getAllOrder();
			for(Book_Order b: blist){
			%>	
			<tr>
				<th scope="row"><%=b.getOrderId() %></th>
				<td><%=b.getUserName()%></td>
				<td><%=b.getEmail()%></td>
				<td><%=b.getFulladd()%></td>
				<td><%=b.getPhone() %></td>
				<td><%=b.getBookName() %></td>
				<td><%=b.getAuthor() %></td>
				<td><%=b.getPrice()%></td>
				<td><%=b.getPayment()%></td>
			</tr>		
			<%	
			}
		%>
			
		</tbody>
	</table>
</body>
</html>