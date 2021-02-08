<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />



<br />
<br />
<br />
<br />
<br />
<br />

<input id="name" type="text" name="name"  value="${object.name}"
                             class="form-control" readonly>

<div class="row">
    <div class="col-12">
        <table class="table">
            <thead>
            <tr>
                <th scope="col">Username</th>
                <th scope="col">Rating</th>
                <th scope="col">Notes</th>
         
            </tr>
            </thead>
            <tbody>
                <c:forEach items="${object.reviews}" var="item">
                    <tr>
                        <th scope="row">${item.userName}</th>
                        <td>${item.rating}</td>
                        <td>${item.notes}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

