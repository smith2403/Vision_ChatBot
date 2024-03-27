<?php
require('stripeconfig.php');
include "dbconnect.php";

if (isset($_POST['stripeToken'])) {
    \Stripe\Stripe::setVerifySslCerts(false);

    // Get the order ID from the POST data
    $orderId = $_POST['order_id'];

    // Fetch order tracking data from the database for the specific order
    $sql = "SELECT * FROM `ordertracking` WHERE `order_id` = $orderId";
    $result = mysqli_query($conn, $sql);

    if ($result && mysqli_num_rows($result) > 0) {
        // Assuming only one row is returned for the order
        $orderData = mysqli_fetch_assoc($result);

        // Extract order details
        $totalPrice = $orderData['total_price'] * 100; // Convert to cents
        $currency = "inr";
        $token = $_POST['stripeToken'];

        try {
            // Create a charge using Stripe API
            $charge = \Stripe\Charge::create([
                'amount' => $totalPrice,
                'currency' => $currency,
                'description' => "Payment for Order ID: $orderId",
                'source' => $token,
            ]);

            // Check if charge is successful
            if ($charge->status == 'succeeded') {
                // Update payment status in the database
                mysqli_query($conn, "UPDATE `ordertracking` SET `status` = 'delivered', `payment` = 'paid' WHERE `order_id` = $orderId");
                
                // Output success message
               header("Location:indexhome.php");
            } else {
                echo "Payment failed. Please try again later.";
            }
        } catch (Exception $e) {
            // Handle Stripe API errors
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
