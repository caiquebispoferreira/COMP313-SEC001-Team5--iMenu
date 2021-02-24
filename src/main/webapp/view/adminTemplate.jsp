<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html>
<head>
<title>iMenu</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta charset="utf-8">
<link rel="stylesheet"
	href="${contextPath}/resources/css/customertemplate.css" />
<meta name="viewport" content="width=device-width, initial-scale=1"
	, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<meta name="theme-color" content="#563d7c">
<link rel="icon" href="${contextPath}/resources/img/faviconmenu.png"
	type="image/png" sizes="16x16 32x32">
</head>
<body class="bg-light">
	<div class="header"><jsp:include page="header.jsp">
			<jsp:param name="contextPath" value="${contextPath}" />
		</jsp:include>
	</div>
	<div class="container">
		<h1>${title}</h1>
		<jsp:include page="${body}">
			<jsp:param name="contextPath" value="${contextPath}" />
			<jsp:param name="object" value="${object}" />
		</jsp:include>
	</div>
	<div class="footer">
		<jsp:include page="footer.jsp">
			<jsp:param name="contextPath" value="${contextPath}" />
		</jsp:include>
	</div>
</body>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
	crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/apexcharts@latest"></script>
<script>
	Apex.grid = {
		padding: {
			right: 0,
			left: 0
		}
	}

	Apex.dataLabels = {
		enabled: false
	}

	var colorPalette = ['#00D8B6','#008FFB',  '#FEB019', '#FF4560', '#775DD0']

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

	var randomizeArray = function (arg) {
		var array = arg.slice();
		var currentIndex = array.length, temporaryValue, randomIndex;

		while (0 !== currentIndex) {

			randomIndex = Math.floor(Math.random() * currentIndex);
			currentIndex -= 1;

			temporaryValue = array[currentIndex];
			array[currentIndex] = array[randomIndex];
			array[randomIndex] = temporaryValue;
		}

		return array;
	}

	window.onload = function() {
		console.log("here")
		document.getElementById("currentTableNumber").value = getCurrentTableNumber();

		plotChart('#topProfitableProducts','Top 5 Profitable Products',
				['Rodolatina', 'WestUnion', 'WorkComp', 'Telefonica', 'Oi'],
				[21, 23, 19, 14, 6]
		)
		plotChart('#topNonProfitableProducts','Top 5 Non-Profitable Products',
				['Rodolatina', 'WestUnion', 'WorkComp', 'Telefonica', 'Oi'],
				[21, 23, 19, 14, 6]
		)

	}
	
	function plotChart(id,chartName, productsLabel,productsSeries){
		var topProfitableProducts = {
			chart: {
				type: 'donut',
				width: '100%'
			},
			dataLabels: {
				enabled: false,
			},
			plotOptions: {
				pie: {
					donut: {
						size: '75%',
					},
					offsetY: 20,
				},
				stroke: {
					colors: undefined
				}
			},
			colors: colorPalette,
			title: {
				text: chartName,
				style: {
					fontSize: '18px'
				}
			},
			series: productsSeries,
			labels: productsLabel,
			legend: {
				position: 'left',
				offsetY: 80
			}
		}

		var donut = new ApexCharts(document.querySelector(id), topProfitableProducts)
		donut.render();

	}
</script>
</html>