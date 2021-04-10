<!-- 
Purpose: 
Author: Ashik Lochna, Nazif Sahim, Wahida Hossain, Caique Ferreira, Irisi Meko
Date: April 09, 2021
Version: iMenu v6.0
Parameters: 
-->

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<title>iMenu - Login</title>
<link rel="stylesheet" href="${contextPath}/resources/css/login.css" />
<link rel="icon" href="${contextPath}/resources/img/faviconmenu.png"
	type="image/png" sizes="16x16 32x32">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.bundle.min.js"></script>

<div class="container" id="container">
	<div class="form-container sign-up-container">
		<form action="#">
			<h1>Create Account</h1>
			<div class="social-container">
				<a href="#" class="social"><i class="icon ion-social-facebook"></i></a>
				<a href="#" class="social"><i class="icon ion-social-googleplus"></i></a>
				<a href="#" class="social"><i class="icon ion-social-linkedin"></i></a>
			</div>
			<span>or use your email for registration</span> <input type="text"
				placeholder="Username" /> <input type="password"
				placeholder="Password" /> <input type="password"
				placeholder="Confirm Password" />
			<button>Sign Up</button>
			<a class="back" href="/index">Back</a>
		</form>
	</div>
	<div class="form-container sign-in-container">
		<form method="POST" action="${contextPath}/login">
			<h1>Sign in</h1>
			<div class="social-container">
				<a href="#" class="social"><i class="icon ion-social-facebook"></i></a>
				<a href="#" class="social"><i class="icon ion-social-googleplus"></i></a>
				<a href="#" class="social"><i class="icon ion-social-linkedin"></i></a>
			</div>
			<span>or use your account</span>
			<c:if test="${error !=null}">
				<div style="color: red">User/Password is invalid</div>
			</c:if>

			<input type="text" id="username" name="username" class="form-control"
				placeholder="Username" required autofocus /> <input type="password"
				id="password" name="password" class="form-control"
				placeholder="Password" required /> <a href="#">Forgot your
				password?</a>
			<button>Sign In</button>
			<a class="back" href="/index">Back</a>
		</form>
	</div>
	<div class="overlay-container">
		<div class="overlay">
			<div class="overlay-panel overlay-left">
				<video class="videoSignIn" width="927" height="730"
					playsinline="playsinline" autoplay="autoplay" muted="muted"
					loop="loop">
					<source src="${contextPath}/resources/video/loginvideo2.mp4"
						type="video/mp4">
				</video>
				<h1>Welcome Back!</h1>
				<p>To keep connected with iMenu please login with your personal
					info</p>
				<button class="ghost" id="signIn">Sign In</button>
			</div>

			<div class="overlay-panel overlay-right">
				<video class="videoSignIn" width="927" height="730"
					playsinline="playsinline" autoplay="autoplay" muted="muted"
					loop="loop">
					<source src="${contextPath}/resources/video/loginvideo.mp4"
						type="video/mp4">
				</video>
				<h1>Hello, Friend!</h1>
				<p>Enter your personal details and start journey with iMenu</p>
				<button class="ghost" id="signUp">Sign Up</button>
			</div>
		</div>
	</div>
</div>

<script>
const signUpButton = document.getElementById('signUp');
const signInButton = document.getElementById('signIn');
const container = document.getElementById('container');

signUpButton.addEventListener('click', () => {
	container.classList.add("right-panel-active");
});

signInButton.addEventListener('click', () => {
	container.classList.remove("right-panel-active");
});
</script>