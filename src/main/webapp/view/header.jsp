<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<head>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<meta charset="utf-8">

<meta name="viewport" content="width=device-width, initial-scale=1">

<script
	src="https://getbootstrap.com/docs/3.4/assets/js/ie-emulation-modes-warning.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"
	integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ"
	crossorigin="anonymous"></script>
<script src="https://getbootstrap.com/docs/3.4/dist/js/bootstrap.min.js"></script>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css"
	rel="stylesheet" type="text/css" />
</head>
<form id="logoutForm" method="post" action="/logout">
	<input type="hidden" name="${_csrf.parameterName}"
		value="${_csrf.token}">
</form>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	<div class="container-fluid">
		<a class="navbar-brand" href="/index"> <img id="logo"
			src="${contextPath}/resources/img/imenu.png" height="80" width="230">
		</a>

		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
			<div class="navbar-nav nav-fill w-100">
				<c:if test="${currentUser != null}">
					<c:if test="${currentUser.role == 'ADMINISTRATOR'}">
						<a class="nav-link active" href="/listUser"><i
							class="fas fa-users"></i> Users <span class="sr-only">(current)</span></a>
					</c:if>
					<a class="nav-link" href="/listProduct"><i
						class="fas fa-chart-pie"></i> Products</a>
					<a class="nav-link" href="/listOrder"><i class="far fa-edit"></i>
						Orders</a>
					<a class="nav-link" href="/listOrderByTableNumber"> <i
						class="far fa-copy"></i> Orders By Table
					</a>
					<a class="nav-link" href="/changeTableNumber"> <i
						class="fas fa-exchange-alt"></i> Change Table
					</a>
					<a class="nav-link" role="button"
						onclick="document.forms['logoutForm'].submit()"> <i
						class="fas fa-sign-out-alt"></i> Logout
					</a>
				</c:if>

				<c:if test="${currentUser == null}">
					<a class="nav-link active" role="button" onclick="myOrder()">My
						Order </a>
					<a class="nav-item nav-link active" href="/login">Login</a>
				</c:if>
				<label style="color: white; align-items: center;"> <i
					class="fas fa-arrows-alt-v"></i>Table
				</label> <input type="number" id="currentTableNumber" readonly />
			</div>
		</div>

	</div>
</nav>
