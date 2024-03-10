<?php
session_start();

// Check if the session ID is set
    // Destroy the session
    session_unset();
    session_destroy();

header("Location:indexhome.php");
// Include your HTML content and other scripts here
?>
