<?php
require('stripe-php-master/init.php');

$publishableKey="pk_test_51Org2PP7Jy2eIHLzDaIGP3mrO7kHrRAF3cTUPYgn1aJ8SQjRNeKk9R6AVNFtVNbLnOfZkc4IBw93kwuqmGjyxhD8004ps4jiNc";

$secretKey="sk_test_51Org2PP7Jy2eIHLzPANNe1MMOCWdxQydBg4ySd5o9XvI7Fkb1MUTBUBe3HPLt1apS6EAF5szKRPILiKTV5Sd8nMm00ydKlgp1r";

\Stripe\Stripe::setApiKey($secretKey);
?>