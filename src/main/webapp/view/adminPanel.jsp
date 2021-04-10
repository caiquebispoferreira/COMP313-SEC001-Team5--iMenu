<!-- 
Purpose: 
Author: Ashik Lochna, Nazif Sahim, Wahida Hossain, Caique Ferreira, Irisi Meko
Date: April 09, 2021
Version: iMenu v6.0
Parameters: 
-->

<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<link rel="stylesheet" href="${contextPath}/resources/css/style.css" />

<link
	href="https://fonts.googleapis.com/css2?family=Syncopate:wght@700&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;700&display=swap"
	rel="stylesheet">

<div class="container">

	<p>Welcome ${currentUser.name} (${currentUser.role})</p>
	<hr>
	<p class="adminTasks">
		As the Administrator of <strong>iMenu</strong> you have the privileges
		to make major changes to all related core tasks and functionalities of
		<strong>iMenu</strong>, typically dealing with products, orders,
		tables and users. <br> <br>For more details refer to <strong>iMenu</strong>
		Technical Document.
	</p>

	<div class="row">
		<div class="col-12">
			<div id="monthlyProfit"></div>
		</div>
	</div>
	<br /> <br /> <br />
	<div class="row">
		<div class="col-12 col-sm-12 col-md-6">
			<div id="topProfitableProducts"></div>
		</div>
		<div class="col-12 col-sm-12 col-md-6">
			<div id="topNonProfitableProducts"></div>
		</div>
	</div>
</div>





