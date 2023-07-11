<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<%@page import="java.sql.Connection"%>
<%@ page import="com.DAO.BookDaoImpl"%>
<!-- Replace "your.package.name" with the actual package name for BookDaoImpl -->
<%@ page import="com.DB.DBConnect"%>
<!-- Replace "your.package.name" with the actual package name for DBConnect -->
<%@ page import="com.entity.BookDtls"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: Edit Books</title>
<%@include file="allCss.jsp"%>
</head>
<body style="background-color: #f0f2f2;">
	<%@include file="navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Edit Books</h4>

						<%
						int id = Integer.parseInt(request.getParameter("id"));
						BookDaoImpl dao = new BookDaoImpl(DBConnect.getConnection());
						BookDtls b = dao.getBookById(id);
						%>

						<form action="../edit_books" method="post"
							enctype="multipart/form-data">
							<input type="hidden" name="id" value="<%=b.getBookId()%>">

							<div class="form-group">
								<label for="exampleInputEmail1">Book Name</label> <input
									name="bname" type="text" class="form-control"
									id="exampleInputEmail1" aria-descibebdy="emailHelp"
									value="<%=b.getBookName()%>">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Author Name</label> <input
									name="author" type="text" class="form-control"
									id="exampleInputEmail1" aria-descibebdy="emailHelp"
									value="<%=b.getAuthor()%>">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Price</label> <input
									name="price" type="text" class="form-control"
									id="exampleInputEmail1" id="exampleInputPassword1"
									value="<%=b.getPrice()%>">
							</div>
							  <div class="form-group">
                                <label for="inputState">Book Categories</label>
                                <select name="categories" class="form-control">
                                    <option value="novel" <%= "novel".equals(b.getBookCategory()) ? "selected" : "" %>>novel</option>
                                    <option value="philosophy" <%= "philosophy".equals(b.getBookCategory()) ? "selected" : "" %>>philosophy</option>
                                    <option value="skill" <%= "skill".equals(b.getBookCategory()) ? "selected" : "" %>>skill</option>
                                    <option value="mentality" <%= "mentality".equals(b.getBookCategory()) ? "selected" : "" %>>mentality</option>
                                </select>
                            </div>
							 <div class="form-group">
                                <label for="inputState">Book Status</label>
                                <select name="status" class="form-control">
                                    <option value="Inactive" <%= "Inactive".equals(b.getStatus()) ? "selected" : "" %>>Inactive</option>
                                    <option value="Active" <%= "Active".equals(b.getStatus()) ? "selected" : "" %>>Active</option>
                                    <option value="Deal" <%= "Deal".equals(b.getStatus()) ? "selected" : "" %>>Deal</option>
                                    <option value="New" <%= "New".equals(b.getStatus()) ? "selected" : "" %>>New</option>
                                </select>
                            </div>

							<div class="form-group">
								<label for="exampleFormControlFile1">Upload Photo</label> <input
									value="<%=b.getPhotoName()%>"
									name="bimg" type="file" class="form-control-file"
									id="exampleFormControlFile1">
							</div>

							<button type="submit" class="btn btn-primary">upLoad</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="footer.jsp"%>
</body>
</html>