<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${contextPath}/resources/css/style.css"/>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap" rel="stylesheet">

<form id="logoutForm" method="post" action="/logout">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
</form>

<nav>
<div class="logo">
<a href="/">
<img class="logo" src="${contextPath}/resources/img/imenu.png" width="300" height="100">
</a>
</div>    
    
        <ul class= "nav-links">
            <c:if test="${currentUser != null}">
                <c:if test="${currentUser.role == 'ADMINISTRATOR'}">
                    <li>
                        <a href="/listUser">Users</a>
                    </li>
                </c:if>
                <li>
                    <a href="/listProduct">Products</a>
                </li>
                <li >
                    <a href="/listOrder">Orders</a>
                </li>
                <li >
                    <a href="/listOrderByTableNumber">Orders By Table</a>
                </li>
                <li >
                    <a  href="/changeTableNumber">Change Table</a>
                </li>
                <li >
                    <a  onclick="document.forms['logoutForm'].submit()">
                        Logout
                    </a>
                </li>
            </c:if>
            <c:if test="${currentUser == null}">
                <li>
                    <button  type="button"  onclick="myOrder()">My Order</button>
                </li>
                <li >
                    <a  href="/">Reviews</a>
                </li>
                <li >
                    <a  href="/">Contact</a>
                </li>
                <li >
                    <a  href="/login">Login</a>
                </li>
            </c:if>

        </ul>
    
 <a href="/">Table <input type="number" id="changeTableNumber" readonly /></a>  
</nav>




