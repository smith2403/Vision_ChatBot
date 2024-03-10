<?php
require('stripeconfig.php');

// Fetch order tracking data from the database
include "dbconnect.php";
$sql = "SELECT * FROM `ordertracking`";
$result = mysqli_query($conn, $sql);

// Display the order tracking table
if (mysqli_num_rows($result) > 0) {
    echo "<div class='container-fluid'>
        <div class='table-responsive'>
            <table class='table table-primary'>
                <thead>
                    <tr>
                        <th scope='col'>Order ID</th>
                        <th scope='col'>Status</th>
                        <th scope='col'>Payment Details</th>
                        <th scope='col'>Amount</th>
                        <th scope='col'>Action</th>
                    </tr>
                </thead>";

    while ($rows = mysqli_fetch_assoc($result)) {
        echo "
        <tbody>
            <tr class=''>
                <td scope='row'>{$rows['order_id']}</td>
                <td>{$rows['status']}</td>
                <td>{$rows['payment']}</td>
                <td>{$rows['total_price']}</td>
                <td>
                    <form action='submit.php' method='post'>
                        <script
                            src='https://checkout.stripe.com/checkout.js' class='stripe-button'
                            data-key='{$publishableKey}'
                            data-amount='{$rows['total_price']}' // Use the dynamic amount here
                            data-name='FOOD CHATBOT'
                            data-description='Bhuk lagi hai'
                            data-image='https://seeklogo.com/images/D/dialogflow-logo-534FF34238-seeklogo.com.png'
                            data-currency='inr'
                            data-email='iamsmith1103@gmail.com'>
                        </script>
                    </form>
                </td>
            </tr>
        </tbody>";
    }

    echo "</table></div></div>";
} else {
    echo "Something went wrong" . mysqli_error();
}

mysqli_close($conn);
?>


<!DOCTYPE html>
<html lang="en">

<head>
    <title>Title</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS v5.2.1 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>

<body>
    <header>
        <!-- place navbar here -->
    </header>
    <main>
        <!-- Your main content goes here -->
    </main>
    <footer>
        <!-- place footer here -->
    </footer>

    <!-- Bootstrap JavaScript Libraries -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
        integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
        crossorigin="anonymous"></script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
        integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
        crossorigin="anonymous"></script>
</body>

</html>
