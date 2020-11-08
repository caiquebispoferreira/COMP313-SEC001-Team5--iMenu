<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div class="row">
    <div class="col-12">
        <a class="btn btn-light" href="/addUser">Add</a>
    </div>

</div>
<div class="row">
    <div class="col-12">
        <table class="table">
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
                        <td><a href="/editUser?id=${item.id}">Edit</a></td>
                        <td><a href="/deleteUser?id=${item.id}">Delete</a></td>
                    </tr>
                    </c:forEach>
            </tbody>
        </table>
    </div>
</div>
