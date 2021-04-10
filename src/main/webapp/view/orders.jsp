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
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<link rel="stylesheet" href="${contextPath}/resources/css/style.css" />

<link
	href="https://fonts.googleapis.com/css2?family=Syncopate:wght@700&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;700&display=swap"
	rel="stylesheet">

<div class="row">
	<div class="col-12"></div>
</div>
<br>
<div class="table-responsive">
	<table class="table table-striped">
		<thead class="thead-dark">
			<tr>
				<th scope="col">Order Number</th>
				<th scope="col">Table Number</th>
				<th scope="col">Date</th>
				<th scope="col">Total Price</th>
				<th scope="col">Special Note</th>
				<th scope="col">Order Status</th>
				<th scope="col">Items</th>
				<th scope="col">Action</th>
				<th scope="col">Action</th>
			</tr>
		</thead>
		<c:forEach items="${object}" var="item">

			<tr>
				<td class="table-light" scope="row">${item.id}</td>
				<td class="table-light">${item.tableNumber}</td>
				<td class="table-light">${item.date}</td>
				<td class="table-light">${item.totalPrice}</td>
				<th class="table-light">${item.note}</th>
				<td class="table-light">${item.status}</td>
				<td class="table-light"><c:forEach items="${item.items}"
						var="orderItem">
                                ${orderItem.quantity} -
                                ${orderItem.product.name} -
                                <c:if test="${orderItem.delivered}">
                                    Delivered
                                </c:if>
						<c:if test="${!orderItem.delivered}">
							<a
								href="/changeItemToDelivered?orderId=${item.id}&itemId=${orderItem.id}">
								Delivery now </a>
						</c:if>
						<br>
					</c:forEach></td>
				<td class="table-light"><a href="/editOrder?id=${item.id}">
						<i class="fas fa-edit"></i> Edit
				</a></td>
				<td class="table-light"><a href="/deleteOrder?id=${item.id}"><i
						class="fas fa-trash"></i> Delete</a></td>
			</tr>
		</c:forEach>
	</table>
</div>