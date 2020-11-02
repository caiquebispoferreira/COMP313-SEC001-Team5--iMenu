<%--
  Created by IntelliJ IDEA.
  User: sergi
  Date: 21/10/20
  Time: 1:39 p.m.
  To change this template use File | Settings | File Templates.
--%>
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
                    <label for="username">Username</label>
                    <c:if test="${readonly}">
                        <input id="username" type="text" name="username"  value="${object.username}"
                               placeholder="Please enter your username" class="form-control" readonly>
                    </c:if>
                    <c:if test="${!readonly}">
                        <input id="username" type="text" name="username"  value="${object.username}"
                               placeholder="Please enter your username" class="form-control">
                    </c:if>
                </div>
                <div class="mb-3">
                    <label for="password">Password</label>
                    <c:if test="${readonly}">
                        <input  id="password" type="text" name="password" value="${object.password}"
                                 placeholder="Please enter your password" class="form-control" readonly>
                    </c:if>
                    <c:if test="${!readonly}">
                        <input  id="password" type="text" name="password" value="${object.password}"
                                 placeholder="Please enter your password" class="form-control">
                    </c:if>
                </div>
                <div class="mb-3">
                    <label for="role">Role</label>
                    <c:if test="${readonly}">
                        <input id="role" type="number" name="role" value="${object.role}" readonly
                                placeholder="Please enter your role" class="form-control">
                    </c:if>
                    <c:if test="${!readonly}">
                        <input id="role" type="number" name="role" value="${object.role}"
                               placeholder="Please enter your role" class="form-control">
                    </c:if>

                </div>
                <div class="mb-3">
                    <label for="name">Password</label>
                    <c:if test="${readonly}">
                        <input  id="name" type="text" name="name" value="${object.name}"
                                 placeholder="Please enter your name" class="form-control" readonly>
                    </c:if>
                    <c:if test="${!readonly}">
                        <input  id="name" type="text" name="name" value="${object.password}"
                                 placeholder="Please enter your name" class="form-control">
                    </c:if>
                </div>
               
               <hr class="mb-4">
                <button class="btn btn-primary btn-lg btn-block" type="submit">Submit</button>
        </form>
    </div>
</div>
