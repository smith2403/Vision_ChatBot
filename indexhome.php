<?php
session_start();

// Check if the login session is set
if (isset($_SESSION["login"]) && $_SESSION["login"]) {
    $sessionId = "user-session-id";
    $includeMessenger = true;
} else {
    // Default to guest session if not logged in
    $sessionId = "guest-session-id";
    $includeMessenger = false;
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Food Website</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
        integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
    <?php
    if ($includeMessenger) {
        // Include the messenger script if the user is logged in
        ?>
        <script src="https://www.gstatic.com/dialogflow-console/fast/messenger/bootstrap.js?v=1"></script>
    <?php
    }
    ?>
</head>

<body>
    <header>
        <div class="navbar">
            <div class="nav-logo">
                <div class="logo">
                    <h1 style="font-style: oblique;">Cresty</h1>
                </div>
            </div>

            <div class="nav-search">
                <div class="search-food">
                    <h1>Greetings! <em>Desi Delights at Your Doorstep</em></h1>
                </div>
            </div> 
            <div class="user-login">
            <?php
    if (isset($_SESSION["login"]) && $_SESSION["login"]) {
        // User is logged in, display logout button
        echo '<a href="logout.php">Log out</a>';
        echo '<a href="datadisp.php">Payments</a>';
    } else {
        // User is not logged in, display login button
        echo '<a href="login.html">Log in</a>';
    }
    ?>
                <!-- <a href="login.html">Log in</a> -->

                <a href="register.html">Sign up</a>
            </div>
        </div>
    </header>
    <section class="add-sect">
        <div class="add-list">
            <a href="#" class="list-item">Home</a>
            <p>/</p>
            <a href="#" class="list-item">India</a>
            <p>/</p>
            <a href="#" class="list-item">Mumbai</a>
            <p>/</p>
            <a href="#" class="list-item">Central Mumbai</a>
            <p>/</p>
            <a href="#" class="list-item curr-add">Malad West</a>
        </div>
    </section>

    <div class="hero1">
        <div class="main-hero">
            <h3>Inspiration for your first order</h3>
            <section class="carousel">
                <section class="heroFirst">
                    <div class="space">
                        <div class="main-con">
                            <div class="img-hero1">
                                <img src="https://b.zmtcdn.com/data/dish_images/d19a31d42d5913ff129cafd7cec772f81639737697.png"
                                    alt="Biryani Image">
                            </div>
                            <a href="#">
                                <p>Biryani</p>
                            </a>
                        </div>
                    </div>
                </section>
                <section class="heroFirst">
                    <div class="space">
                        <div class="main-con">
                            <div class="img-hero1">
                                <img src="https://b.zmtcdn.com/data/o2_assets/d0bd7c9405ac87f6aa65e31fe55800941632716575.png"
                                    alt="Pizza Image">
                            </div>
                            <a href="#">
                                <p>Pizza</p>
                            </a>
                        </div>
                    </div>
                </section>
                <section class="heroFirst">
                    <div class="space">
                        <div class="main-con">
                            <div class="img-hero1">
                                <img src="https://b.zmtcdn.com/data/dish_images/ccb7dc2ba2b054419f805da7f05704471634886169.png"
                                    alt="Burger Image">
                            </div>
                            <a href="#">
                                <p>Burger</p>
                            </a>
                        </div>
                    </div>
                </section>
                <section class="heroFirst">
                    <div class="space">
                        <div class="main-con">
                            <div class="img-hero1">
                                <img src="https://b.zmtcdn.com/data/dish_images/197987b7ebcd1ee08f8c25ea4e77e20f1634731334.png"
                                    alt="Chicken Image">
                            </div>
                            <a href="#">
                                <p>Chicken</p>
                            </a>
                        </div>
                    </div>
                </section>
                <section class="heroFirst">
                    <div class="space">
                        <div class="main-con">
                            <div class="img-hero1">
                                <img src="https://b.zmtcdn.com/data/dish_images/1437bc204cb5c892cb22d78b4347f4651634827140.png"
                                    alt="Pani Puri Image">
                            </div>
                            <a href="#">
                                <p>Pani Puri</p>
                            </a>
                        </div>
                    </div>
                </section>
                <section class="heroFirst">
                    <div class="space">
                        <div class="main-con">
                            <div class="img-hero1">
                                <img src="https://b.zmtcdn.com/data/o2_assets/52eb9796bb9bcf0eba64c643349e97211634401116.png"
                                    alt="Thali Image">
                            </div>
                            <a href="#">
                                <p>Thali</p>
                            </a>
                        </div>
                    </div>
                </section>
            </section>
        </div>
    </div>

    <div class="hero1">
        <div class="main-hero">
            <h3>Top Cuisines for you</h3>
            <section class="carousel">
                <section class="heroFirst">
                    <div class="space">
                        <div class="main-con">
                            <div class="img-hero1">
                                <img src="https://holytequila.com/wp-content/uploads/2022/05/history-of-mexican-food.jpg"
                                    alt="Mexican">
                            </div>
                            <a href="#">
                                <p>Mexican</p>
                            </a>
                        </div>
                    </div>
                </section>
                <section class="heroFirst">
                    <div class="space">
                        <div class="main-con">
                            <div class="img-hero1">
                                <img src="https://cdn0.weddingwire.in/article/7010/3_2/960/jpg/10107-famous-food-of-punjab-deli-kitchen-lead-image.jpeg"
                                    alt="Punjabi Image">
                            </div>
                            <a href="#">
                                <p>Punjabi</p>
                            </a>
                        </div>
                    </div>
                </section>
                <section class="heroFirst">
                    <div class="space">
                        <div class="main-con">
                            <div class="img-hero1">
                                <img src="https://www.awesomecuisine.com/wp-content/uploads/2011/08/Maharashtrian-Cuisine.jpg"
                                    alt="Maharashtrian-Cuisine">
                            </div>
                            <a href="#">
                                <p>Maharashtrian</p>
                            </a>
                        </div>
                    </div>
                </section>
                <section class="heroFirst">
                    <div class="space">
                        <div class="main-con">
                            <div class="img-hero1">
                                <img src="https://assets.vogue.com/photos/63d169f727f1d528635b4287/master/w_2560%2Cc_limit/GettyImages-1292563627.jpg"
                                    alt="South Indian Image">
                            </div>
                            <a href="#">
                                <p>South Indian</p>
                            </a>
                        </div>
                    </div>
                </section>
                <section class="heroFirst">
                    <div class="space">
                        <div class="main-con">
                            <div class="img-hero1">
                                <img src="https://www.foodandwine.com/thmb/ckc6L6xKox0WfpfO6dMkuVGPQOY=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/Angel-Food-Cake-with-Three-Berry-Compote-FT-RECIPE0323-541a780b871441e0ab14383ee38acc44.jpg"
                                    alt="Desserts Image">
                            </div>
                            <a href="#">
                                <p>Desserts</p>
                            </a>
                        </div>
                    </div>
                </section>
                <section class="heroFirst">
                    <div class="space">
                        <div class="main-con">
                            <div class="img-hero1">
                                <img src="https://www.beveragedaily.com/var/wrbm_gb_food_pharma/storage/images/publications/food-beverage-nutrition/beveragedaily.com/article/2020/03/31/beverage-webinar-today-what-drinks-do-consumers-want/10866454-1-eng-GB/Beverage-webinar-today-What-drinks-do-consumers-want.jpg"
                                    alt="drinks Image">
                            </div>
                            <a href="#">
                                <p>Drinks</p>
                            </a>
                        </div>
                    </div>
                </section>
            </section>
        </div>
    </div>
    <div class="address">
        <h1>Our Menu</h1>
    </div>
    <div class="Food-menu">
        <div class="Food-card">
            <div class="Food-item">
                <div class="Food-item-margin">
                    <a href="#">
                        <div class="card-img">
                            <img src="https://b.zmtcdn.com/data/pictures/4/19217464/dc7b17458d9f4cbe10e9851811da7f5e_o2_featured_v2.jpg?output-format=webp"
                                alt="restaurant img">
                        </div>
                        <div class="off">
                            <p>50% OFF up to 120</p>
                        </div>
                    </a>
                    <a href="#">
                        <div class="pname">
                            <h4>Seekh Kabab</h4>

                            <div class="rating">
                                <p>3.9 </p>
                                <i class="fa-solid fa-star" style="color: #ffffff;"></i>
                            </div>
                        </div>
                        <div class="Category">
                            <p class="p1">North Indian</p>
                            <p class="p2">₹100 for one</p>
                        </div>
                    </a>
                </div>
            </div>

            <div class="Food-item">
                <div class="Food-item-margin">
                    <a href="#">
                        <div class="card-img">
                            <img src="https://b.zmtcdn.com/data/pictures/6/19713916/5642ca48626bd4aa5264c59947c3b07e_o2_featured_v2.jpg?output-format=webp"
                                alt="restaurant img">
                        </div>
                        <div class="off">
                            <p>50% OFF up to 100</p>
                        </div>
                    </a>
                    <a href="#">
                        <div class="pname">
                            <h4>Falooda</h4>

                            <div class="rating">
                                <p>4.2 </p>
                                <i class="fa-solid fa-star" style="color: #ffffff;"></i>
                            </div>
                        </div>
                        <div class="Category">
                            <p class="p1">Desserts, Beverages, Shake</p>
                            <p class="p2">₹60 for one</p>
                        </div>
                    </a>
                </div>
            </div>

            <div class="Food-item">
                <div class="Food-item-margin">
                    <a href="#">
                        <div class="card-img">
                            <img src="https://b.zmtcdn.com/data/dish_photos/cf6/6ef599645cd537611417488f7e0cacf6.jpg?output-format=webp"
                                alt="restaurant img">
                        </div>
                        <div class="off">
                            <p>50% OFF up to 50</p>
                        </div>
                    </a>
                    <a href="#">
                        <div class="pname">
                            <h4>Jalebi</h4>

                            <div class="rating">
                                <p>4.1 </p>
                                <i class="fa-solid fa-star" style="color: #ffffff;"></i>
                            </div>
                        </div>
                        <div class="Category">
                            <p class="p1">Mithai, Desserts</p>
                            <p class="p2">₹50 for one</p>
                        </div>
                    </a>
                </div>
            </div>

            <div class="Food-item">
                <div class="Food-item-margin">
                    <a href="#">
                        <div class="card-img">
                            <img src="https://b.zmtcdn.com/data/pictures/chains/9/35079/618080e34388c1b55ac1280582c8f997_o2_featured_v2.jpg?output-format=webp"
                                alt="restaurant img">
                        </div>
                        <div class="off">
                            <p>50% OFF up to 100</p>
                        </div>
                    </a>
                    <a href="#">
                        <div class="pname">
                            <h4>Burger with Fries and Coke</h4>

                            <div class="rating">
                                <p>4.0 </p>
                                <i class="fa-solid fa-star" style="color: #ffffff;"></i>
                            </div>
                        </div>
                        <div class="Category">
                            <p class="p1">Burger, Fast Food, Desserts, Beverages</p>
                            <p class="p2">₹250 for one</p>
                        </div>
                    </a>
                </div>
            </div>

            <div class="Food-item">
                <div class="Food-item-margin">
                    <a href="#">
                        <div class="card-img">
                            <img src="https://b.zmtcdn.com/data/dish_photos/034/05af55eee3425c94e8117a9cb3212034.jpg"
                                alt="restaurant img">
                        </div>
                        <div class="off">
                            <p>50% OFF up to 120</p>
                        </div>
                    </a>
                    <a href="#">
                        <div class="pname">
                            <h4>Non-Veg Pizza</h4>

                            <div class="rating">
                                <p>3.7 </p>
                                <i class="fa-solid fa-star" style="color: #ffffff;"></i>
                            </div>
                        </div>
                        <div class="Category">
                            <p class="p1">Pizza, Italian, Fast Food</p>
                            <p class="p2">₹200 for one</p>
                        </div>
                    </a>
                </div>
            </div>

            <div class="Food-item">
                <div class="Food-item-margin">
                    <a href="#">
                        <div class="card-img">
                            <img src="https://b.zmtcdn.com/data/reviews_photos/dfa/4ffedbd044232339f5873239bca9ddfa_1653997138.jpg?fit=around%7C200%3A200&crop=200%3A200%3B%2A%2C%2A"
                                alt="restaurant img">
                        </div>
                        <div class="off">
                            <p>50% OFF up to 100</p>
                        </div>
                    </a>
                    <a href="#">
                        <div class="pname">
                            <h4>Aloo Samosa</h4>

                            <div class="rating">
                                <p>4.5 </p>
                                <i class="fa-solid fa-star" style="color: #ffffff;"></i>
                            </div>
                        </div>
                        <div class="Category">
                            <p class="p1">Samosa, Street Food</p>
                            <p class="p2">₹15 for one</p>
                        </div>
                    </a>
                </div>
            </div>

            <div class="Food-item">
                <div class="Food-item-margin">
                    <a href="#">
                        <div class="card-img">
                            <img src="https://b.zmtcdn.com/data/dish_photos/7b4/fbf329542547326b85ba6a9b2f61f7b4.jpg?output-format=webp"
                                alt="restaurant img">
                        </div>
                        <div class="off">
                            <p>50% OFF up to 70</p>
                        </div>
                    </a>
                    <a href="#">
                        <div class="pname">
                            <h4>Chole Bhature</h4>

                            <div class="rating">
                                <p>3.6 </p>
                                <i class="fa-solid fa-star" style="color: #ffffff;"></i>
                            </div>
                        </div>
                        <div class="Category">
                            <p class="p1">Chole Bhature, Fast Food</p>
                            <p class="p2">₹100 for one</p>
                        </div>
                    </a>
                </div>
            </div>

            <div class="Food-item">
                <div class="Food-item-margin">
                    <a href="#">
                        <div class="card-img">
                            <img src="https://b.zmtcdn.com/data/pictures/8/36508/534910dd7c65407a223ccac5f2fb89fb_o2_featured_v2.jpg"
                                alt="restaurant img">
                        </div>
                        <div class="off">
                            <p>50% OFF up to 100</p>
                        </div>
                    </a>
                    <a href="#">
                        <div class="pname">
                            <h4>Pav Bhaji</h4>

                            <div class="rating">
                                <p>3.6 </p>
                                <i class="fa-solid fa-star" style="color: #ffffff;"></i>
                            </div>
                        </div>
                        <div class="Category">
                            <p class="p1">Pav Bhaji, Street Food</p>
                            <p class="p2">₹70 for one</p>
                        </div>
                    </a>
                </div>
            </div>

            <div class="Food-item">
                <div class="Food-item-margin">
                    <a href="#">
                        <div class="card-img">
                            <img src="https://b.zmtcdn.com/data/dish_photos/059/4e5cf4a4ad71056b77d54494082ea059.jpeg?output-format=webp"
                                alt="restaurant img">
                        </div>
                        <div class="off">
                            <p>50% OFF up to 120</p>
                        </div>
                    </a>
                    <a href="#">
                        <div class="pname">
                            <h4>CheeseCake</h4>

                            <div class="rating">
                                <p>4.3 </p>
                                <i class="fa-solid fa-star" style="color: #ffffff;"></i>
                            </div>
                        </div>
                        <div class="Category">
                            <p class="p1">Bakery, Desserts</p>
                            <p class="p2">₹120 for one</p>
                        </div>
                    </a>
                </div>
            </div>

            <div class="Food-item">
                <div class="Food-item-margin">
                    <a href="#">
                        <div class="card-img">
                            <img src="https://b.zmtcdn.com/data/dish_photos/be3/c40910dd36934ce0f347d085ee7d2be3.jpg?output-format=webp"
                                alt="restaurant img">
                        </div>
                        <div class="off">
                            <p>50% OFF up to 80</p>
                        </div>
                    </a>
                    <a href="#">
                        <div class="pname">
                            <h4>Gulab Jamun</h4>

                            <div class="rating">
                                <p>4.1 </p>
                                <i class="fa-solid fa-star" style="color: #ffffff;"></i>
                            </div>
                        </div>
                        <div class="Category">
                            <p class="p1">Gulab Jamun, Mithai, Desserts</p>
                            <p class="p2">₹40 for one</p>
                        </div>
                    </a>
                </div>
            </div>

            <div class="Food-item">
                <div class="Food-item-margin">
                    <a href="#">
                        <div class="card-img">
                            <img src="https://b.zmtcdn.com/data/dish_photos/e52/b3aee13411f93fc2f81a9f89795ade52.jpg?output-format=webp"
                                alt="restaurant img">
                        </div>
                        <div class="off">
                            <p>50% OFF up to 100</p>
                        </div>
                    </a>
                    <a href="#">
                        <div class="pname">
                            <h4>Ice Cream</h4>

                            <div class="rating">
                                <p>3.5 </p>
                                <i class="fa-solid fa-star" style="color: #ffffff;"></i>
                            </div>
                        </div>
                        <div class="Category">
                            <p class="p1">Ice Cream, Dessert</p>
                            <p class="p2">₹50 for one</p>
                        </div>
                    </a>
                </div>
            </div>

            <div class="Food-item">
                <div class="Food-item-margin">
                    <a href="#">
                        <div class="card-img">
                            <img src="https://b.zmtcdn.com/data/dish_photos/58b/7c2f1bdfd5f8627b1a9a67c0ebc4558b.jpg?output-format=webp"
                                alt="restaurant img">
                        </div>
                        <div class="off">
                            <p>50% OFF up to 60</p>
                        </div>
                    </a>
                    <a href="#">
                        <div class="pname">
                            <h4>Chocolate Milkshake</h4>

                            <div class="rating">
                                <p>4.8 </p>
                                <i class="fa-solid fa-star" style="color: #ffffff;"></i>
                            </div>
                        </div>
                        <div class="Category">
                            <p class="p1">Shakes, Drinks, Chocolate</p>
                            <p class="p2">₹80 for one</p>
                        </div>
                    </a>
                </div>
            </div>
            <!--Add food item here-->
        </div>
    </div>
    <!-- <script src="https://www.gstatic.com/dialogflow-console/fast/messenger/bootstrap.js?v=1"></script> -->

        <?php
    if ($includeMessenger) {
        // Include the messenger initialization with the appropriate session ID
        ?>
        <df-messenger intent="WELCOME" chat-title="Vision-ChatBot" agent-id="a28a7dfc-93ae-4161-9a32-8907602102fc"
            language-code="en" session-id="<?php echo $sessionId; ?>"></df-messenger>

    <?php
    }
    ?>
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
            <p class="copyright">©Cresty™ Ltd. All rights reserved.</p>
        </div>
    </footer>
</body>

</html>