<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%@include file="all_component/allCss.jsp"%>

<meta charset="UTF-8">
<title>Login</title>
</head>
<body style="background-color:#f0f1f2">
	<%@include file="all_component/navbar.jsp"%>
	<div class="container p-2">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center text-black">Login</h4>
						
						<c:if test="${not empty success}"> 
						<h5 class="text-center text-danger">${success}</h5>
						<c:remove var="success" scope="session"/>
						</c:if>
						
						
						
						<c:if test="${not empty failed}"> 
						<h5 class="text-center text-danger">${failed}</h5>
						<c:remove var="failed" scope="session"/>
						</c:if>
						
						
						
						
						<form action="login" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> 
								
								
					<input name="email"	type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required> <small id="emailHelp"
									class="form-text text-muted">We'll never share your
									email with anyone else.</small>
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> 
					<input name="password"	type="password" class="form-control" id="exampleInputPassword1" required>
							</div>
							
							<div class="text-center">
							<button type="submit" class="btn btn-primary">Login</button><br>
							<a href="register.jsp">create account</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>