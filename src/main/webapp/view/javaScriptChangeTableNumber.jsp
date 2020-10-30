<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form>
    <div class="formBox">
        <label for="currentTableNumber">Current Table Number</label>
        <input type="number" id="currentTableNumber" readonly />
    </div>
    <div class="formBox">
        <label for="newTableNumber">Change Table Number</label>
        <input type="number" id="newTableNumber" placeholder="Type a table number"/>
    </div>
    <div class="formBox">
        <button onclick="changeTableNumber()" id="btn">Click to Add</button>
    </div>
    <div id="msg">
        <pre></pre>
    </div>
</form>


</body>
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
</script>
</html>
