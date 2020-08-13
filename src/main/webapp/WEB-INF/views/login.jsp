<html>
<head>
<title>Login - Splitwise</title>
</head>
<body>

	<p>
		<font color="red">${errorMessage}</font>
	</p>
	<form action="/login" method="post">
		Email : <input name="email" type="text" />
		Password : <input name="password" type="password" />
		<input type="submit" value="Sign In" />
	</form>

	<a href="/signUp">Sign Up</a>

</body>
</html>