<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<style>
.container {
  padding: 2rem 0rem;
}

h4 {
  margin: 2rem 0rem 1rem;
}

.table-image {
  td, th {
    vertical-align: middle;
  }
}
</style>



<div class="row">
<a href="/addUser">
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
                <th scope="col">Role</th>
                <th scope="col">#</th>
                <th scope="col">#</th>
            </tr>
            </thead>
            <tbody>
                    <c:forEach items="${object}" var="item">
                    <tr>
                        <th scope="row">${item.id}</th>
                        <td>${item.name}</td>
                        <td>${item.role}</td>
            <td><a href="/editUser?id=${item.id}"> <button type="button" class="btn btn-success"><i class="fas fa-edit"></i>EDIT</button></a></td>
            <td><a href="/deleteUser?id=${item.id}"><button type="button" class="btn btn-danger"><i class="far fa-trash-alt"></i>DELETE</button></a></td>
                       
                    </tr>
                    </c:forEach>
            </tbody>
            
        </table>
    </div>
</div>
</div>
</div>
