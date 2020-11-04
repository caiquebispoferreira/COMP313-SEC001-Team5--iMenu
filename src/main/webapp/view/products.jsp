<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div class="row">
<a href="/addProduct">
<button type="button" class="btn btn-primary">ADD</button>
</a>
</div>
<div class="container">
  <div class="row">
    <div class="col-12">
    <div class="p-3 mb-2 bg-light text-dark">
      <table class="table table-stripped">
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
                        <th scope="row">${item.id}</th>
                        <td>${item.name}</td>
                        <td>${item.description}</td>
                        <td>${item.unitPrice}</td>
                        <td>${item.enabled}</td>
                        <td>${item.category}</td>
                        <td>${item.pictureUrl}</td>
                        <td><a href="/editProduct?id=${item.id}"><button type="button" class="btn btn-success"><i class="fas fa-edit"></i>EDIT</button></a></td>
                        <td><a href="/deleteProduct?id=${item.id}"><button type="button" class="btn btn-danger"><i class="far fa-trash-alt"></i>DELETE</button></a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</div>
</div>

