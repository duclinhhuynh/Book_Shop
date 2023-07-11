<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<%@include file="all_component/allCss.jsp"%>
<body>
	<%@include file="all_component/navbar.jsp"%>
	<div class="row">
		<div class="col-md-4 offset-md-4">
			<div class="card">
				<div class="card-body">
					<form action="">
						<div class="form-row">
		
							<div class="form-group col-md-6">
								<label for="inputEmail4">Address</label> <input type="email"
									class="form-control" id="inputEmail" placeholder="Address"
										>
							</div>
							<div class="form-group col-md-6">
								<label for="">LandMark</label> <input type="Text"
									class="form-control" id="inputName4" placeholder="LandMark"
										>
							</div>
						</div>
						<div class="form-row">
							
							<div class="form-group col-md-4">
								<label for="inputEmail4">City</label> <input type="email"
									class="form-control" id="inputEmail" placeholder="City"
										>
							</div>
							<div class="form-group col-md-4">
								<label for="inputEmail4">State</label> <input type="text"
									class="form-control" id="inputEmail" placeholder="State"
										>
							</div>
							<div class="form-group col-md-4">
								<label for="inputEmail4">Pin</label> <input type="email"
									class="form-control" id="inputEmail" placeholder="Pin"
										>
							</div>
						</div>
						<div class="text-center">
							<button class="btn btn-warning text-white">Add Address</button>
						</div>
					</form>			
				</div>
			</div>
		</div>
	</div>
</body>
</html>