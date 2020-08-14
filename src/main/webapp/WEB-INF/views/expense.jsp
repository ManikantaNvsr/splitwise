<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Welcome - Splitwise</title>
    <link href="webjars/bootstrap/4.5.0/css/bootstrap.min.css"
          rel="stylesheet">
</head>
<body>
<div class="container">
    <h3>Add an expense</h3>

    <form action="/add-expense" method="post">
        <input type="text" name="description" required="required"/> <input type="submit"
                                                       value="add">
    </form>
</div>
<script src="webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script src="webjars/jquery/3.5.1/jquery.min.js"></script>
</body>
</html>
