<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<%@page import="java.util.List"%>
<%@page import="com.entity.User"%>
<%@page import="com.DB.DBconnect"%>
<%@page import="com.DOA.cartdaoimpl"%>
<%@page import="com.entity.cart"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart Page</title>
<%@include file="all_component/allCss.jsp"%>

</head>
<body>
	<%@include file="all_component/navbar.jsp"%>	
	
	<div class="container">
	
	
		<div class="row">
			<div class="col-md-6">
				<div class="card bg-white">
					<div class="card-body">
						<h3 class="text-success text-center">Your selected item</h3>
<c:if test="{not empty failed}">
	<div class="alert  bg-dark">${failed}</div>
	
	</c:if>			
						<table class="table table-striped">
							<thead>
								<tr>
									<th>Book Name</th>
									<th>Author</th>
									<th>Price</th>
									<th>Action</th>
									

								</tr>
							</thead>
							<%
							User u=(User)session.getAttribute("userobj");
							try{
							
							cartdaoimpl dao=new cartdaoimpl(DBconnect.getConn());
							List<cart> cart=dao.getBookByUserid(u.getId());	
							Double totalprice=0.00;
							
							for(cart c : cart)
							{
								totalprice=c.getTotal_price();
							%>
								
								
							<tr>
								<th scope="row"><%=c.getAuthor() %> </th>
								<td><%=c.getBook_name() %></td>
								<td><%=c.getPrice() %></td>
								<td>
								<a href="remove_book?bid=<%=c.getBid()%>&&uid=<%=c.getUid()%>&&cid=<%=c.getCid()%>" class="btn btn-sm btn-danger">Remove</a>
								</td>
								
						
							
<%}
							
							
							
							%>
							
							</tr>
							
							<tr>
							<td>Total Price</td>
							<td></td>
							<td><%=totalprice  %> </td>
							<td></td>
							
							</tr>
						</table>
	<%

							}catch(Exception e){
								e.printStackTrace();
							}
	
	%>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
						<h3 class="text-success text-center">Your Details for order</h3>
						
						<c:if test="${not empty success}">
						<div class="text-center text-success">
						<h4>${success}</h4>
						</div>
						</c:if>
						
						<c:if test="${not empty failed}">
						<div class="text-center text-warning">
						<h4>${failed}</h4>
						</div>
						</c:if>
						
						<c:if test="${not empty select}">
						<div class="text-center text-primary">
						<h4>${select}</h4>
						</div>
						</c:if>
						
						
						<form action="ordersservlet">
							<div class="form-row">
							
							<input type="hidden" value="${userobj.id}" name="id">
							
								<div class="form-group col-md-6">
									<label for="inputEmail4">Name</label> <input type="text"
									name="name"	class="form-control" id="inputEmail4" value="<%=u.getName()%>" readonly>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Email</label> <input type="Email"
									name="email"	class="form-control" id="inputPassword4" value="<%=u.getEmail()%>" readonly>
								</div>
							</div>

							<div class="form-row">
								<div class="form-g	roup col-md-6">
									<label for="inputEmail4">Phone Number</label> <input
										name="phone" type="number" class="form-control" id="inputEmail4" value="<%=u.getPhon() %>" >
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Address</label> <input type="text"
										name="address" class="form-control" id="inputPassword4" name="address"
										>
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Landmark</label> <input type="text"
									name="landmark"	class="form-control" id="inputEmail4">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">City</label> <input type="text"
										name="city" class="form-control" id="inputPassword4">
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">State</label> <input type="text"
										name="state" class="form-control" id="inputEmail4">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">pincode</label> <input type="text"
									 name="pincode"	class="form-control" id="inputPasswosrd4">
								</div>
							</div>

							<div class="form-group">
								<label class="">Payment method</label> 
								<select class="form-control" name="payment">
									<option value="cash on delivary">cash on delivary</option>
								</select>
							</div>
					
						<div class="text-center">
						<button type="submit" class="btn btn-warning">order now</button>
						<a href="index.jsp" class="btn btn-success">continue shopping</a>
						
						</div>

					</form>
					</div>
				</div>
			</div>
		</div>


	</div>


</body>
</html>