<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div class="row">
    <a href="/addUser">Add</a>
</div>
<div class="row">
    <div class="col-12">
        <table class="table">
            <thead>
            <tr>
                <th scope="col">User name</th>
                <th scope="col">Password</th>
                <th scope="col">Role</th>
                <th scope="col">Name</th>
                 <th scope="col">Picture URL</th>
                <th scope="col">#</th>
                <th scope="col">#</th>
             
            </tr>
            </thead>
            <tbody>

            </tbody>
        </table>
    </div>
</div>
