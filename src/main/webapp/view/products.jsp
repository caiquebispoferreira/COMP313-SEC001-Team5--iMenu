<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

    <div class="row">
        <a href="/addProduct">Add</a>
    </div>
    <div class="row">
        <div class="col-12">
            <table class="table">
                <thead>
                <tr>
                    <th scope="col">Id</th>
                    <th scope="col">Name</th>
                    <th scope="col">Description</th>
                    <th scope="col">Unit Price</th>
                    <th scope="col">Enabled</th>
                    <th scope="col">Category</th>
                    <th scope="col">Picture URL</th>
                    <th scope="col">#</th>
                    <th scope="col">#</th>
                </tr>
                </thead>
                <tbody>
                    <c:forEach items="${object}" var="item">
                        <tr>
                            <th scope="row">${itema.id}</th>
                            <td>${item.name}</td>
                            <td>${item.description}</td>
                            <td>${item.unitPrice}</td>
                            <td>${item.enabled}</td>
                            <td>${item.category}</td>
                            <td>${item.pictureUrl}</td>
                            <td><a href="/editProduct?id=${item.id}">Edit</a></td>
                            <td><a href="/deleteProduct?id=${item.id}">Delete</a></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

