<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Sign Up - Splitwise</title>
<link href="webjars/bootstrap/4.5.0/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>

	<div class="container">
		<p>
			<font color="red">${errorMessage}</font>
		</p>
		<form action="/signUp" method="post">
			Name : <input name="name" type="text" /> email : <input name="email"
				type="text" /> Password : <input name="password" type="password" />
			Confirm Password : <input name="confirmPassword" type="password" />
			<input type="submit" value="Sign Up" />
		</form>
	</div>
	<script src="webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>
	<script src="webjars/jquery/3.5.1/jquery.min.js"></script>

</body>
</html>