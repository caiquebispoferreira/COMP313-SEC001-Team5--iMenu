<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
          integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
          crossorigin="anonymous">
<style>
    html,
    body {
        height: 100%;
    }

    body {
        display: -ms-flexbox;
        display: flex;
        -ms-flex-align: center;
        align-items: center;
        padding-top: 40px;
        padding-bottom: 40px;
        background-color: #f5f5f5;
    }

    .form-signin {
        width: 100%;
        max-width: 330px;
        padding: 15px;
        margin: auto;
    }
    .form-signin .checkbox {
        font-weight: 400;
    }
    .form-signin .form-control {
        position: relative;
        box-sizing: border-box;
        height: auto;
        padding: 10px;
        font-size: 16px;
    }
    .form-signin .form-control:focus {
        z-index: 2;
    }
    .form-signin input[type="email"] {
        margin-bottom: -1px;
        border-bottom-right-radius: 0;
        border-bottom-left-radius: 0;
    }
    .form-signin input[type="password"] {
        margin-bottom: 10px;
        border-top-left-radius: 0;
        border-top-right-radius: 0;
    }
</style>
</head>
<body class="text-center">

    <form class="form-signin" method="POST" action="${contextPath}/login">
        <%--        Label     --%>
        <h1 class="h3 mb-3 font-weight-normal">Please sign in</h1>
        <%--        username     --%>
        <label for="username" class="sr-only">Username</label>
        <input type="text" id="username" name="username" class="form-control" placeholder="Username" required autofocus>
        <%--            Password--%>
        <label for="password" class="sr-only">Password</label>
        <input type="password" id="password" name="password" class="form-control" placeholder="Password" required>
        <%--            Button submit--%>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
        <a class="btn btn-lg btn-primary btn-block" href="/" >Back to home</a>
    </form>


</div>
=======

</head>
<body class="container">
    <br />
    <form method="POST" action="${contextPath}/login">

        <div class="form-label-group">
            <div class="text-center mb-4">
                <a href="/" >Home</a><br>
                <h1 class="h3 mb-3 font-weight-normal">Log In</h1>
            </div>
            <div class="form-label-group">
                <label for="username">Username</label>
                <input id="username" name="username" type="text"
                       class="form-control" aria-describedby="username"
                       placeholder="Username" required>
            </div>
        </div>

        <div class="form-label-group">
            <label for="password">Password</label>
            <input id="password" name="password"  type="password"
                   class="form-control"
                   placeholder="Password" required>
        </div>
        <div class="row">
            <div class="col-md-6">
                <button type="submit" class="btn btn-lg btn-primary btn-block">Submit</button>
            </div>
        </div>
    </form>

</div>
</body>
<script src="https://ajax.aspnetcdn.com/ajax/jquery/jquery-3.3.1.min.js"
        asp-fallback-src="~/lib/jquery/dist/jquery.min.js"
        asp-fallback-test="window.jQuery"
        crossorigin="anonymous"
        integrity="sha384-tsQFqpEReu7ZLhBV2VZlAu7zcOV+rXbYlF2cqB8txI/8aZajjp4Bqd+V6D5IgvKT">
</script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"
        asp-fallback-src="~/lib/bootstrap/dist/js/bootstrap.min.js"
        asp-fallback-test="window.jQuery && window.jQuery.fn && window.jQuery.fn.modal"
        crossorigin="anonymous"
        integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd">
</script>
</html>
