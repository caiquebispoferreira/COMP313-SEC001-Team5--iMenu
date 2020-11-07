<%--
  Created by IntelliJ IDEA.
  User: sergi
  Date: 21/10/20
  Time: 1:39 p.m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div class="row">
    <div class="col-md-9 order-md-2">
        <form action="${action}" method="post">
            <div class="mb-3">
                    <label for="id">Id</label>
                    <c:if test="${readonly}">
                        <input id="id" type="number" name="id"  value="${object.id}"
                               class="form-control" readonly>
                    </c:if>
                    <c:if test="${!readonly}">
                        <input id="id" type="number" name="id"  value="${object.id}"
                               class="form-control">
                    </c:if>
                </div>
            <div class="mb-3">
                    <label name="status">Status</label>
                    <select name="status" class="custom-select d-block w-100" required ${readonly ? 'disabled' : ''}>
                        <option value="">Select an option</option>
                        <option value="OPEN" ${object.status == 'OPEN' ? 'selected' : ''}>Open</option>
                        <option value="IN_PROGRESS" ${object.status == 'IN_PROGRESS' ? 'selected' : ''}>In Progress</option>
                        <option value="DELIVERED" ${object.status == 'DELIVERED' ? 'selected' : ''}>Delivered</option>
                        <option value="PAID" ${object.status == 'PAID' ? 'selected' : ''}>Paid</option>
                    </select>
                </div>
            <div class="mb-3">
                    <label for="date">Date</label>
                    <c:if test="${readonly}">
                        <input id="date" type="date" name="date" value="${object.date}" readonly
                                class="form-control">
                    </c:if>
                    <c:if test="${!readonly}">
                        <input id="date" type="date" name="date" value="${object.date}"
                               class="form-control">
                    </c:if>

                </div>
            <div class="mb-3">
                    <label name="totalPrice">Total Price</label>
                    <c:if test="${readonly}">
                        <input id="totalPrice" type="number" name="totalPrice"  value="${object.totalPrice}"
                               class="form-control" readonly>
                    </c:if>
                    <c:if test="${!readonly}">
                        <input id="totalPrice" type="number" name="totalPrice"  value="${object.totalPrice}"
                               class="form-control">
                    </c:if>
                </div>
            <div class="mb-3">
                    <label name="note">Note</label>
                    <c:if test="${readonly}">
                        <input id="note" type="text" name="note"  value="${object.note}"
                               class="form-control" readonly>
                    </c:if>
                    <c:if test="${!readonly}">
                        <input id="note" type="text" name="note"  value="${object.note}"
                               class="form-control">
                    </c:if>
                </div>
            <div class="mb-3">
                    <label for="tableNumber">Table Number</label>
                    <c:if test="${readonly}">
                        <input id="tableNumber" type="number" name="tableNumber" readonly
                               value="${object.tableNumber}" class="form-control">
                    </c:if>
                    <c:if test="${!readonly}">
                        <input id="tableNumber" type="number" name="tableNumber"
                               value="${object.tableNumber}" class="form-control">
                    </c:if>

                </div>
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">Item Id</th>
                        <th scope="col">Product </th>
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
                            <td><a href="/deleteOrder?id=${item.id}">Delete</a></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

               <hr class="mb-4">
                <button class="btn btn-primary btn-lg btn-block" type="submit">Submit</button>
        </form>
    </div>
</div>
