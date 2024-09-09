<%@page import="com.entity.BookDts"%>
<%@page import="java.util.List"%>
<%@page import="com.DOA.BookDAOimpl"%>
<%@page import="com.DB.DBconnect"%>
<%@page import="com.DOA.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="./allCss.jsp"%>

<meta charset="UTF-8">
<title>Admin:all books</title>
<style>
  .message-container {
    margin: 20px;
    padding: 15px;
    border-radius: 5px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  }
  .text-success {
    color: #28a745;
    background-color: #d4edda;
    border-color: #c3e6cb;
  }
  .text-danger {
    color: #dc3545;
    background-color: #f8d7da;
    border-color: #f5c6cb;
  }
  .text-center {
    text-align: center;
  }
  .message {
    font-size: 16px;
    font-weight: bold;
  }
</style>
</head>
<body>
	<%@ include file="./navbar.jsp"%>
	<c:if test="${empty userobj}">
	<c:redirect url="login.jsp">
	</c:redirect>
	
	</c:if>
	<h3 class="text-center">hello admin</h3>
	
	<c:if test="${not empty success }">
  <div class="message-container text-success">
    <p class="message text-center">${success}</p>
  </div>
  <c:remove var="success" scope="session" />
</c:if>

<c:if test="${not empty failed }">
  <div class="message-container text-danger">
    <p class="message text-center">${failed}</p>
  </div>
  <c:remove var="failed" scope="session" />
</c:if>
	
	
	
	<table class="table table-striped ">
		<thead class="bg-primary">
			<tr>
				<th scope="col">Id</th>

				<th scope="col">Image</th>
				<th scope="col">Book Title</th>
				<th scope="col">Author</th>
				<th scope="col">Genre</th>
				<th scope="col">price</th>
				<th scope="col">status</th>				
				<th scope="col">Action</th>




			</tr>
		</thead>
		<tbody>
			<%
			BookDAO dao = new BookDAOimpl(DBconnect.getConn());
			List<BookDts> list = dao.getallbook();
			for (BookDts b : list) {
			%>

			<tr>
				<th><%=b.getBookid()%></th>
				<td><img alt="" src="../book/<%=b.getPhotoname()%>"
					style="width: 50px; height: 50px"></td>
				<td><%=b.getBooktitle()%></td>

				<td><%=b.getAuthor()%></td>
				<td><%=b.getGenre()%></td>
				<td>$<%=b.getPrice()%></td>
				<td><%=b.getStatus()%></td>
				<td><a href="edit_books.jsp?id=<%=b.getBookid()%>" class="btn btn-primary btn-sm"><i class="fa-regular fa-pen-to-square"></i>Edit</a>
				 <a	href="../delete?id=<%=b.getBookid()%>" class="btn btn-danger btn-sm"><i class="fa-solid fa-trash"></i>Delete</a></td>

			</tr>

			<%	
			}
			%>

		</tbody>
	</table>
	<div style="margin: 130px">
		<%@include file="./Footer.jsp"%>
	</div>

</body>
</html>