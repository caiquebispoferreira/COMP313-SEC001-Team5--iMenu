<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
</head>
<body>
<div class="container text-center">
    <center><h1 style="color:orange;">Login</h1></center>
    <br><br>
    <center>
        <div class="container  bg-dark">

            <form method="POST" action="${contextPath}/login"
                  class="form-signin">
                <!--  					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>-->

                <div class="form-group ${error != null ? 'has-error' : ''}">
                    Username:<input name="username" type="text" class="form-control"
                                    placeholder="Username" autofocus="true"/>
                </div>
                <br>


                <div class="form-group ${error != null ? 'has-error' : ''}">
                    Password:<input name="password" type="password" class="form-control" placeholder="Password"/>

                </div>
                <br>
                <div class="form-group login-submit text-center">
                    <button data-dismiss="modal" type="submit"
                            class="btn btn-success">Submit
                    </button>
                </div>
                -

            </form>
        </div>
    </center>
</div>
</body>
</html>
