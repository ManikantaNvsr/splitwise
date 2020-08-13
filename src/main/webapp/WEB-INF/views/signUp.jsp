<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Sign Up - Splitwise</title>
    <link href="webjars/bootstrap/4.5.0/css/bootstrap.min.css"
          rel="stylesheet">
</head>
<body>

<div class="container">

    <h2>Sign Up to Manager your bills!</h2>

    <p>
        <span style="color: red; ">${errorMessage}</span>
    </p>
    <form action="/signUp" method="post">
        <label>Name</label><br>
        <input name="name" type="text" required="required"/><br>
        <label>Email Address</label><br>
        <input name="email" type="email" required="required"/><br>
        <label>Password</label><br>
        <input name="password" type="password" required="required"/><br>
        <label>Confirm Password</label><br>
        <input name="confirmPassword" type="password" required="required"/><br><br>
        <input class="btn btn-success" type="submit" value="Sign Up"/>
    </form>
</div>
<script src="webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script src="webjars/jquery/3.5.1/jquery.min.js"></script>

</body>
</html>
