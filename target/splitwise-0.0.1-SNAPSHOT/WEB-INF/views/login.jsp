<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Login - Splitwise</title>
    <link href="webjars/bootstrap/4.5.0/css/bootstrap.min.css"
          rel="stylesheet">
</head>
<body>

<div class="container">

    </br> </br> </br>


    <h2>Welcome to Splitwise!</h2>

    <h2>Login to Manager your bills.</h2>

    <p>
        <font color="red">${errorMessage}</font>
    </p>
    <form action="/login" method="post">
        <label>Email Address</label><br>
        <input name="email" type="email" required="required"/><br>
        <label>Password</label><br>
        <input name="password" type="password" required="required"/><br><br>
        <input class="btn btn-warning" type="submit" value="Sign In"/>
        <a class="btn btn-success" href="/signUp">Sign Up</a>


    </form>


</div>
<script src="webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script src="webjars/jquery/3.5.1/jquery.min.js"></script>

</body>
</html>
