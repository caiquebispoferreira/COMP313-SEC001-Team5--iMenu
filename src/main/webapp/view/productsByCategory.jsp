<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div class="row">
    <c:forEach items="${object}" var="item">
        <div class="col-md-4">
            <div class="card" style="width: 18rem;">
                <c:if test="${item.hasImage}">
                    <img src="${contextPath}/resources/img/${item.id}.png" class="card-img-top" alt="...">
                </c:if>
                <c:if test="${!item.hasImage}">
                    <img src="${contextPath}/resources/img/noimage.png" class="card-img-top" alt="...">
                </c:if>
                <div class="card-body">
                    <h5 class="card-title">${item.name} - $${item.unitPrice}</h5>
                    <p class="card-text">${item.description}</p>
                    <button  onclick="addItemToMyOrder(${item.id},1)">Add to MyOrder</button>
                </div>
            </div>
        </div>
    </c:forEach>
</div>


