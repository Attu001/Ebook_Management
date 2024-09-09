<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="all_component/allCss.jsp"%>

<meta charset="UTF-8">
<title> Sell Book</title>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
					<h5 class="text-primary text-center p-1">Sell old Book</h5>
					
					<c:if test="${not empty success }"> 
	<p class="text-center text-success">${success} </p>
	
	<c:remove var="success" scope="session"/>
	
	</c:if>
	<c:if test="${not empty failed }"> 
	<p class="text-center text-danger">${failed} </p>
	
	<c:remove var="failed" scope="session"/>
	
	</c:if>
					
					<form action="add_old_books" method="post"
							enctype="multipart/form-data">
							
							<c:if test="">
							
							</c:if>
							
							<div class="form-group">
								<label for="bookTitle">Book Title</label> <input type="text"
									 class="form-control" id="bookTitle" name="bookTitle" required>
							</div>
							
							<input type="hidden" value="${userobj.email}" name="user">
							
							<div class="form-group">
								<label for="author">Author Name</label> <input type="text"
									class="form-control" id="author" name="author" required>
							</div>
							<div class="form-group">
								<label for="price">Price</label> <input type="number"
									class="form-control" id="price" name="price" required>
							</div>
							
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
</body>
</html>