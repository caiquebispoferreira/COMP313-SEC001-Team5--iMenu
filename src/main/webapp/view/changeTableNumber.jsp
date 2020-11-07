<%--
  Created by IntelliJ IDEA.
  User: sergi
  Date: 21/10/20
  Time: 1:40 p.m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
