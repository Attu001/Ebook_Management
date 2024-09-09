<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%@page import="com.entity.BookDts"%>
<%@page import="java.util.List"%>
<%@page import="com.DOA.BookDAOimpl"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.DB.DBconnect"%>
<html>
<head>
<meta charset="UTF-8">
<title>old books</title>
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
	<%
	User u=(User)session.getAttribute("userobj"); 
	
	%>

	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid">
		<h3 class="text-center">Recent Book</h3>
		<div class="row">
		<%
		try{
		BookDAOimpl dao=new BookDAOimpl(DBconnect.getConn());
		List<BookDts> list=dao.getallOldBook();
		

			for(BookDts b:list){

		%>
	<div class="col-md-3 mt-3">
			<div class="card crd-ho" style="heig ht:400px">
							<img src="book/<%=b.getPhotoname()%>" class="card-img-top small-img" alt="<%=b.getBooktitle() %>">
							<div class="card-body">
								<h5 class="card-title"><%=b.getBooktitle() %></h5>
								<p class="card-text">
									<strong>Genre:</strong> <%=b.getGenre() %><br>
									<strong>Status:</strong> <%=b.getStatus()%>
								</p>
								<div class="d-flex justify-content-between">
									<a href="viewDetails.jsp?id=<%=b.getBookid()%>" class="btn btn-success btn-sm">View Details</a>
									<a href="#" class="btn btn-info btn-sm">
										<strong>Price:</strong> $ <%=b.getPrice() %>
									</a>
								</div>
							</div>
						</div>	
						</div>
	
	<%}
			
			}catch(Exception e){
				e.printStackTrace();
			}
			
			%>
			
			
	</div>
			</div>

</body>
</html>