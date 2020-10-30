<%--
  Created by IntelliJ IDEA.
  User: sergi
  Date: 21/10/20
  Time: 1:39 p.m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div class="row">
    <div class="col-md-9 order-md-2">
        <form action="${action}" method="post">
   <!--        <input type="hidden" name="id" value="${object.id}"/>-->   
                <div class="mb-3">
<label for="fname">Username</label>
<input type="text" id="fname" name="firstname" placeholder="Please enter your username">
                </div>
                <div class="mb-3">
<label for="lname">Password</label>
<input type="text" id="lname" name="lastname" placeholder="Please enter the password">
                </div>
                <div class="mb-3">
 <label for="fname">Role</label>
  <input type="text" id="fname" name="firstname" placeholder="Please enter your role">
                </div>
                <div class="mb-3">
 <label for="fname">Name</label>
  <input type="text" id="fname" name="firstname" placeholder="Please enter your name">
                </div>

               <hr class="mb-4">
                <button class="btn btn-primary btn-lg btn-block" type="submit">Submit</button>
        </form>
    </div>
</div>

