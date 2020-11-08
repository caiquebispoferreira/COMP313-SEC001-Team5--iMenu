<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div class="row">
    <div class="col-sm-4">
        <a href="/listProductByCategory?category=APPETIZER">
            <h3>Appetizers</h3>
            <img src="${contextPath}/resources/img/appetizer.jpg" width="340" height="440"/>
        </a>
    </div>

    <div class="col-sm-4">
        <a href="/listProductByCategory?category=MAIN_COURSE">
            <h3>Main Course</h3>
            <img src="${contextPath}/resources/img/MainCourse.png" width="340" height="440"/>
        </a>
    </div>

    <div class="col-sm-4">
        <a href="/listProductByCategory?category=BEVERAGE">
            <h3>Beverages</h3>
            <img src="${contextPath}/resources/img/beverage.png" width="340" height="440"/>
        </a>
    </div>
</div>
