<%--
  Created by IntelliJ IDEA.
  User: sergi
  Date: 21/10/20
  Time: 1:31 p.m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<form method="POST" action="${contextPath}/login"
      class="form-signin">
    <!--  					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>-->
    <div class="form-group ${error != null ? 'has-error' : ''}">
        <input name="username" type="text" class="form-control"
               placeholder="Username" autofocus="true" />
    </div>
    <div class="form-group ${error != null ? 'has-error' : ''}">
        <input name="password" type="password" class="form-control" placeholder="Password"/>
    </div>
    <div class="form-group row login-tools">
        <div class="col-xs-12 login-forgot-password">
            <a href="#">Esqueceu sua senha?</a>
        </div>
    </div>
    <div class="form-group login-submit">
        <button data-dismiss="modal" type="submit"
                class="btn btn-primary btn-xl">Entrar</button>
    </div>
</form>

</body>
</html>
