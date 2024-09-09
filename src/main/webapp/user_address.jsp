<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="all_component/allCss.jsp"%>

<meta charset="UTF-8">
<title>Add address</title>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
	<div class="container">
		<div class="row p-3">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body">
					<h5 class="text-primary text-center p-1">Add Address</h5>
					<form action="updateaddressservlet" method="post"	enctype="multipart/form-data">
							<div class="form-row">
							
							<input type="text" value="${userobj.id}" name="id">
							
								<div class="form-group col-md-6">
									<label for="inputEmail4">Address</label> <input
									name="address"	type="text" class="form-control" id="inputEmail4" value="" >
								</div>
								<div class="form-group col-md-6">
								
									<label for="inputPassword4">Landmark</label> 	
					<input type="text"	class="form-control" id="inputPassword4" name="landmark">
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-4">
									<label for="inputEmail4">City</label> <input type="text"
									name="city"	class="form-control" id="inputEmail4">
								</div>
								<div class="form-group col-md-4">
									<label for="inputPassword4">State</label> <input type="text"
									name="state"	class="form-control" id="inputPassword4">
								</div>
								<div class="form-group col-md-4">
									<label for="inputPassword4">Zip-code</label> <input type="text"
									name="zip-code"	class="form-control" id="inputPassword4">
								</div>
								
							</div>
							<div class="text-center">
							<button type="submit" class="btn btn-warning">Add Address</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>


	</div>
</body>
</html>