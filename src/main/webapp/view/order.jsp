<!-- 
Purpose: 
Author: Ashik Lochna, Nazif Sahim, Wahida Hossain, Caique Ferreira, Irisi Meko
Date: April 09, 2021
Version: iMenu v6.0
Parameters: 
-->

<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div class="center">
	<div class="col-md-12 order-md-2">
		<form action="${action}" method="post">
			<div class="mb-3">
				<label for="id">Id</label> <input id="id" type="number" name="id"
					value="${object.id}" class="form-control" readonly>
			</div>
			<div class="mb-3">
				<label name="status">Status</label> <select name="status"
					class="custom-select d-block w-100"required ${readonly ? 'disabled' : ''}>
					<option value="CONFIRMED"
						${object.status == 'CONFIRMED' ? 'selected' : ''}>Confirmed</option>
					<option value="IN_PROGRESS"
						${object.status == 'IN_PROGRESS' ? 'selected' : ''}>In
						Progress</option>
					<option value="DELIVERED"
						${object.status == 'DELIVERED' ? 'selected' : ''}>Delivered</option>
					<option value="PAID" ${object.status == 'PAID' ? 'selected' : ''}>Paid</option>
				</select>
			</div>
			<div class="mb-3">
				<label for="date">Date</label> <input id="date" type="date"
					name="date" value="${object.date}" readonly class="form-control">

			</div>
			<div class="mb-3">
				<label name="totalPrice">Total Price</label> <input id="totalPrice"
					type="number" name="totalPrice" value="${object.totalPrice}"
					class="form-control" readonly>

			</div>
			<div class="mb-3">
				<label name="note">Note</label>
				<c:if test="${readonly}">
					<input id="note" type="text" name="note" value="${object.note}"
						class="form-control" readonly>
				</c:if>
				<c:if test="${!readonly}">
					<input id="note" type="text" name="note" value="${object.note}"
						class="form-control">
				</c:if>
			</div>
			<div class="mb-3">
				<label for="tableNumber">Table Number</label> <input
					id="tableNumber" type="number" name="tableNumber" readonly
					value="${object.tableNumber}" class="form-control">

			</div>
			<table class="table">
				<thead>
					<tr>
						<th scope="col">Item Id</th>
						<th scope="col">Product</th>
						<th scope="col">Quantity</th>
						<th scope="col">Unit Price</th>
						<th scope="col">Total Price</th>
						<th scope="col">#</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${object.items}" var="item">
						<tr>
							<th scope="row">${item.id}</th>
							<td>${item.product.name}</td>
							<td>${item.quantity}</td>
							<td>${item.unitPrice}</td>
							<td>${item.totalPrice}</td>
							<td><a
								href="/deleteItemFromMyOrder?tableNumber=${object.tableNumber}&orderId=${object.id}&itemId=${item.id}">Delete</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<hr class="mb-4">
			<button class="btn btn-light addUserBtn" type="submit">Submit</button>
		</form>
	</div>
</div>
