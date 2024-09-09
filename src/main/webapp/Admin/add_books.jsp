<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<%@ include file="./allCss.jsp"%>
<meta charset="UTF-8">
<title>Admin: Add Books</title>
	



</head>
<body style="background-color: #f0f2f2">
	<%@ include file="./navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Add New Book</h4>
						<c:if test="${not empty success }"> 
	<p class="text-center text-success">${success} </p>
	
	<c:remove var="success" scope="session"/>
	
	</c:if>
	<c:if test="${not empty failed }"> 
	<p class="text-center text-danger">${failed} </p>
	
	<c:remove var="failed" scope="session"/>
	
	</c:if>
						<form action="../add_books" method="post"
							enctype="multipart/form-data">
							<div class="form-group">
								<label for="bookTitle">Book Title</label> <input type="text"
									class="form-control" id="bookTitle" name="bookTitle" required>
							</div>
							<div class="form-group">
								<label for="author">Author</label> <input type="text"
									class="form-control" id="author" name="author" required>
							</div>
							<div class="form-group">
								<label for="genre">Old or New</label> <input type="text"
									class="form-control" id="genre" name="genre" required>
							</div>
							<div class="form-group">
								<label for="price">Price</label> <input type="number"
									class="form-control" id="price" name="price" required>
							</div>
							<select class="custom-select" name="status">
								<option selected>Active</option>
								<option value="Active">Active</option>
								<option value="Inactive">Inactive</option>


							</select>
							<div class="form-group">
								<label for="bookImage">Book Image</label> <input type="file"
									class="form-control-file" id="bookImage" name="bookImage"
									required>
							</div>
							<button type="submit" class="btn btn-primary btn-block">Add
								Book</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="margin: 130px">
		<%@include file="./Footer.jsp"%>
	</div>
</body>
</html>
