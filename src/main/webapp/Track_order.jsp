<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.entity.User"%>
<%@page import="com.entity.book_order"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBconnect"%>
<%@page import="com.DOA.bookorderdao"%>
<%@page import="com.DOA.bookorderdaoimpl"%>
<html>
<head>
<%@include file="all_component/allCss.jsp"%>

<meta charset="UTF-8">
<title>Order Details</title>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
	<div class="container">
	<h3 class="text-center text-primary">Your Order</h3>
		<table class="table table-striped mt-5">
			<thead>
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
			<%
			User u=(User)session.getAttribute("userobj");

		
			
			System.out.println(u);				
			bookorderdaoimpl dao=new bookorderdaoimpl(DBconnect.getConn());
			List<book_order> list=dao.getbook(u.getEmail());
			System.out.println(u.getEmail());
			for(book_order b:list)
			{
				%>
				<tr>
				<th scope="row"><%=b.getOrder_id() %></th>
				<td><%=b.getuserName() %> </td>
				<td><%=b.getEmail() %></td>
				<td><%=b.getFulladd() %></td>
				<td><%=b.getPhon() %></td>
				<td><%=b.getBook_name() %></td>
				<td><%=b.getAuthor() %></td>
				<td><%=b.getPrice() %></td>
				<td><%=b.getPayment() %></td>


			</tr>
				<%
				
			}
		
		%>
			
			
			
			</tbody>
		</table>
	</div>
</body>
</html>