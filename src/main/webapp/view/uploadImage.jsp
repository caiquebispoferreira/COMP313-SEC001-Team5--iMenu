<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${contextPath}/resources/css/style.css" />
<style>


.form-control{
 color:white;

}
</style>
<div class="row addUser">
    <div class="col-md-9 order-md-2">
        <form enctype="multipart/form-data" action="/uploadImage" method="post">
            <div class="mb-3">
                <input type="hidden" name="productId"  value="${object.id}"/>
                <!-- <label for="image">Image</label> -->
                <h3>Upload Product Image</h3>
                    <input id="image" type="file" accept=".png" name="image"
                            class="form-control">
            </div>
            <!-- <button class="btn btn-primary btn-lg btn-block" type="submit">Submit</button>-->
            <button class="btn btn-light addUserBtn" type="submit">Submit</button>
        </form>
    </div>
</div>
