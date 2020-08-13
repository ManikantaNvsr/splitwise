<html>
<head>
<title>Sign Up - Splitwise</title>
</head>
<body>

	<p>
		<font color="red">${errorMessage}</font>
	</p>
	<form action="/signUp" method="post">
		Name : <input name="name" type="text" />
		email : <input name="email" type="text" />
		Password : <input name="password" type="password" />
		Confirm Password : <input name="confirmPassword" type="password" />
		 <input type="submit" />
	</form>

</body>
</html>