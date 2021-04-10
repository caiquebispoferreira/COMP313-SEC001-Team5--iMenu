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
<html>
<head>
<title>iMenu - Menu</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<meta name="theme-color" content="#563d7c">
<link rel="stylesheet"
	href="${contextPath}/resources/css/customertemplate.css" />
<link rel="stylesheet" href="${contextPath}/resources/css/style.css" />
<link rel="icon" href="${contextPath}/resources/img/faviconmenu.png"
	type="image/png" sizes="16x16 32x32">
</head>

<body class="bg-light">
	<div class="header"><jsp:include page="header.jsp">
			<jsp:param name="contextPath" value="${contextPath}" />
		</jsp:include>
	</div>

	<div class="container">
		<h1 style="font-size: 4vw;" class="h1 text-center">${title}</h1>
		<jsp:include page="${body}">
			<jsp:param name="contextPath" value="${contextPath}" />
			<jsp:param name="object" value="${object}" />
		</jsp:include>

		<div class="push"></div>
	</div>

	<div class="footer">
		<jsp:include page="footer.jsp">
			<jsp:param name="contextPath" value="${contextPath}" />
		</jsp:include>
	</div>
</body>

<script>
	function getCurrentTableNumber() {
		var tmp = localStorage.getItem("tableNumber")
		var tableNumber = 0;
		if (tmp) {
			tableNumber = tmp;
		}
		return tableNumber;
	}

	function changeTableNumber() {
		console.log("here")
		var value = document.getElementById("newTableNumber").value;
		localStorage.setItem("tableNumber", value);
		document.getElementById("currentTableNumber").value = value;

	}

	window.onload = function() {
		console.log("here")
		document.getElementById("currentTableNumber").value = getCurrentTableNumber();
	}

	function myOrder() {
		var tableNumber = getCurrentTableNumber();
		window.location.href = "/myOrder?tableNumber=" + tableNumber;
	}

	function addItemToMyOrder(productId, quantity) {
		var tableNumber = getCurrentTableNumber();
		window.location.href = "/addItemToMyOrder?productId=" + productId
				+ "&quantity=" + quantity + "&tableNumber=" + tableNumber;
	}

	function getNote() {
		return document.getElementById('note').value
	}

	function getUrl(tableNumber, orderId) {
		window.location.href = "updateNoteFromMyOrder?tableNumber="
				+ tableNumber + "&orderId=" + orderId + "&note=" + getNote();
	}
</script>
</html>