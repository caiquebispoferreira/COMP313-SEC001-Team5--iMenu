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
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
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
	
	function callGetRouter(url){
		var list = []
	
		var xmlHttp = new XMLHttpRequest();
	    xmlHttp.onreadystatechange = function() { 
	        if (xmlHttp.readyState == 4 && xmlHttp.status == 200){
	        	var result = JSON.parse(xmlHttp.response)
	        	var names = []
        		var quantities = []
	        	
	        	
	        	if (url=="findTopSoldProducts"){
	        		for (var i = 0; i < result.length; i++){
	        			names.push(result[i].name)
	        			quantities.push(result[i].quantity)
	        		}
	        		
	        		plotChart('#topProfitableProducts','Top 5 Profitable Products',
	        				JSON.parse(JSON.stringify(names)),
	        				JSON.parse(JSON.stringify(quantities))
	        		)
	        		
	        		
	        	} else if (url =="findLessSoldProducts") {
	        		for (var i = 0; i < result.length; i++){
	        			names.push(result[i].name)
	        			quantities.push(result[i].quantity)
	        		}
	        		plotChart('#topNonProfitableProducts','Top 5 Less Profitable Products',
	        				JSON.parse(JSON.stringify(names)),
	        				JSON.parse(JSON.stringify(quantities))
	        		)
	        	} else {	
	        		for (var i = 0; i < result.length; i++){
	        			var date = new Date();
	        			var day = new Date(date. getFullYear(), date. getMonth(), result[i].day);
	        			
	        			names.push(day.toLocaleDateString())
	        			quantities.push(result[i].total)
	        		}
	        		loadMonthlyProfit(names, quantities)
	        		
	        		
	        	}
	        	
	        	
	        }
	        	
	            
	    }
	    xmlHttp.open("GET", url, true); // true for asynchronous 
	    xmlHttp.send(null);
		
		return list;
	}

	window.onload = function() {
		console.log("here")
		document.getElementById("currentTableNumber").value = getCurrentTableNumber();
		
		callGetRouter("findTopSoldProducts")
		callGetRouter("findLessSoldProducts")
		callGetRouter("getMonthProfitByDay")
		

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
	
	
	function loadMonthlyProfit(labels, values){
		var optionsArea = {
				  chart: {
				    height: 421,
				    type: 'area',
				    background: '#fff',
				    stacked: true,
				    offsetY: 39,
				    zoom: {
				      enabled: false
				    }
				  },
				  plotOptions: {
				    line: {
				      dataLabels: {
				        enabled: false
				      }
				    }
				  },
				  stroke: {
				    curve: 'straight'
				  },
				  colors: ["#3F51B5", '#2196F3'],
				  series: [{
				      name: "Daily profit",
				      data: values
				    }
				  ],
				  fill: {
				    type: 'gradient',
				    gradient: {
				      inverseColors: false,
				      shade: 'light',
				      type: "vertical",
				      opacityFrom: 0.9,
				      opacityTo: 0.6,
				      stops: [0, 100, 100, 100]
				    }
				  },
				  title: {
				    text: 'Current Month Profit by Day',
				    align: 'center',
				    fontSize: '14px',
				    offsetY: -5,
				    offsetX: 20
				  },
				  subtitle: {
				    text: 'Profit X Day',
				    align: 'center',
				    offsetY: 30,
				    offsetX: 20
				  },
				  markers: {
				    size: 0,
				    style: 'hollow',
				    strokeWidth: 8,
				    strokeColor: "#fff",
				    strokeOpacity: 0.25,
				  },
				  grid: {
				    show: false,
				    padding: {
				      left: 0,
				      right: 0
				    }
				  },
				  labels: labels,
				  xaxis: {
				    type: 'datetime',
				    tooltip: {
				      enabled: false
				    }
				  },
				  legend: {
					  show: true,
				    offsetY: -50,
				    position: 'top',
				    horizontalAlign: 'right'
				  }
				}

				var chartArea = new ApexCharts(document.querySelector('#monthlyProfit'), optionsArea);
				chartArea.render();
	}
	
</script>
</html>