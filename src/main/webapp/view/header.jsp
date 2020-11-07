<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<form id="logoutForm" method="post" action="/logout">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
</form>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#">Navbar</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="/">Home</a>
            </li>
            <c:if test="${currentUser != null}">
                <c:if test="${currentUser.role == 'ADMINISTRATOR'}">
                    <li class="nav-item">
                        <a class="nav-link" href="/listUser">List of Users</a>
                    </li>
                </c:if>
                <li class="nav-item">
                    <a class="nav-link" href="/listProduct">List of Products</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/listOrder">List of Orders</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/listOrderByTableNumber">List Order By Table Number</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/changeTableNumber">Change Table Number</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" onclick="document.forms['logoutForm'].submit()">
                        Logout
                    </a>
                </li>
            </c:if>
            <c:if test="${currentUser == null}">
                <li class="nav-item">
                    <button type="button" class="nav-link" onclick="myOrder()">My Order</button>
                </li>
            </c:if>

        </ul>
    </div>
</nav>




