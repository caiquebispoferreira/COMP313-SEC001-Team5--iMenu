<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;700&display=swap" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="${contextPath}/resources/img/faviconmenu.png" type="image/png" sizes="16x16 32x32">

<style>
h1{
    font-family: 'Poppins', sans-serif;
    padding: 50px;
    text-align: center;
	text-transform: uppercase;
	letter-spacing: 5px;
}

h6{
    font-family: 'Poppins', sans-serif;
	text-transform: uppercase;
	letter-spacing: 5px;
	text-align: center;
}

content {
position:relative;
    z-index:2;
}

.article1{
width:315px;
height:315px;
font-family: 'Poppins', sans-serif;
display:flex;
font-size:13px;
}

* {box-sizing: border-box;}
body {font-family: Verdana, sans-serif;}
.mySlides {display: none;}
.mySlides1 {display: none;}
.mySlides2 {display: none;}
img {vertical-align: middle;}

/* Slideshow container */
.slideshow-container {
  max-width: 1000px;
  position: relative;
  margin: auto;
}

.slideshow-container1 {
  max-width: 1000px;
  position: relative;
  margin: auto;
}

.slideshow-container2 {
  max-width: 1000px;
  position: relative;
  margin: auto;
}

.dot {
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: none;
  transition: background-color 0.6s ease;
}

.dot1 {
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: none;
  transition: background-color 0.6s ease;
}

.dot2 {
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: none;
  transition: background-color 0.6s ease;
}

.active {
  background-color: #717171;
}


.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 2.4s;
  animation-name: fade;
  animation-duration: 2.4s;
}

@-webkit-keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4}
  to {opacity: 1}
}

@media only screen and (max-width: 300px) {
  .text {font-size: 11px}

</style>
<div align="center">
 <marquee behavior="alternate" bgcolor="#ff084a" direction="left" 
 loop="200" scrollamount="7" scrolldelay="2" width="100%" height="16px">
 <span style="font-size: 13px;color:#FFFFFF; font-family:'Poppins', sans-serif; text-align: center;" >
 Welcome to iMenu!&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Our service is open 24/7!&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Enjoy your meal!</span></marquee>
</div>

<h1>Categories</h1>

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
					<a href="/listProductByCategory?category=APPETIZER"> <img
						src="${contextPath}/resources/img/MainCourse.jpg" width="315"
						height="315" />
					</a>
				</div>

				<div class="mySlides1 fade">
					<a href="/listProductByCategory?category=APPETIZER"> <img
						src="${contextPath}/resources/img/MainCourse1.JPG" width="315"
						height="315" />
					</a>
				</div>

				<div class="mySlides1 fade">
					<a href="/listProductByCategory?category=APPETIZER"> <img
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
					<a href="/listProductByCategory?category=APPETIZER"> <img
						src="${contextPath}/resources/img/beverage.jpg" width="315"
						height="315" />
					</a>
				</div>

				<div class="mySlides2 fade">
					<a href="/listProductByCategory?category=APPETIZER"> <img
						src="${contextPath}/resources/img/beverage1.jpg" width="315"
						height="315" />
					</a>
				</div>

				<div class="mySlides2 fade">
					<a href="/listProductByCategory?category=APPETIZER"> <img
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


