<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@ page import="com.entity.User"%>
<div class="container-fuid"
	style="height: 10px; background-color: #303f9f"></div>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        	<div class="text-center">
        		<h4>Do you want to logout</h4>
            	<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        		<a href="logout" type="button" class="btn btn-primary">Logout</a>
        	</div>
      </div>
      <div class="modal-footer">
      </div>
    </div>
  </div>
</div>
<!-- Modal -->
<!-- Button trigger modal -->
<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
</nav>
<div class="container-fuid p-3 ">
	<div class="row">
		<div class="col-md-3">
			<h3><a href="index.jsp">Book</a></h3>
		</div>
		<div class="col-md-6">
			<form class="form-inline my-2 my-lg-0" action="search.jsp" method="post">
				<input class="form-control mr-sm-2" type="search" name="ch"
					placeholder="Search" aria-label="Search">
				<button class="btn btn-primary my-2 my-sm-0" type="submit">Search</button>
			</form>
		</div>
		<c:if test="${not empty userobj}">
			<div class="col-md-3 form-inline my-2 my-lg-0">
				<a href="checkout.jsp"><i class="fa-solid fa-cart-arrow-down fa-2x m-2"></i></a> <a href="login.jsp"
					class="btn btn-success "><i class="fas fa-user-plus">${userobj.name}
				</i></a> <a href="logout" class="btn btn-primary text-white" data-toggle="modal" data-target="#exampleModal"><i
					class="fa-solid fa-right-from-bracket" ></i> Logout</a>
			</div>
		</c:if>
		<c:if test="${empty userobj}">
			<div class="col-md-3">
				<a href="login.jsp" class="btn btn-success">
				<i class="fas fa-sign-in-alt"></i>Login
				</a>
				<a href="register.jsp" class="btn btn-primary text-white" ><i
					class="fas fa-user-plus"></i>Register</a>
			</div>
		</c:if>
	</div>
</div>

<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="index.jsp"><i
					class="fa-solid fa-house"></i> Home <span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="all_recent_book.jsp"><i class="fa-solid fa-bookmark"></i>
					Recent book</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="all_new_book.jsp"><i class="fa-solid fa-book"></i> New
					book</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="all_old_book.jsp"><i class="fa-solid fa-book-tanakh"></i>
					Old book</a></li>
			<li class="nav-item"><a class="nav-link disabled" href="#">Disabled</a>
			</li>
		</ul>
		<form class="form-inline my-2 my-lg-0">
			<a href="setting.jsp" class="btn btn-light my-2 my-sm-0" type="submit">
				<i class="fa-solid fa-gear"></i> Setting
			</a>
			<button class="btn btn-light my-2 my-sm-0 ml-1" type="submit">
				<i class="fa-solid fa-address-book"></i> Contact us
			</button>
		</form>
	</div>
</nav>