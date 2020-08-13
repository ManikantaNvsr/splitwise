<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>Welcome - Splitwise</title>
<link href="webjars/bootstrap/4.5.0/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>

	<div class="container">

		<h5>${name}'sDashboard</h5>
		</br>
		<p>You can start adding your expenses.</p>
		<div>
			<a class="btn btn-warning" href="/add-expense">Add an expense</a>
		</div>
		<div>
			<a class="btn btn-primary" href="/add-friend">Add your friend</a>
		</div>
		</br> </br>
		<table class="table <!-- table-striped -->">
			<tr>
				<td>total balance</td>
				<td>you owe</td>
				<td>you are owed</td>
			</tr>
		</table>

		<h2>You Owe</h2>
		<!-- Iterate Debts -->

		<h2>you are owed</h2>
		<!-- Iterate Credits -->

		<table>
			<caption>Recent Transactions</caption>
		</table>
		<!-- Iterate Transactions here -->

	</div>
	<script src="webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>
	<script src="webjars/jquery/3.5.1/jquery.min.js"></script>


</body>
</html>