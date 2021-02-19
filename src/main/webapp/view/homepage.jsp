<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<title>iMenu</title>
<link rel="icon" href="${contextPath}/resources/img/faviconmenu.png"
	type="image/png" sizes="16x16 32x32">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Syncopate:wght@700&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="${contextPath}/resources/css/homepage.css" />

<video src="${contextPath}/resources/video/homevideo1.mp4" autoplay loop
	playsinline muted></video>

<nav>
	<ul class="nav-links">
		<c:if test="${currentUser == null}">
			<li style="float: left;"><a href="/"> <img class="logo"
					src="${contextPath}/resources/img/homepageicon.png" width="125"
					height="55">
			</a></li>
			<li style="padding-top: 20px;"><a href="/">Contact</a></li>
			<li style="padding-top: 20px;"><a href="/">About Us</a></li>
		</c:if>
	</ul>
</nav>

<header class="viewport-header">
	<h2>
		Explore<br>
	</h2>
	<h1>iMenu</h1>
	<div>
		<a href="/index" class="ghost-button">Get Started</a>
	</div>
</header>