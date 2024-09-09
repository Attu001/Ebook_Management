<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="com.entity.BookDts"%>
<%@page import="java.util.List"%>
<%@page import="com.DOA.BookDAOimpl"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.DB.DBconnect"%>
<html>
<head>
<meta charset="UTF-8">
<title>Details Page</title>
<%@include file="all_component/allCss.jsp"%>

<style>
.back-img {
	background: url("img/b.jpg");
	height: 50vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}

.crd-ho:hover {
	background-color: #e8eaf6;
}

.small-img {
    width: 100px;
    height: auto;
    display: block;
    margin-left: auto;
    margin-right: auto;
}
</style>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid">

		<div class="row mt-5">
			<%
			int id=Integer.parseInt(request.getParameter("id"));
			BookDAOimpl dao=new BookDAOimpl(DBconnect.getConn());
			BookDts b=dao.getBookbyid(id);		
			
		%>

			<div class="col-md-6">
				<div class="card crd-ho text-center" style="height: 300px">
					<img src="book/<%=b.getPhotoname()%>" class="card-img-top small-img" alt="<%=b.getPhotoname()%>">
					<div class="card-body">
						<h5 class="card-title">Title:-<%=b.getBooktitle()%></h5>
						<p class="card-text">
						<strong>Author:<span class="text-success"> <%=b.getAuthor()%> </span></strong><br> 
							<strong>Genre:<span class="text-success">   <%=b.getGenre()%></span> </strong> <br> 
							<strong>Status:<span class="text-success">  <%=b.getStatus() %> </span></strong><br>
							
						</p>
						
					</div>
				</div>
			</div>


			<div class="col-md-6 border bg-light">
			
			<%
			
			if("old".equals(b.getGenre()))
			{
			
			%>
			<div class="text-center"> 
				<h4><%=b.getBooktitle() %></h4>
					<h5 class="text-primary">contact to book seller</h5>
				
				<h5 class="text-primary"><%=b.getEmail() %>@gmail.com </h5>
				
				
			</div>
			<%} %>
			
				<div class="row mt-5 ">
				
					<div class="col-md-4 text-center">
						<i class="fas fa-cash fa-4x p-2"></i>
						<h3>Cash on Delivery</h3>
					</div>
					
					<div class="col-md-4 text-center">
						<i class="fas fa-undo-alt fa-4x p-2"></i>
						<h3>Return available</h3>						
					</div>
					
					<div class="col-md-4 text-center">
						<i class="fas fa-truck fa-4x p-2"></i>
						<h3>free shipping</h3>
						
					</div>
					
					

				</div>
				
				
				<div class="text-center mt-3">
				<%
					if("old".equals(b.getGenre())){
				%>
			<a href="index.jsp" class="btn btn-success btn-sm">continue Shopping<i class="fas fa-cart fa-4x p-2"></i></a>
				<%
					}else{
				%>
				
					<a href="#" class="btn btn-success btn-sm">Add to cart<i class="fas fa-cart fa-4x p-2"></i></a>
					<%
					} 
					%>
					
						<a	href="#" class="btn btn-info btn-sm"> <strong>Price:	$  <%=b.getPrice()%></strong>
							
							</a>
					</div>


			</div>

		</div>
	</div>

</body>

</html>