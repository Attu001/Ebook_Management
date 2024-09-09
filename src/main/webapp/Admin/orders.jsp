<%@page import="com.entity.User"%>
<%@page import="com.entity.book_order"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBconnect"%>
<%@page import="com.DOA.bookorderdao"%>
<%@page import="com.DOA.bookorderdaoimpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="./allCss.jsp"%>

<meta charset="UTF-8">
<title>Admin:all books</title>
</head>
<body>
	<%@ include file="./navbar.jsp"%>
	<h3 class="text-center">hello admin</h3>
	<table class="table table-striped ">
		<thead class="bg-primary">
			<tr>
				<th scope="col">Order Id</th>				
				<th scope="col">Name</th>
				<th scope="col">Email</th>
				<th scope="col">Address</th>
				<th scope="col">phone Number</th>
								<th scope="col">Book Name</th>
				
				<th scope="col">Aurthor</th>
				<th scope="col">price</th>
				<th scope="col">payment</th>
			</tr>
		</thead>
		<tbody>
		
				<tr>
				<th scope="row"></th>
				<td>  </td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>


			</tr>
				
			
			
			
		</tbody>
	</table>
	<div style="margin-bottom: 0px">
		<%@include file="./Footer.jsp"%>
	</div>

</body>
</html>