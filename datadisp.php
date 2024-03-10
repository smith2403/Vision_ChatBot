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
?>

<!doctype html>
<html lang="en">
    <head>
        <title>Payment</title>
        <!-- Required meta tags -->
        <meta charset="utf-8" />
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1, shrink-to-fit=no"
        />
        <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
        integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
        <!-- Bootstrap CSS v5.2.1 -->
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
            crossorigin="anonymous"
        />
    </head>

    <body>
        <header>
            <!-- place navbar here -->
        </header>
        <main>
            <?php
        // Display the order tracking cards
if (mysqli_num_rows($result) > 0) {
    echo "<div class='container-fluid'>
    <div class='row justify-content-center align-items-center' style='height: 100vh;'>"; // Center the cards

while ($rows = mysqli_fetch_assoc($result)) {
    echo "
    <div class='col-md-4 mb-4'>
        <div class='card' style='width: 300px; height: 350px; border-radius: 20px; border: 2px solid #333;'>
            <div class='card-body d-flex flex-column justify-content-center'>
                <center>
                    <h5 class='card-title' style='font-size: 24px; font-family: Arial, sans-serif; margin-bottom: 10px;'>Order ID: {$rows['order_id']}</h5>
                    <p class='card-text' style='font-size: 20px; font-family: Arial, sans-serif; margin-bottom: 8px;'>Status: {$rows['status']}</p>
                    <p class='card-text' style='font-size: 20px; font-family: Arial, sans-serif; margin-bottom: 8px;'>Payment: {$rows['payment']}</p>
                    <p class='card-text' style='font-size: 20px; font-family: Arial, sans-serif; margin-bottom: 8px;'>Total Price: {$rows['total_price']}</p>
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
                </center>
            </div>
        </div>
    </div>";
    }

    echo "</table></div></div>";
} else {
    echo "No orders found for the logged-in user";
    echo $userId;
}

mysqli_close($conn);
?>
        </main>
        <footer>
        <footer>
        <div class="sec1">
            <div class="main-footer">
                <div class="foot1">
                    <h6>Company</h6>
                    <nav>
                        <a href="#">
                            <p>FAQ</p>
                        </a>
                        <a href="#">
                            <p>Blog</p>
                        </a>
                        <a href="#">
                            <p>Work With Us</p>
                        </a>
                        <a href="#">
                            <p>About</p>
                        </a>
                        <a href="#">
                            <p>Careers</p>
                        </a>
                    </nav>
                </div>
                <div class="foot2">
                    <h6>HELP & CONTACT</h6>
                    <nav>
                        <a href="#">
                            <p>Help Center</p>
                        </a>
                        <a href="#">
                            <p>Email Us</p>
                        </a>
                        <a href="#">
                            <p>Call 080-4242-4242</p>
                        </a>
                    </nav>
                </div>
                <div class="foot4">
                    <h6>LEARN MORE</h6>
                    <nav>
                        <a href="#">
                            <p>Privacy</p>
                        </a>
                        <a href="#">
                            <p>Security</p>
                        </a>
                        <a href="#">
                            <p>Terms</p>
                        </a>
                        <a href="#">
                            <p>Sitemap</p>
                        </a>
                    </nav>
                </div>
                <div class="foot5">
                    <h6>SOCIAL LINKS</h6>
                    <div class="icons">
                        <a href="#"><i class="fa-brands fa-linkedin" style="color: #000000;"></i></a>
                        <a href="#"><i class="fa-brands fa-instagram" style="color: #000000;"></i></a>
                        <a href="#"><i class="fa-brands fa-github" style="color: #000000;"></i></a>
                        <a href="#"><i class="fa-brands fa-facebook" style="color: #000000;"></i></a>
                    </div>
                </div>
            </div>
            <hr class="h-line">
            <p class="copyright">© Vision™ Ltd. All rights reserved.</p>
        </div>
    </footer>
        </footer>
        <!-- Bootstrap JavaScript Libraries -->
        <script
            src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
            integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
            crossorigin="anonymous"
        ></script>

        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
            integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
            crossorigin="anonymous"
        ></script>
    </body>
</html>

