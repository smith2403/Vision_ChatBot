<?php
require('stripeconfig.php');
include "dbconnect.php";

// Fetch order tracking data from the database
$sql = "SELECT * FROM `ordertracking`";
$result = mysqli_query($conn, $sql);

if ($result) {
    if (isset($_POST['stripeToken'])) {
        \Stripe\Stripe::setVerifySslCerts(false);

        // Assuming you have a loop fetching data from the database
        while ($rows = mysqli_fetch_assoc($result)) {
            $token = $_POST['stripeToken'];

            $amount_in_paise = $rows['total_price'] * 100; // Convert rupees to paise
            $amount_in_paise = intval($amount_in_paise); // Ensure it's an integer

            try {
                $data = \Stripe\Charge::create(array(
                    "amount" => $amount_in_paise,
                    "currency" => "inr",
                    "description" => "Programming with Vishal Desc",
                    "source" => $token,
                ));

                // Update payment status in the database after a successful payment
                if ($data->status == 'succeeded') {
                    $orderId = $rows['order_id'];
                    mysqli_query($conn, "UPDATE `ordertracking` SET `payment` = 'paid' WHERE `order_id` = $orderId");
                }

                echo "<pre>";
                print_r($data);
            } catch (Stripe\Error\InvalidRequest $e) {
                echo "Error: " . $e->getMessage();
            }
        }
    }
} else {
    echo "Error: " . mysqli_error($conn);
}

mysqli_close($conn);
?>
