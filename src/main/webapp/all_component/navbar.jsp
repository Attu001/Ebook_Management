<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container-fluid" style="height:10px; width:100%; background-color:#303f9f">
</div>

<div class="container-fluid p-3">

	<div class="row">
		<div class="col-md-3 text-success"><h3><i class="fas fa-book p-1"></i>   Ebook</h3></div>
		<div class="col-md-6">
			<form class="form-inline my-2 my-lg-0" method="post" action="search.jsp">
		<input class="form-control mr-sm-2" type="search" name="search" placeholder="Search" aria-label="Search">
				<button href="" class="btn btn-primary my-2 my-sm-0" type="submit">Search</button>
			</form>
		</div>
		
		<c:if test="${not empty userobj}">
		<div class="col-md-3">
		
					<a href="chekoutpage.jsp" class="btn btn-primary mb-2"><i class="fa-solid fa-cart-shopping"></i></a>
		
		
			<a href="login.jsp" class="btn btn-primary mb-2"><i class="fa-regular fa-user"></i><span> </span>${userobj.name} </a>
			
			
			 <a href="Logout"	class="btn btn-success text-white"><i class="fa-solid fa-user-plus p-1"></i>Logout</a>


		</div>
		
		
		</c:if>
		
				<c:if test="${empty userobj}">
				
				<div class="col-md-3">
			<a href="login.jsp" class="btn btn-primary"><i class="fa-solid fa-right-to-bracket p-1"></i>login </a>
			 <a href="register.jsp"	class="btn btn-success text-white"><i class="fa-solid fa-user-plus p-1"></i>Register</a>


		</div>
				</c:if>
		
		

	</div>


</div>

<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
 <a class="navbar-brand" href="#">   <i class="fas fa-home"></i></a>
	 
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="index.jsp">Home
					<span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item active"><a class="nav-link" href="./allrecentbook.jsp"><i class="fas fa-book p-1"></i>Recent Book</a></li>
			

			<li class="nav-item active"><a class="nav-link " href="./alloldbooks.jsp"><i class="fas fa-book p-1"></i>old	Book</a></li>
		</ul>
		<form class="form-inline my-2 my-lg-0">
			<a href="SettingPage.jsp" class="btn btn-light my-2 my-sm-0" type="submit"><i class="fa-solid fa-gear"></i>    Setting </a>

			<button class="btn btn-light my-2 my-sm-0 ml-1" type="submit"><i class="fa-regular fa-address-book"></i>  Contact-Us</button>
		</form>
	</div>
</nav>