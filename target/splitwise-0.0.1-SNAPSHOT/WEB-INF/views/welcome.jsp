<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Welcome - Splitwise</title>
    <link href="webjars/bootstrap/4.5.0/css/bootstrap.min.css"
          rel="stylesheet">

    <%--    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"--%>
    <%--          integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">--%>


</head>
<body>

<div class="container">

    <div style="background-color:#48be9d; height:100px;" class="jumbotron">
        <h4>${name}'s Dashboard</h4>
        <a class="btn btn-warning float-right" href="/logout">Logout</a>
    </div>
    </br>
    <!-- <p>You can start adding your expenses.</p> -->
    <div class="text-center">
        <%--        <a class="btn btn-warning" href="/add-expense">Add an expense</a>--%>
        <%--        <a class="btn btn-primary" href="/add-friend">Add your friend</a>--%>

        <button class="btn btn-warning" id="addFriendButton" data-toggle="modal" data-target="#friendModal">Add your
            friend
        </button>
        <button class="btn btn-warning" id="addExpenseButton" data-toggle="modal" data-target="#expenseModal">Add an
            expense
        </button>

        <!-- Add an Expense Modal -->
        <div class="modal" id="expenseModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <H5 class="modal-title">Add an Expense</H5>
                        <button class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">

                        <label>Amount</label><br>
                        <input type="text" id="amount" name="amount" required="required"/><br><br>

                        <div>
                            <label>Share With</label><br>
                            <input type="text" id="emailInput" placeholder="Friends Email...">
                            <span id="emailAdd" class="btn btn-secondary">Add</span>
                        </div>

                        <ul id="myUL" style="list-style-type: none">
                        </ul>

                        <button class="btn btn-success" id="addExpense">Add Expense</button>

                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Add your Friend Modal-->
        <div class="modal" id="friendModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <H5 class="modal-title">Add Your Friend</H5>
                        <button class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        <%--<p>
                            <span style="color: red; ">${errorMessage}</span>
                        </p>--%>
                        <%--                        <form>--%>
                        <label>Friend's Registered Email Address</label><br>
                        <input type="email" id="friendEmail" name="friendEmail" required="required"/><br><br>
                        <%--                        </form>--%>
                        <button class="btn btn-success" id="addFriend">Add</button>

                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>


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


<%--<script src="https://code.jquery.com/jquery-3.5.1.min.js"--%>
<%--        integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>--%>
<%--<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"--%>
<%--        integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"--%>
<%--        crossorigin="anonymous"></script>--%>
<%--<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"--%>
<%--        integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"--%>
<%--        crossorigin="anonymous"></script>--%>

<script src="webjars/jquery/3.5.1/jquery.min.js"></script>
<script src="webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>

<script type="text/javascript">

    $("#addFriend").click(function () {

        $.ajax({
            type: "POST",
            url: "/add-friend",
            data: {
                friendEmail: $("#friendEmail").val()
            },
            success: function (data) {
                alert(data);
            }
        });

    });


    // Create a new list item when clicking on the "Add" button
    $("#emailAdd").click(function () {
        var liNode = document.createElement("li");
        var inputEmail = document.getElementById("emailInput").value;
        var textNode = document.createTextNode(inputEmail);
        liNode.className = "emails";
        liNode.appendChild(textNode);
        if (inputEmail === '') {
            alert("You must enter a friends email to add expense!");
        } else {
            document.getElementById("myUL").appendChild(liNode);
        }

        document.getElementById("emailInput").value = "";
        var spanNode = document.createElement("SPAN");
        var closeSymbol = document.createTextNode("\u00D7");
        spanNode.className = "close";
        spanNode.appendChild(closeSymbol);
        liNode.appendChild(spanNode);

        var close = document.getElementsByClassName("close");

        for (let i = 0; i < close.length; i++) {
            close[i].onclick = function () {
                var div = this.parentElement.parentNode;
                div.removeChild(this.parentElement);
            }
        }
    });

    $("#addExpense").click(function () {
        var amount = document.getElementById("amount");
        var emails = new Array();
        var emailList = document.getElementsByClassName("emails");
        for (let i = 0; i < emailList.length; i++) {
            let val = emailList[i].innerText;
            emails.push(val.substring(0, val.length-1));
        }
        console.log(emails)
    });

</script>

</body>
</html>
