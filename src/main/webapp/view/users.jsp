<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<link rel="stylesheet" href="${contextPath}/resources/css/style.css" />
<link
	href="https://fonts.googleapis.com/css2?family=Syncopate:wght@700&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;700&display=swap"
	rel="stylesheet">


<body>
	<div class="row">
		<div class="col-12">
			<a class="btn btn-light" href="/addUser">Add User</a>
		</div>
	</div>
	<div class="table-responsive">
		<table class="table table-striped">
			<thead class="thead-dark">
				<tr>
					<th scope="col">Id</th>
					<th scope="col">Name</th>
					<th scope="col">Role</th>
					<th scope="col">Action</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<c:forEach items="${object}" var="item">

				<tr>
					<td class="table-light" scope="row">${item.id}</td>
					<td class="table-light">${item.name}</td>
					<th class="table-light">${item.role}</th>
					<td class="table-light"><a href="/editUser?id=${item.id}"><i
							class="fas fa-edit"></i> Edit</a></td>
					<td class="table-light"><a href="/deleteUser?id=${item.id}"><i
							class="fas fa-trash"></i> Delete</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>