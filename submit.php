<?php
require('stripeconfig.php');
include "dbconnect.php";

if (isset($_POST['stripeToken'])) {
    \Stripe\Stripe::setVerifySslCerts(false);

    $orderId = $_POST['order_id'];

    $sql = "SELECT * FROM `ordertracking` WHERE `order_id` = $orderId";
    $result = mysqli_query($conn, $sql);

    if ($result && mysqli_num_rows($result) > 0) {
        $orderData = mysqli_fetch_assoc($result);

        // Extract order details
        $totalPrice = $orderData['total_price'] * 100; 
        $currency = "inr";
        $token = $_POST['stripeToken'];

        try {
            $charge = \Stripe\Charge::create([
                'amount' => $totalPrice,
                'currency' => $currency,
                'description' => "Payment for Order ID: $orderId",
                'source' => $token,
            ]);

            if ($charge->status == 'succeeded') {
                mysqli_query($conn, "UPDATE `ordertracking` SET `status` = 'delivered', `payment` = 'paid' WHERE `order_id` = $orderId");
               header("Location:indexhome.php");
            } else {
                echo "Payment failed. Please try again later.";
            }
        } catch (Exception $e) {
            echo "Error: " . $e->getMessage();
        }
    } else {
        echo "Error: Order not found.";
    }
} else {
    echo "Error: Stripe token not provided.";
}

mysqli_close($conn);
?>
