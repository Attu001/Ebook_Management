<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
<%@ include file="all_component/allCss.jsp" %>
</head>
<body style="background-color:#f0f1f2">
    <%@ include file="all_component/navbar.jsp" %>

    <div class="container p-2">
        <div class="row">
            <div class="col-md-4 offset-md-4">
                <div class="card">
                    <div class="card-body">
                        <h4 class="text-center text-black">Registration Page</h4>
                        
                        <c:if test="${not empty success}">
                            <p class="text-center text-success">${success}</p>
                            <c:remove var="success" scope="session"/>
                        </c:if>
                        <c:if test="${not empty failed}">
                            <p class="text-center text-danger">${failed}</p>
                             <c:remove var="failed" scope="session" />
                        </c:if>
                        <c:if test="${not empty error}">
                            <p class="text-center text-danger">${error}</p>
                             <c:remove var="error" scope="session" />
                        </c:if>
                        
                        <form action="register" method="post">
                            <div class="form-group">
                                <label for="name">Enter Full name</label>
                                <input type="text" class="form-control" id="name" required name="name">
                            </div>
                            <div class="form-group">
                                <label for="email">Email address</label>
                                <input type="email" class="form-control" id="email" required name="email">
                                <small class="form-text text-muted">We'll never share your email with anyone else.</small>
                            </div>
                            <div class="form-group">
                                <label for="phone">Phone Number</label>
                                <input type="number" class="form-control" id="phone" required name="phone">
                            </div>
                            <div class="form-group">
                                <label for="password">Password</label>
                                <input type="password" class="form-control" id="password" required name="password">
                            </div>
                            <div class="form-group form-check">
                                <input type="checkbox" class="form-check-input" id="terms" required name="check">
                                <label class="form-check-label" for="terms">Agree terms & Condition</label>
                            </div>
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%@ include file="all_component/Footer.jsp" %>
</body>
</html>
