<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<style>

.adminPage{

	margin-top:120px;
}
.adminTasks{
 
 margin-top:20px;
 margin-bottom:70px;
}
</style>
<div class="container adminPage">

<p>Welcome ${currentUser.name} (${currentUser.role})</p>
<hr>
<p class="adminTasks">As the Administrator of <strong>iMenu</strong> you have the privileges to make major changes to all related core tasks and functionalities of <strong>iMenu</strong>, typically dealing with products, orders,
tables and users. <br><br>For more details refer to <strong>iMenu</strong> Technical Document. </p>
</div>





