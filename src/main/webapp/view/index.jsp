<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<head>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;700&display=swap"
	rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="${contextPath}/resources/img/faviconmenu.png"
	type="image/png" sizes="16x16 32x32">
<link rel="stylesheet" href="${contextPath}/resources/css/index.css" />
<link rel="stylesheet" href="${contextPath}/resources/css/style.css" />
</head>

<div align="center">
	<marquee behavior="alternate" bgcolor="#ff084a" direction="left"
		loop="200" scrollamount="7" scrolldelay="2" width="100%" height="16px">
		<span
			style="font-size: 13px; color: #FFFFFF; font-family: 'Poppins', sans-serif; text-align: center;">
			Welcome to iMenu!&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Our service is
			open 24/7!&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Enjoy your meal!</span>
	</marquee>
</div>
<br>
<br>
<h1>Categories</h1>
<br>
<div class="content">
	<div class="row">
		<div class="col-sm-4">
			<h6>Appetizers</h6>

			<div class="slideshow-container">

				<div class="mySlides fade">
					<a href="/listProductByCategory?category=APPETIZER"> <img
						src="${contextPath}/resources/img/appetizer.jpg" width="315"
						height="315" />
					</a>
				</div>

				<div class="mySlides fade">
					<a href="/listProductByCategory?category=APPETIZER"> <img
						src="${contextPath}/resources/img/appetizer1.jpeg" width="315"
						height="315" />
					</a>
				</div>

				<div class="mySlides fade">
					<a href="/listProductByCategory?category=APPETIZER"> <img
						src="${contextPath}/resources/img/appetizer2.jpeg" width="315"
						height="315" />
					</a>
				</div>

				<div style="text-align: center">
					<span class="dot"></span> <span class="dot"></span> <span
						class="dot"></span>
				</div>

			</div>
			<br>
			<article class="article1">
				<p>An appetizer is a small dish of food meant to be eaten before
					a meal to stimulate your guests’ taste buds; It may be served hot
					or cold with a variety of colors and textures; it is often shared
					by several people. It has been served at dinner parties and
					gatherings for many years.</p>
			</article>
		</div>

		<div class="col-sm-4">
			<h6>Main Course</h6>
			<div class="slideshow-container1">

				<div class="mySlides1 fade">
					<a href="/listProductByCategory?category=MAIN_COURSE"> <img
						src="${contextPath}/resources/img/MainCourse.jpg" width="315"
						height="315" />
					</a>
				</div>

				<div class="mySlides1 fade">
					<a href="/listProductByCategory?category=MAIN_COURSE"> <img
						src="${contextPath}/resources/img/MainCourse1.JPG" width="315"
						height="315" />
					</a>
				</div>

				<div class="mySlides1 fade">
					<a href="/listProductByCategory?category=MAIN_COURSE"> <img
						src="${contextPath}/resources/img/MainCourse2.JPG" width="315"
						height="315" />
					</a>
				</div>

				<div style="text-align: center">
					<span class="dot1"></span> <span class="dot1"></span> <span
						class="dot1"></span>
				</div>

			</div>
			<br>
			<article class="article1">
				<p>The main dish is usually the heaviest, heartiest, and most
					complex or substantial dish in a meal. The main ingredient is
					usually meat, fish or another protein source. It is most often
					preceded by an appetizer, soup or salad, and followed by a dessert.
				</p>
			</article>
		</div>

		<div class="col-sm-4">
			<h6>Beverages</h6>
			<div class="slideshow-container2">

				<div class="mySlides2 fade">
					<a href="/listProductByCategory?category=BEVERAGE"> <img
						src="${contextPath}/resources/img/beverage.jpg" width="315"
						height="315" />
					</a>
				</div>

				<div class="mySlides2 fade">
					<a href="/listProductByCategory?category=BEVERAGE"> <img
						src="${contextPath}/resources/img/beverage1.jpg" width="315"
						height="315" />
					</a>
				</div>

				<div class="mySlides2 fade">
					<a href="/listProductByCategory?category=BEVERAGE"> <img
						src="${contextPath}/resources/img/beverage2.jpg" width="315"
						height="315" />
					</a>
				</div>

				<div style="text-align: center">
					<span class="dot2"></span> <span class="dot2"></span> <span
						class="dot2"></span>
				</div>

			</div>
			<br>
			<article class="article1">
				<p>A drink (or beverage) is a liquid intended for human
					consumption. In addition to their basic function of satisfying
					thirst, drinks play important roles in human culture. Common types
					of drinks include plain drinking water, milk, coffee, tea, hot
					chocolate, juice and soft drinks.</p>
			</article>
		</div>
	</div>


</div>
<script>
	var slideIndex = 0;
	var slideIndex1 = 0;
	var slideIndex2 = 0;
	showSlides();
	showSlides1();
	showSlides2();

	function showSlides() {
		var i;
		var slides = document.getElementsByClassName("mySlides");
		var dots = document.getElementsByClassName("dot");
		for (i = 0; i < slides.length; i++) {
			slides[i].style.display = "none";
		}
		slideIndex++;
		if (slideIndex > slides.length) {
			slideIndex = 1
		}
		for (i = 0; i < dots.length; i++) {
			dots[i].className = dots[i].className.replace(" active", "");
		}
		slides[slideIndex - 1].style.display = "block";
		dots[slideIndex - 1].className += " active";
		setTimeout(showSlides, 2500); // Change image every 2 seconds
	}

	function showSlides1() {
		var i;
		var slides = document.getElementsByClassName("mySlides1");
		var dots = document.getElementsByClassName("dot1");
		for (i = 0; i < slides.length; i++) {
			slides[i].style.display = "none";
		}
		slideIndex1++;
		if (slideIndex1 > slides.length) {
			slideIndex1 = 1
		}
		for (i = 0; i < dots.length; i++) {
			dots[i].className = dots[i].className.replace(" active", "");
		}
		slides[slideIndex1 - 1].style.display = "block";
		dots[slideIndex1 - 1].className += " active";
		setTimeout(showSlides1, 2500); // Change image every 2 seconds
	}

	function showSlides2() {
		var i;
		var slides = document.getElementsByClassName("mySlides2");
		var dots = document.getElementsByClassName("dot2");
		for (i = 0; i < slides.length; i++) {
			slides[i].style.display = "none";
		}
		slideIndex2++;
		if (slideIndex2 > slides.length) {
			slideIndex2 = 1
		}
		for (i = 0; i < dots.length; i++) {
			dots[i].className = dots[i].className.replace(" active", "");
		}
		slides[slideIndex2 - 1].style.display = "block";
		dots[slideIndex2 - 1].className += " active";
		setTimeout(showSlides2, 2500); // Change image every 2 seconds
	}
</script>


