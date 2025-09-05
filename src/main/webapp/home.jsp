<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employee Management System</title>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<style>

body {
    margin: 0;
    font-family: 'Poppins', sans-serif;
    background: radial-gradient(circle at top left, #1f1c2c, #928dab);
    color: #fffff;
}
    header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 15px 40px;
        background: rgba(255, 255, 255, 0.05);
        backdrop-filter: blur(10px);
        position: sticky;
        top: 0;
        z-index: 100;
    }

    header h1 {
        font-size: 24px;
        letter-spacing: 1px;
        color: #ffd700;
    }

    .login-icon {
        font-size: 22px;
        color: #ffffff;
        cursor: pointer;
        transition: transform 0.3s, color 0.3s;
    }

    .login-icon:hover {
        transform: scale(1.2);
        color: #ffd700;
    }

    .hero {
        text-align: center;
        padding: 60px 20px;
        animation: fadeIn 1.5s ease-in-out;
    }

    .hero h2 {
        font-size: 36px;
        margin-bottom: 10px;
        color: #ffd700;
    }

    .hero p {
        font-size: 18px;
        opacity: 0.9;
    }

    .info-section {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
        gap: 20px;
        padding: 40px;
    }

    .card {
        background: rgba(255, 255, 255, 0.08);
        border-radius: 12px;
        padding: 20px;
        text-align: center;
        transition: transform 0.4s ease, box-shadow 0.4s ease;
        cursor: pointer;
        backdrop-filter: blur(6px);
    }

    .card:hover {
        transform: translateY(-8px);
        box-shadow: 0px 8px 20px rgba(255, 215, 0, 0.3);
    }

    .card h3 {
        margin-bottom: 10px;
        font-size: 20px;
        font-weight: 600;
        color: #ffd700;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(20px); }
        to { opacity: 1; transform: translateY(0); }
    }
</style>
</head>
<body>

<header>
    <h1>My Company</h1>
    <a href="Login.jsp"><i class="fas fa-user-circle login-icon"></i></a>
</header>

<section class="hero">
    <h2>Welcome to the Employee Management System</h2>
    <p>Manage employees, attendance, and announcements in one place.</p>
</section>

<section class="info-section">
    <div class="card">
        <h3>About Us</h3>
        <p>We provide seamless solutions for managing employee data efficiently.</p>
    </div>
    <div class="card">
        <h3>Announcements</h3>
        <p>Check the latest updates and company news here.</p>
    </div>
    <div class="card">
        <h3>Holiday List</h3>
        <p>View upcoming holidays and company events.</p>
    </div>
</section>

</body>
</html>