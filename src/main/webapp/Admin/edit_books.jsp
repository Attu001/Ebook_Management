<%@page import="com.entity.BookDts"%>
<%@page import="com.DB.DBconnect"%>
<%@page import="com.DOA.BookDAOimpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<%@ include file="./allCss.jsp"%>
<meta charset="UTF-8">
<title>Admin: Edit Book</title>




</head>
<body style="background-color: #f0f2f2">
	<%@ include file="./navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Edit Book</h4>
						
						<c:if test="${not empty success }">
							<p class="text-center text-success">${success}</p>

							<c:remove var="success" scope="session" />

						</c:if>
						<c:if test="${not empty failed }">
							<p class="text-center text-danger">${failed}</p>

							<c:remove var="failed" scope="session" />

						</c:if>


						<%
						int id = Integer.parseInt(request.getParameter("id"));
						BookDAOimpl dao = new BookDAOimpl(DBconnect.getConn());
						BookDts b = dao.getBookbyid(id);
						%>


						<form action="../edit_book" method="post"	>
						<input type="hidden" name="id" value="<%=b.getBookid()%>"> 
							<div class="form-group">
								<label for="bookTitle">Book Title</label> <input type="text"
									class="form-control" id="bookTitle" name="bookTitle" value="<%=b.getBooktitle() %>" required>
							</div>
							<div class="form-group">
								<label for="author">Author</label> <input type="text"
									class="form-control" id="author" name="author" value="<%=b.getAuthor() %>" required>
							</div>
							<div class="form-group">
								<label for="genre">Genre</label> <input type="text"
									class="form-control" id="genre" name="genre" value="<%=b.getGenre() %>" required>
							</div>
							<div class="form-group">
								<label for="price">Price</label> <input type="number"
									class="form-control" id="price" name="price" value=<%=b.getPrice() %> required>
							</div>
							<select class="custom-select" name="status" >
								<%if("Active".equals(b.getStatus())){%>
								
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
									
								<%}	else{%>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
								<%}
								
								
								
									%>
								
								
								
								


							</select>
							
			<button type="submit" class="btn btn-primary btn-block">Update</button>
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
