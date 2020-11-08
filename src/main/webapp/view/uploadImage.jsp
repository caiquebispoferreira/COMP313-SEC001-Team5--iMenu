<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div class="row">
    <div class="col-md-9 order-md-2">
        <form enctype="multipart/form-data" action="/uploadImage" method="post">
            <div class="mb-3">
                <input type="hidden" name="productId"  />
                <label for="image">Image</label>
                    <input id="image" type="file" accept=".png" name="image"
                           value="${object.pictureUrl}" class="form-control">
            </div>
            <button class="btn btn-primary btn-lg btn-block" type="submit">Submit</button>
        </form>
    </div>
</div>
