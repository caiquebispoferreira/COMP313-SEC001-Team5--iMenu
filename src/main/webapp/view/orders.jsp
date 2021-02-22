<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<link rel="stylesheet" href="${contextPath}/resources/css/users.css" />
<link
	href="https://fonts.googleapis.com/css2?family=Syncopate:wght@700&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;700&display=swap"
	rel="stylesheet">
	
<div class="formbox">
	<h2>Orders</h2>
	<div class="row">
		<div class="col-12">
		</div>
	</div>
	<table class="container">
		<thead>
			<tr>
				<th><h1>Order Number</h1></th>
                    <th><h1>Table Number</h1></th>
                    <th><h1>Date</h1></th>
                    <th><h1>Total Price</h1></th>
                    <th><h1>Special Note</h1></th>
                    <th><h1>Order Status</h1></th>
                    <th><h1>Items</h1></th>
                    <th><h1>Action</h1></th>
                    <th><h1>Action</h1></th>
			</tr>
		</thead>
		<tbody>
			                <c:forEach items="${object}" var="item">
                    <tr>
                        <td>${item.id}</td>
                        <td>${item.tableNumber}</td>
                        <td>${item.date}</td>
                        <td>${item.totalPrice}</td>
                        <td>${item.note}</td>
                        <td>${item.status}</td>
                        <td>
                            <c:forEach items="${item.items}" var="orderItem">
                                ${orderItem.quantity} -
                                ${orderItem.product.name} -
                                <c:if test="${orderItem.delivered}">
                                    Delivered
                                </c:if>
                                <c:if test="${!orderItem.delivered}">
                                    <a href="/changeItemToDelivered?orderId=${item.id}&itemId=${orderItem.id}">
                                        Delivery now
                                    </a>
                                </c:if>
                                <br>
                            </c:forEach>
                        </td>
                        <td><a href="/editOrder?id=${item.id}"> <i class="fas fa-edit"></i> Edit</a></td>
                        <td><a href="/deleteOrder?id=${item.id}"><i class="fas fa-trash"></i> Delete</a></td>
                    </tr>
                </c:forEach>
		</tbody>
	</table>
</div>

