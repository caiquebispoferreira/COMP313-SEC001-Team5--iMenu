<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>

.formbox{
padding:50px;
}
#newTableNumber{
 width:150px;
 margin-left:15px;

}
#btn{
 padding-left:5px;
  margin-left:2px;
  padding-bottom:10px;
  width:150px;
  text-align: center;
   background: linear-gradient(to right, #ff8a00 0%, #da1b60 100%);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
	text-decoration: none;
	text-transform: uppercase;
	letter-spacing: 3px;
	font-weight: bold;
	font-size:13px;
	border-color:#DCDCDC;
}
#tableLable{
 padding-left:-2px;
 

}
</style>
<div class="formBox">
    <label id="tableLable"for="newTableNumber">Change Table Number : </label>
    <input type="number" id="newTableNumber" placeholder="Enter a table number"/>
</div>
<div class="formBox">
    <button onclick="changeTableNumber()" id="btn">Click to Add</button>
</div>
