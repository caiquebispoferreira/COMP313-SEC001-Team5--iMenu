<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html>
<head>
    <title>iMenu</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1", shrink-to-fit=no">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <meta name="theme-color" content="#563d7c">
    <link rel="stylesheet" href="https://drive.google.com/file/d/1VU63U_KJ8H078dU7fui3DoJ8mgSGTJQm/view?usp=sharing" >
</head>
<body class="bg-light">
        <jsp:include page="header.jsp" >
            <jsp:param name="contextPath" value="${contextPath}" />
        </jsp:include>
        <div class="container">
            <h1 class="h1 text-center">${title}</h1>
            <jsp:include page="${body}">
                <jsp:param name="contextPath" value="${contextPath}" />
                <jsp:param name="object" value="${object}" />
            </jsp:include>
        </div>

        <jsp:include page="footer.jsp" />
</body>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
<script>
    function getCurrentTableNumber(){
        var tmp = localStorage.getItem("tableNumber")
        var tableNumber = 0;
        if(tmp){
            tableNumber = tmp;
        }
        return tableNumber;
    }

    function changeTableNumber(){
        console.log("here")
        var value = document.getElementById("newTableNumber").value;
        localStorage.setItem("tableNumber", value);
        document.getElementById("currentTableNumber").value = value;

    }

    window.onload = function(){
        console.log("here")
        document.getElementById("currentTableNumber").value = getCurrentTableNumber();
    }

    function myOrder(){
        var tableNumber = getCurrentTableNumber();
        window.location.href = "/myOrder?tableNumber="+tableNumber;
    }

    function addItemToMyOrder(productId,quantity){
        var tableNumber = getCurrentTableNumber();
        window.location.href = "/addItemToMyOrder?productId="+productId+"&quantity="+quantity+"&tableNumber="+tableNumber;
    }

    function getNote(){
        return document.getElementById('note').value
    }

    function getUrl(){
        return "updateNoteFromMyOrder?tableNumber=${object.tableNumber}&orderId=${object.id}&note="+getNote();
    }

</script>
</html>