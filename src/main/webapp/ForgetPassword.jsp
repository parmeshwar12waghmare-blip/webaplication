<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            background: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            width: 350px;
        }

        h2 {
            margin-bottom: 15px;
            color: #333;
        }

        p {
            font-size: 14px;
            color: #555;
            margin-bottom: 20px;
        }

        label {
            font-size: 14px;
            color: #555;
        }

        input {
            width: 100%;
            padding: 10px;
            margin-top: 6px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
        }

        input:focus {
            outline: none;
            border-color: #28a745;
        }

        button {
            width: 100%;
            padding: 10px;
            background: #28a745;
            border: none;
            color: white;
            font-size: 16px;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background: #218838;
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 15px;
            font-size: 14px;
            text-decoration: none;
            color: #28a745;
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>Forgot Password</h2>
        <p>Enter your email address below and we'll send you a OTP.</p>
        
        <form>
            <label>Email</label>
            <input type="email" placeholder="Enter your email" required>

            <button type="submit">Send</button>
        </form>

        <a href="Login.jsp" class="back-link">Back to Sign In</a>
    </div>

</body>
