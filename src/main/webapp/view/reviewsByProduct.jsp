<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${contextPath}/resources/css/style.css" />



<br />
<br />
<br />
<br />
<br />
<br />



<div class="row">
	<div class="col-12">
		<h3>Product name: ${object.name} - ${object.rating}/5</h3>
	</div>
	<div class="col-md-4">
		<c:if test="${object.hasImage}">
			<img src="${contextPath}/resources/img/${object.name}.png" width="286" height="385"
				class="card-img-top" alt="...">
		</c:if>
		<c:if test="${!object.hasImage}">
			<img src="${contextPath}/resources/img/noimage.png" width="286" height="385"
				class="card-img-top" alt="...">
		</c:if>
	</div>

</div>



<div class="row">
	<c:forEach items="${object.reviews}" var="item">
          <div class="col-md-4">
            <h2>${item.userName}</h2>
            <p>Rating:${item.rating}/5</p>
            <p>${item.notes}</p>
          </div>
   </c:forEach>
</div>

<div>
	<a class="btn btn-light" href="/index" style=margin-left:80%;padding:0px>Back to Home Page?</a>
</div>