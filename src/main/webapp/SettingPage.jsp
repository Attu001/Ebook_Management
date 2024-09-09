<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Setting Here</title>
<%@include file="all_component/allCss.jsp"%>
<style>
a{
text-decoration:none;
color:black;
}
a:hover{
texct-decoration:none;
}
</style>

</head>
<body style="">
	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp"/>
	
	</c:if>	
	


	<%@include file="all_component/navbar.jsp"%>
	
	<div class="conatiner">
	<c:if test="${not empty userobj}">
		<h3 class="text-center">Hello,${userobj.name}</h3>
		</c:if>
		<div class="row p-5">
			<div class="col-md-6 border">
				<a href="sellbook.jsp">
					<div class="card-body text-center">
					<div class="text-primary">
					<i class="fa-solid fa-book-open fa-3x"></i>
					
					</div>
						<h3>sell old book</h3>
					</div>
				</a>
			</div>
			
			
			<div class="col-md-6 border">
				<a href="editprofile.jsp">
					<div class="card-body text-center">
					<div class="text-primary">
											<i class="fa-solid fa-id-card fa-3x"></i>
					
					</div>
						<h3>Login & security</h3>
					</div>
				</a>
			</div>
			
			
			
			<div class="col-md-4 mt-3 border">
				<a href="user_address.jsp">
					<div class="card-body text-center">
					<div class="text-warning">
											<i class="fa-solid fa-location-dot fa-3x"></i>
					
					</div>
						<h3>Address</h3>
					</div>
				</a>
			</div>
			
			<div class="col-md-4 mt-3 border">
				<a href="Track_order.jsp">
					<div class="card-body text-center">
					<div class="text-danger">
											<i class="fa-solid fa-box-open fa-3x"></i>
					
					</div>
						<h3>Track my order</h3>
					</div>
				</a>
			</div>
			
			<div class="col-md-4 mt-3 border">
				<a href="Helpline.jsp">
					<div class="card-body text-center">
					<div class="text-danger">
					
					<i class="fa-solid fa-headset fa-3x"></i>					
					</div>
						<h3>Help</h3>
					</div>
				</a>
			</div>
			
		</div>
	</div>
	<%@include file="all_component/Footer.jsp" %>

</body>
</html>