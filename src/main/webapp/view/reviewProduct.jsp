<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<br />
<br />
<br />
<br />
<br />
<br />
<br />

<form method="POST" action="/reviewProduct">
    <div class="row">
        <div class="col-12">
            <label for="productName">Product Name</label>
            <input id="productName" type="text" name="productName" readonly
                   value="${object.product.name}" class="form-control">
        </div>

        <div class="col-12">
            <label for="orderItemId">Order Item Id</label>
            <input id="orderItemId" type="text" name="orderItemId" readonly
                   value="${object.id}" class="form-control">
        </div>


        <div class="col-12">
            <label for="tableNumber">Table Number</label>
            <input id="tableNumber" type="text" name="tableNumber" readonly
                   value="${tableNumber}" class="form-control">
        </div>


        <div class="col-12">
            <label for="rating">Rating</label>
            <input id="rating" type="number" name="rating" 
                    class="form-control">
        </div>


        <div class="col-12">
            <label for="username">Username</label>
            <input id="username" type="text" name="username"
                    class="form-control">
        </div>

        <div class="col-12">
            <label for="notes">Notes</label>
            <input id="notes" type="text" name="notes" 
                   class="form-control">
        </div>

        <button type="submit">Review now!</button>
    </div>


</form>