<!-- 
Purpose: 
Author: Ashik Lochna, Nazif Sahim, Wahida Hossain, Caique Ferreira, Irisi Meko
Date: April 09, 2021
Version: iMenu v6.0
Parameters: 
-->

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<link rel="stylesheet" href="${contextPath}/resources/css/style.css" />
<link
	href="https://fonts.googleapis.com/css2?family=Syncopate:wght@700&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;700&display=swap"
	rel="stylesheet">

<style>
.row1 {
	flex: 0 0 33.333333%;
	max-width: 80%;
	margin-left: 22%;
}

.btnnew {
	background: linear-gradient(to right, #ff8a00 0%, #da1b60 100%);
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
	text-decoration: none;
	text-transform: uppercase;
	letter-spacing: 3px;
	font-weight: bold;
	font-size: 13px;
	text-align: center;
	border-color: #ff8a0059;
}
</style>

<br />
<br />
<br />
<br />
<br />
<br />
<br />

<form method="POST" action="/reviewProduct">
	<div class="center">
		<div class="row">
			<div class="col-12">
				<label for="productName">Product Name</label> <input
					id="productName" type="text" name="productName" readonly
					value="${object.product.name}" class="form-control">
			</div>

			<div class="col-12">
				<label for="orderItemId">Order Item Id</label> <input
					id="orderItemId" type="text" name="orderItemId" readonly
					value="${object.id}" class="form-control">
			</div>


			<div class="col-12">
				<label for="tableNumber">Table Number</label> <input
					id="tableNumber" type="text" name="tableNumber" readonly
					value="${tableNumber}" class="form-control">
			</div>


			<div class="col-12">
				<label for="rating">Rating</label> <input id="rating" type="number"
					name="rating" min="1" max="5" class="form-control">
			</div>


			<div class="col-12">
				<label for="username">Username</label> <input id="username"
					type="text" name="username" class="form-control">
			</div>

			<div class="col-12">
				<label for="notes">Notes</label> <input id="notes" type="text"
					name="notes" class="form-control">
			</div>
		</div>
	</div>
	<div class="row1">
		<button type="submit" class="btn btn-light btnnew">Review
			now!</button>
	</div>
</form>
