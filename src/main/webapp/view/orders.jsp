<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div class="row">
    <div class="col-12">
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">Order Number</th>
                    <th scope="col">Table Number</th>
                    <th scope="col">Date</th>
                    <th scope="col">Total Price</th>
                    <th scope="col">Special Note</th>
                    <th scope="col">Order Status</th>
                    <th scope="col">Items</th>
                    <th scope="col">#</th>
                    <th scope="col">#</th>
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
                                ${orderItem.product.name}  <br>
                            </c:forEach>
                        </td>
                        <td><a href="/editOrder?id=${item.id}">Edit</a></td>
                        <td><a href="/deleteOrder?id=${item.id}">Delete</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>



