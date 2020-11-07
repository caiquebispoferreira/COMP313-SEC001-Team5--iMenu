<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div class="row">
    <div class="col-md-9 order-md-2">
        <form action="${action}" method="post">
            <input type="hidden" name="id" value="${object.id}"/>
                <div class="mb-3">
                    <label for="tableNumber">Table Number</label>
                    <c:if test="${readonly}">
                        <input id="tableNumber" type="text" name="tableNumber"  value="${object.tableNumber}"
                                class="form-control" readonly>
                    </c:if>
                    <c:if test="${!readonly}">
                        <input id="tableNumber" type="text" name="tableNumber"  value="${object.tableNumber}"
                               placeholder="Please enter the table number" class="form-control">
                    </c:if>
                </div>
                
                <div class="mb-3">
                    <label for="date">Date</label>
                    <c:if test="${readonly}">
                        <input  id="date" type="date" name="date" value="${object.date}"
                                 class="form-control" readonly>
                    </c:if>
                    <c:if test="${!readonly}">
                        <input  id="date" type="date" name="date" value="${object.date}"
                                 placeholder="Please enter the order date" class="form-control">
                    </c:if>
                </div>
                
                <div class="mb-3">
                    <label for="totalPrice">Total Price</label>
                    <c:if test="${readonly}">
                        <input id="totalPrice" type="number" name="totalPrice" value="${object.totalPrice}" readonly
  						class="form-control">
                    </c:if>
                    <c:if test="${!readonly}">
                        <input id="totalPrice" type="number" name="totalPrice" value="${object.totalPrice}"
                               placeholder="Please enter the total price" class="form-control">
                    </c:if>

                </div>

	
	  <div class="mb-3">
                    <label for="note">Special Note</label>
                    <c:if test="${readonly}">
                        <input id="note" type="text" name="note" value="${object.note}" readonly
                             class="form-control">
                    </c:if>
                    <c:if test="${!readonly}">
                        <input id="note" type="text" name="note" value="${object.note}"
                               placeholder="Please enter your special note" class="form-control">
                    </c:if>

                </div>
                
                
                
                 <div class="mb-3">
                    <label for="status">Order Status</label>
                    <c:if test="${readonly}">
                        <input id="status" type="text" name="status" value="${object.status}" readonly
                             class="form-control">
                    </c:if>
                    <c:if test="${!readonly}">
                        <input id="status" type="text" name="status" value="${object.status}"
                               placeholder="Please enter the status" class="form-control">
                    </c:if>

                </div>
                
                
  
               <hr class="mb-4">
                <button class="btn btn-primary btn-lg btn-block" type="submit">Submit</button>
        </form>
    </div>
</div>