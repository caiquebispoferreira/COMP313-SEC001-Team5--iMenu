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
<style>
.formbox {
	padding: 50px;
}

#newTableNumber {
	width: 150px;
	margin-left: 15px;
}

#btn {
	padding-left: 5px;
	margin-left: 2px;
	padding-bottom: 10px;
	width: 150px;
	text-align: center;
	background: linear-gradient(to right, #ff8a00 0%, #da1b60 100%);
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
	text-decoration: none;
	text-transform: uppercase;
	letter-spacing: 3px;
	font-weight: bold;
	font-size: 13px;
	border-color: #DCDCDC;
}

#tableLable {
	padding-left: -2px;
}
</style>

<link rel="stylesheet" href="${contextPath}/resources/css/style.css" />

<link
	href="https://fonts.googleapis.com/css2?family=Syncopate:wght@700&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;700&display=swap"
	rel="stylesheet">
<div class="formBox">
	<label id="tableLable" for="newTableNumber">Change Table Number
		: </label> <input type="number" id="newTableNumber"
		placeholder="Enter a table number" />
</div>
<div class="formBox">
	<button onclick="changeTableNumber()" id="btn">Click to Add</button>
</div>
