<?php
include 'db.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $name = trim($_POST['name']);
    $email = trim($_POST['email']);
    $password = password_hash($_POST['password'], PASSWORD_DEFAULT);

    $stmt = $pdo->prepare("INSERT INTO users (name, email, password) VALUES (?, ?, ?)");
    try {
        $stmt->execute([$name, $email, $password]);
        echo json_encode(['status' => 'success', 'message' => 'Аккаунт создан']);
    } catch (PDOException $e) {
        echo json_encode(['status' => 'error', 'message' => 'Пользователь уже существует']);
    }
}
?>
