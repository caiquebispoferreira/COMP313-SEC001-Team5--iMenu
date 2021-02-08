<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />


<c:if test="${object.id > 0 && object.status == 'OPEN' }">
    <a href="/changeStatusToConfirmed?tableNumber=${object.tableNumber}&orderId=${object.id}" >Confirm</a>
</c:if>
<a class="btn btn-light" href="/">Add more products</a>
<div class="mb-3">
    <label for="id">Id</label>
    <input id="id" type="number" name="id"  value="${object.id}"
           class="form-control" readonly>
</div>
<div class="mb-3">
    <label name="status">Status</label>
    <select name="status" class="custom-select d-block w-100"  disabled>
        <option value="">Select an option</option>
        <option value="OPEN" ${object.status == 'OPEN' ? 'selected' : ''}>Open</option>
        <option value="CONFIRMED" ${object.status == 'CONFIRMED' ? 'selected' : ''}>Confirmed</option>
        <option value="IN_PROGRESS" ${object.status == 'IN_PROGRESS' ? 'selected' : ''}>In Progress</option>
        <option value="DELIVERED" ${object.status == 'DELIVERED' ? 'selected' : ''}>Delivered</option>
        <option value="PAID" ${object.status == 'PAID' ? 'selected' : ''}>Paid</option>
    </select>
</div>
<div class="mb-3">
    <label for="date">Date</label>
    <input id="date" type="date" name="date" value="${object.date}" readonly
               class="form-control">


</div>
<div class="mb-3">
    <label name="totalPrice">Total Price</label>
    <input id="totalPrice" type="number" name="totalPrice"  value="${object.totalPrice}"
           class="form-control" readonly>

</div>
<div class="mb-3">
    <label name="note">Note</label>
        <input id="note" type="text" name="note"  value="${object.note}"
               class="form-control">
        <c:if test="${object.id > 0}">
            <a href="javascript:getUrl(${object.tableNumber},${object.id});" >Update note</a>
        </c:if>
</div>
<div class="mb-3">
    <label for="tableNumber">Table Number</label>
        <input id="tableNumber" type="number" name="tableNumber" readonly
               value="${object.tableNumber}" class="form-control">


</div>

<table class="table">
    <thead>
    <tr>
        <th scope="col">Item Id</th>
        <th scope="col">Product </th>
        <th scope="col">Quantity</th>
        <th scope="col">Unit Price</th>
        <th scope="col">Total Price</th>
        <th scope="col">Delivered?</th>
        <th scope="col">#</th>
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
            <td>${item.delivered}</td>
            <c:if test="${item.delivered}">
                <td>Item cannot be deleted!</td>
            </c:if>
            <c:if test="${!item.delivered}">
                <td><a href="/deleteItemFromMyOrder?tableNumber=${object.tableNumber}&orderId=${object.id}&itemId=${item.id}">Delete</a></td>
            </c:if>
            <c:if test="${item.reviewed}">
                <td>Item is reviewed already!</td>
            </c:if>
            <c:if test="${!item.reviewed}">
            	<c:if test="${item.delivered}">
            		<td><a href="/reviewProductByOrderItem?tableNumber=${object.tableNumber}&orderItemId=${item.id}">Review</a></td>
            	</c:if>
            	<c:if test="${!item.delivered}">
            		<td></td>
            	</c:if>
            </c:if>
        </tr>
    </c:forEach>
    </tbody>
</table>
<a class="btn btn-light" href="/">Add more products</a>
<c:if test="${object.id > 0 && object.status == 'OPEN' }">
    <a href="/changeStatusToConfirmed?tableNumber=${object.tableNumber}&orderId=${object.id}" >Confirm</a>
</c:if>