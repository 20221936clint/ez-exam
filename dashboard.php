<?php
// Initialize the session
session_start();

// Check if the user is logged in, if not redirect to login page
if (!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true) {
    header("location: login.php");
    exit;
}

// Include config file
require_once "config.php";

// Fetch bike data from the database
$sql = "SELECT * FROM bikes LIMIT 10";  // Limit to 10 bikes
$stmt = $pdo->prepare($sql);
$stmt->execute();
$bikes = $stmt->fetchAll();

// Check if a like was submitted
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['like'])) {
    $bike_id = $_POST['bike_id'];
    $user_id = $_SESSION['id'];

    // Insert the like into the likes table
    $sql = "INSERT INTO likes (user_id, bike_id) VALUES (:user_id, :bike_id)";
    $stmt = $pdo->prepare($sql);
    $stmt->bindParam(':user_id', $user_id, PDO::PARAM_INT);
    $stmt->bindParam(':bike_id', $bike_id, PDO::PARAM_INT);

    if ($stmt->execute()) {
        echo "<p class='alert alert-success'>You liked a bike!</p>";
    } else {
        echo "<p class='alert alert-danger'>Something went wrong. Please try again later.</p>";
    }
}

// Close connection
unset($pdo);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            font: 14px sans-serif;
            background-color: #121212;
            color: #ffffff;
        }
        .container {
            margin-top: 50px;
        }
        .bike-card {
            background-color: #1e1e1e;
            color: #ffffff;
            border-radius: 8px;
            box-shadow: 0px 0px 10px rgba(255, 0, 255, 0.3);
        }
        .bike-card img {
            max-width: 100%;
            border-bottom: 2px solid #ff00ff;
        }
        .btn-like {
            background-color: #00bfff;
            border: none;
        }
        .btn-like:hover {
            background-color: #ff00ff;
        }
        .navbar {
            background-color: #333;
        }
        .navbar a {
            color: #fff;
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <a class="navbar-brand" href="dashboard.php">Dashboard</a>
        <div class="ml-auto">
        <a href="join.php" class="btn btn-info">Join Example</a>

            <a href="logout.php" class="btn btn-danger">Logout</a>
        </div>
    </nav>

    <div class="container">
        <h2 class="text-center mt-4">Welcome to the Bike Dashboard</h2>

        <!-- Bike containers -->
        <div class="row mt-5">
            <?php foreach ($bikes as $bike): ?>
                <div class="col-md-4 mb-4">
                    <div class="card bike-card">
                        <img src="<?php echo htmlspecialchars($bike['image_url']); ?>" alt="Bike Image">
                        <div class="card-body">
                            <h5 class="card-title"><?php echo htmlspecialchars($bike['name']); ?></h5>
                            <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="POST">
                                <input type="hidden" name="bike_id" value="<?php echo $bike['id']; ?>">
                                <button type="submit" name="like" class="btn btn-like btn-block">Like</button>
                            </form>
                        </div>
                    </div>
                </div>
            <?php endforeach; ?>
        </div>
    </div>
</body>
</html>
