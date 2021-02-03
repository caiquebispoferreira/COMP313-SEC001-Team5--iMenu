<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;700&display=swap" rel="stylesheet">

<style>
h1{
    font-family: 'Poppins', sans-serif;
    padding: 50px;
    text-align: center;
	text-transform: uppercase;
	letter-spacing: 5px;
}

h6{
    font-family: 'Poppins', sans-serif;
	text-transform: uppercase;
	letter-spacing: 5px;
	text-align: center;
}
</style>


<h1>Categories</h1>

<div class="row">
    <div class="col-sm-4">
        <h6>Appetizers</h6>
        <a href="/listProductByCategory?category=APPETIZER">            
            <img src="${contextPath}/resources/img/appetizer.jpg" width="315" height="315"/>
        </a>
    </div>

    <div class="col-sm-4">
                <h6>Main Course</h6>
        <a href="/listProductByCategory?category=MAIN_COURSE">
            <img src="${contextPath}/resources/img/MainCourse.jpg" width="315" height="315"/>
        </a>
    </div>

    <div class="col-sm-4">
                <h6>Beverages</h6>
        <a href="/listProductByCategory?category=BEVERAGE">
            <img src="${contextPath}/resources/img/beverage.jpg" width="315" height="315"/>
        </a>
    </div>
</div>

