
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div class="row">
    <div class="col-md-9 order-md-2">
        <form action="${action}" method="post">
            <input type="hidden" name="id" value="${object.id}"/>
                <div class="mb-3">
                    <label for="name">Product Name</label>
                    <c:if test="${readonly}">
                        <input id="name" type="text" name="name"  value="${object.name}"
                               placeholder="Please enter the product name" class="form-control" readonly>
                    </c:if>
                    <c:if test="${!readonly}">
                        <input id="name" type="text" name="name"  value="${object.name}"
                               placeholder="Please enter the product name" class="form-control">
                    </c:if>
                </div>
                <div class="mb-3">
                    <label for="description">Description</label>
                    <c:if test="${readonly}">
                        <input  id="description" type="text" name="description" value="${object.description}"
                                 placeholder="Please describe" class="form-control" readonly>
                    </c:if>
                    <c:if test="${!readonly}">
                        <input  id="description" type="text" name="description" value="${object.description}"
                                 placeholder="Please describe" class="form-control">
                    </c:if>
                </div>
                <div class="mb-3">
                    <label for="unitPrice">Unit Price</label>
                    <c:if test="${readonly}">
                        <input id="unitPrice" type="number" name="unitPrice" value="${object.unitPrice}" readonly
                                placeholder="Please enter the unit price" class="form-control">
                    </c:if>
                    <c:if test="${!readonly}">
                        <input id="unitPrice" type="number" name="unitPrice" value="${object.unitPrice}"
                               placeholder="Please enter the unit price" class="form-control">
                    </c:if>

                </div>
                <div class="mb-3">
                    <label name="category">Category</label>
                    <select name="category" class="custom-select d-block w-100" required ${readonly ? 'disabled' : ''}>
                        <option value="">Select an option</option>
                        <option value="APPETIZERS" ${object.category == 'APPETIZERS' ? 'selected' : ''}>Appetizers</option>
                        <option value="BEVERAGE" ${object.category == 'BEVERAGE' ? 'selected' : ''}>Beverages</option>
                        <option value="MAIN_COURSE" ${object.category == 'MAIN_COURSE' ? 'selected' : ''}>Main Course</option>
                    </select>
                </div>
                <div class="mb-3">
                    <label name="enabled">Enabled</label>
                    <select name="enabled" class="custom-select d-block w-100" required ${readonly ? 'disabled' : ''}>
                        <option value="true" ${object.enabled? 'selected' : ''}>True</option>
                        <option value="false" ${!object.enabled ? 'selected' : ''}>False</option>
                     </select>
                </div>
                <div class="mb-3">
                    <label for="pictureUrl">Picture Url</label>
                    <c:if test="${readonly}">
                        <input id="pictureUrl" type="text" name="pictureUrl" readonly
                               value="${object.pictureUrl}" class="form-control">
                    </c:if>
                    <c:if test="${!readonly}">
                        <input id="pictureUrl" type="text" name="pictureUrl"
                               value="${object.pictureUrl}" class="form-control">
                    </c:if>

                </div>
               <hr class="mb-4">
                <button class="btn btn-primary btn-lg btn-block" type="submit">Submit</button>
        </form>
    </div>
</div>
