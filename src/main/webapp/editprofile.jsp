<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="all_component/allCss.jsp"%>

<meta charset="UTF-8">
<title>Edit profile</title>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
	               <h4 class="text-center text-black">Edit Profile Page</h4>
					
					<c:if test="${not empty success}"> 
						<h5 class="text-center text-success">${success}</h5>
						<c:remove var="success" scope="session"/>
						</c:if>
						
						
						
						<c:if test="${not empty failed}"> 
						<h5 class="text-center text-danger">${failed}</h5>
						<c:remove var="failed" scope="session"/>
						</c:if>
						
						
						<c:if test="${not empty incorrect}"> 
						<h5 class="text-center text-danger">${incorrect}</h5>
						<c:remove var="failed" scope="session"/>
						</c:if>
					
					
					<form action="updateprofileservlet" method="post">
					
					<input type="hidden" value="${userobj.id}" name="id">
					
                            <div class="form-group">
                                <label for="name">Enter Full name</label>
                                <input type="text" class="form-control" id="name" required name="name" value="${userobj.name}">
                            </div>
                            <div class="form-group">
                                <label for="email">Email address</label>
                                <input type="email" class="form-control" id="email" required name="email" value="${userobj.email}">
                                <small class="form-text text-muted">We'll never share your email with anyone else.</small>
                            </div>
                            <div class="form-group">
                                <label for="phone">Phone Number</label>
                                <input type="number" class="form-control" id="phone" required name="phone" value="${userobj.phon}">
                            </div>
                            
                            <div class="form-group">
                                <label for="password">Password</label>
                                <input type="password" class="form-control" id="password" required name="password">
                            </div>
                            
                            <button type="submit" class="btn btn-primary">Update</button>
                        </form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>