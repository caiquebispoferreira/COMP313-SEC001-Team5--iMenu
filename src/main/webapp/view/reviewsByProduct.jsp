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



<!-- <div class="row">
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
</div>-->

<!-- <input id="name" type="text" name="name"  value="${object.name}"
                             class="form-control" readonly>-->
<div class="row">
          <div class="col-md-4">
            <h2>Customer 1</h2>
            <p>Rating:3.5/5</p>
            <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
            
          </div>
          <div class="col-md-4">
            <h2>Customer 2</h2>
            <p>Rating:3.5/5</p>
            <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
          </div>
          <div class="col-md-4">
            <h2>Customer 3</h2>
            <p>Rating:3.5/5</p>
            <p>Donec sed odio dui. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
          </div>
        </div>




<div>
	<a class="btn btn-light" href="/index" style=margin-left:80%;padding:0px>Back to Home Page?</a>
</div>