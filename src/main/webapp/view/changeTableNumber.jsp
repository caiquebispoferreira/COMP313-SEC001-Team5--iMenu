<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>

.formbox{
padding:100px;
}
</style>
<div class="formBox">
    <label for="newTableNumber">Change Table Number</label>
    <input type="number" id="newTableNumber" placeholder="Type a table number"/>
</div>
<div class="formBox">
    <button onclick="changeTableNumber()" id="btn">Click to Add</button>
</div>
