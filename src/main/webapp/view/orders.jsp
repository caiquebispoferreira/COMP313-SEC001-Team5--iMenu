<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div class="row">
    <a href="/addOrder">Add</a>
</div>
<div class="row">
    <div class="col-12">
        <table class="table">
            <thead>
            <tr>
                <th scope="col">Order Number</th>
                <th scope="col">Product</th>
                <th scope="col">Value</th>
                <th scope="col">Special Note</th>
                <th scope="col">Table Number</th>
                <th scope="col">Order State</th>
                <th scope="col">Picture URL</th>
                <th scope="col">#</th>
                <th scope="col">#</th>
            </tr>
            </thead>
            <tbody>
                <c:forEach items="${object}" var="item">
                    <tr>
                        <th scope="row">${item.ordernumber}</th>
                        <td>${item.Product}</td>
                        <td>${item.Value}</td>
                        <td>${item.SpecialNote}</td>
                        <td>${item.TableNumber}</td>
                        <td>${item.OrderState}</td>
                        <td>${item.pictureUrl}</td>
                        <td><a href="/editOrder?id=${item.ordernumber}">Edit</a></td>
                        <td><a href="/deleteOrder?id=${item.ordernumber}">Delete</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>



