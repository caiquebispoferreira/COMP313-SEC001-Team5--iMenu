<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${contextPath}/resources/css/users.css" />
<link
	href="https://fonts.googleapis.com/css2?family=Syncopate:wght@700&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;700&display=swap"
	rel="stylesheet">

<div class="formbox">

	<h2>Users</h2>
	
	<div class="row">
		<div class="col-12">
			<a class="btn btn-light" href="/addUser">Add User</a>
		</div>
	</div>
	
	<table class="container">
		<thead>
			<tr>
				<th><h1>Id</h1></th>
				<th><h1>Name</h1></th>
				<th><h1>Role</h1></th>
				<th><h1>Action</h1></th>
				<th><h1>Action</h1></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${object}" var="item">
				<tr>
					<td>${item.id}</td>
					<td>${item.name}</td>
					<td>${item.role}</td>
					<td><a href="/editUser?id=${item.id}"><i
							class="fas fa-edit"></i> Edit</a></td>
					<td><a href="/deleteUser?id=${item.id}"><i
							class="fas fa-trash"></i> Delete</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>