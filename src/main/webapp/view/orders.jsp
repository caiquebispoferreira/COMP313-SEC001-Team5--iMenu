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
                <th scope="col">Id</th>
                <th scope="col">Status</th>
                <th scope="col">Date</th>
                <th scope="col">Total Price</th>
                <th scope="col">Note</th>
                <th scope="col">Table Number</th>
                <th scope="col">#</th>
                <th scope="col">#</th>
            </tr>
            </thead>
            <tbody>
                <c:forEach items="${object}" var="item">
                    <tr>
                        
                        <th scope="row">${item.id}</th>
                        <td>${item.status}</td>
                        <td>${item.date}</td>
                        <td>${item.totalPrice}</td>
                        <td>${item.note}</td>
                        <td>${item.tableNumber}</td>
                        <td><a href="/editOrder?id=${item.id}">Edit</a></td>
                        <td><a href="/deleteOrder?id=${item.id}">Delete</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>



