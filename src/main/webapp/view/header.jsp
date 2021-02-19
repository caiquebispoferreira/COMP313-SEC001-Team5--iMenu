<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<link rel="stylesheet" href="${contextPath}/resources/css/style.css" />
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap"
	rel="stylesheet">
<link rel="icon" href="${contextPath}/resources/img/faviconmenu.png"
	type="image/png" sizes="16x16">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css"
	rel="stylesheet" type="text/css" />

<form id="logoutForm" method="post" action="/logout">
	<input type="hidden" name="${_csrf.parameterName}"
		value="${_csrf.token}">
</form>

<nav>
	<div class="logo">
		<a href="/"> <img class="logo"
			src="${contextPath}/resources/img/imenu.png" width="300" height="100">
		</a>
	</div>

	<ul class="nav-links">
		<c:if test="${currentUser != null}">
			<c:if test="${currentUser.role == 'ADMINISTRATOR'}">
				<li><a href="/listUser"><i class="fas fa-users"></i> Users</a>
				</li>
			</c:if>
			<li><a href="/listProduct"><i class="fas fa-chart-pie"></i>
					Products</a></li>
			<li><a href="/listOrder"><i class="far fa-edit"></i> Orders</a>
			</li>
			<li><a href="/listOrderByTableNumber"> <i
					class="far fa-copy"></i> Orders By Table
			</a></li>
			<li><a href="/changeTableNumber"> <i
					class="fas fa-exchange-alt"></i> Change Table
			</a></li>
			<li id="logout"><a
				onclick="document.forms['logoutForm'].submit()"> <i
					class="fas fa-sign-out-alt"></i> Logout
			</a></li>
		</c:if>
		<c:if test="${currentUser == null}">
			<li>
				<button type="button" onclick="myOrder()">My Order</button>
			</li>
			<li><a href="/index">Reviews</a></li>
			<li><a href="/index">Contact</a></li>
			<li><a href="/login">Login</a></li>
		</c:if>

	</ul>

	<div class="burger">
		<div class="line1"></div>
		<div class="line2"></div>
		<div class="line3"></div>
	</div>

	<a href="/index"> <i class="fas fa-arrows-alt-v"></i>Table</a> <input 
		type="number" id="currentTableNumber" readonly />
</nav>

<script>
const navSlide = () => {
	const burger = document.querySelector('.burger');
	const nav = document.querySelector('.nav-links');
	const navLinks = document.querySelectorAll('.nav-links li');
	
	burger.addEventListener('.click',() => {
		nav.classList.toggle('nav-active');
		
		navLinks.forEach((link, index)=>{
			if(link.style.animation){
				link.style.animation = ''}
			else {
				link.style.animation = `navLinkFade 0.5s ease forwards $(index/7 + 1.5)s`;			
			}
		});
		burger.classList.toggle('toggle');
	});	
}

navSlide();
</script>



