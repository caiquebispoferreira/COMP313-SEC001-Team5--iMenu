<%--
  Created by IntelliJ IDEA.
  User: sergi
  Date: 21/10/20
  Time: 1:41 p.m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


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
                    <td><a href="/addItemToOrder?id=${item.id}">Add to MyOrder</a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

