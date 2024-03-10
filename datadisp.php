<?php
session_start();
require('stripeconfig.php');

include "dbconnect.php";

// Check if the user is logged in
if (!isset($_SESSION["login"]) || !$_SESSION["login"]) {
    // Redirect to login page or handle unauthorized access
    header("Location: login.html");
    exit();
}

// Fetch order tracking data for the logged-in user
// $userId = $_SESSION["user_id"];
// $sql = "SELECT * FROM `ordertracking` WHERE `order_id` = $userId";
// $result = mysqli_query($conn, $sql);

// $sql = "SELECT * FROM `ordertracking`
//         INNER JOIN `users` ON ordertracking.order_id = users.id
//         WHERE users.id = '$userId'";
$userId = $_SESSION["user_id"];

$sql = "SELECT * FROM `users` INNER JOIN `ordertracking` ON users.id = ordertracking.order_id WHERE users.id = '$userId'";
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
    echo "No orders found for the logged-in user";
    echo $userId;
}

mysqli_close($conn);
?>
