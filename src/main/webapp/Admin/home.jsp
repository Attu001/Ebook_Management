<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="./allCss.jsp"%>

<style >
a{
 text-decoration:none !important;
	color:black
}

a:hover{

 text-decoration:none !important;
	color:black;
}
</style>

<meta charset="UTF-8">
<title>Admin Home</title>
</head>
<body>
	<%@include file="./navbar.jsp"%>
	<c:if test="${empty userobj}">
	<c:redirect url="login.jsp">
	</c:redirect>
	
	</c:if>
	<div class="cotainer">
		<div class="row p-5">
			<div class="col-md-3">
			<a href="add_books.jsp">
				<div class="card">
					<div class="card-body text-center">
						<i class="fa-solid fa-circle-plus fa-3x text-primary"></i>
						<h4>Add Book</h4>
						-------------
					</div>
				</div>
				</a>
			</div>
			
			<div class="col-md-3">
			<a href="all_books.jsp">
				<div class="card">
					<div class="card-body text-center">
						<i class="fa-solid fa-book-open fa-3x text-danger"></i>
						<h4>All Book</h4>
						-------------
					</div>
				</div>
				</a>
			</div>
			
			<div class="col-md-3">
			<a href="orders.jsp">
				<div class="card">
					<div class="card-body text-center">
						<i class="fa-solid fa-box-open fa-3x text-warning"></i>
						<h4>Oder</h4>
						-------------
					</div>
				</div>
				</a>
			</div>
			
			<div class="col-md-3">
			<a  data-toggle="modal" data-target="#exampleModalCenter">
				<div class="card">
					<div class="card-body text-center">
						<i class="fa-solid fa-right-from-bracket fa-3x text-primary"></i>
						<h4>Log out</h4>
						-------------
					</div>
				</div>
				</a>
		</div>
	</div>
	</div>
	
	<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle"></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <div class="text-center">
      <h2> Do You want to logout</h2>
         <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <a href="../Logout" type="button" class="btn btn-primary">Logout</a>
      </div>
       
      </div>
      <div class="modal-footer">
       
      </div>
    </div>
  </div>
</div>
	<%@include file="./Footer.jsp" %>
</body>
</html>