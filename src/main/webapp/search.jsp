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
<title>Books</title>
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

/* toast */
#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
}

@keyframes fadeIn {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@keyframes fadeOut {form { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}
</style>
</head>
<body>
	<%
	User u=(User)session.getAttribute("userobj"); 
	
	%>
		<c:if test="${not empty addcart }">
		
		<div id="toast">${addcart}</div>

<script type="text/javascript">
		showToast();
		function showToast(content)
		{
		    $('#toast').addClass("display");
		    $('#toast').html(content);
		    setTimeout(()=>{
		        $("#toast").removeClass("display");
		    },2000)
		}	
</script>
		<c:remove var="addtocart" scope="session" />
		</c:if>
	
	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid">
		<h3 class="text-center"> Books you want</h3>
		<div class="row">
		<%
		try{
			String search=request.getParameter("search");
		BookDAOimpl dao=new BookDAOimpl(DBconnect.getConn());
		List<BookDts> list=dao.searchbooks(search);
		

			for(BookDts b:list){

		%>
	<div class="col-md-3 mt-3">
			<div class="card crd-ho" style="height:400px">
							<img src="book/<%=b.getPhotoname()%>" class="card-img-top small-img" alt="<%=b.getBooktitle() %>">
							<div class="card-body">
								<h5 class="card-title"><%=b.getBooktitle() %></h5>
								<p class="card-text">
									<strong>Genre:</strong> <%=b.getGenre() %><br>
									<strong>Status:</strong> <%=b.getStatus()%>
								</p>
								<div class="d-flex justify-content-between">
									<a href="cartservlet?bid=<%=b.getBookid() %>&&uid=<%=u.getId() %>" class="btn btn-danger btn-sm"><i class="fa-solid fa-cart-shopping"></i>Add Cart</a>
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