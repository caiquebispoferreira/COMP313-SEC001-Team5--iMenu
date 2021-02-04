<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<link rel="stylesheet" href="${contextPath}/resources/css/style.css" />


<div class="formbox">
<div class="row">
    <div class="col-13">
        <table class="table table-bordered table-stripped">
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
            <tbody>
                <c:forEach items="${object}" var="item">
                    <tr>
                        <td scope="row">${item.id}</td>
                        <td scope="row">${item.tableNumber}</td>
                        <td scope="row">${item.date}</td>
                        <td scope="row">${item.totalPrice}</td>
                        <td scope="row">${item.note}</td>
                        <td scope="row">${item.status}</td>
                        <td scope="row">
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
</div>
</div>

