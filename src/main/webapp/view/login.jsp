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
    <title>Login</title>
 <style>   
.order{
            width : 600px;
            margin: 5px;
            position: absolute;
                left : 25%;
                top : 10%;
                border-radius: 1px solid black;
            background-color: #DCDCDC;
            float: left;
            opacity: 0.9;
            padding: 60px;}
			form input{
                padding: 9px;
                border: none;
                margin: 4px auto;
                
            }

</style>
</head>
<body>

<div class="order">
<center><h1 style="color:orange;">Login</h1></center><br><br>

    <div class="col-md-9 order-md-2">

      <form method="POST" action="${contextPath}/login"
        class="form-signin">
        <!--  					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>-->
        <div class="form-group ${error != null ? 'has-error' : ''}">
            Username:<input name="username" type="text" class="form-control"
                   placeholder="Username" autofocus="true" />
        </div>
        <div class="form-group ${error != null ? 'has-error' : ''}">
            Password:<input name="password" type="password" class="form-control" placeholder="Password"/>
        </div>
        <div class="form-group row login-tools">
            <div class="col-xs-12 login-forgot-password">
                <a href="#">Forgot password?</a>
            </div>
        </div>
       <center> <div class="form-group login-submit">
            <button data-dismiss="modal" type="submit"
                    class="btn btn-primary btn-lg btn-block">Submit</button>
        </div></center>
      </form>
      </div>
</div>

</body>
</html>
