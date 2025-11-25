<?php
$host = "localhost";
$db = "concertflow";
$user = "root"; // мой пользователь MySQL
$pass = "";     // мой пароль MySQL

try {
    $pdo = new PDO("mysql:host=$host;dbname=$db;charset=utf8", $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch(PDOException $e) {
    die("Ошибка подключения к БД: " . $e->getMessage());
}
?>
