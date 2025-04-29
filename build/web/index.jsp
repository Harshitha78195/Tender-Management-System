<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Online Tender System</title>
    <link rel="stylesheet" href="styles.css"> <!-- Link to your CSS file -->
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f4f4f4;
        }
        h2 {
            color: #333;
            text-align: center;
        }
        .container {
            max-width: 800px;
            margin: auto;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .description {
            margin: 20px 0;
            text-align: justify;
            line-height: 1.6;
        }
        .links {
            text-align: center;
            margin-top: 20px;
        }
        a {
            text-decoration: none;
            color: #007BFF;
            font-weight: bold;
            margin: 0 15px;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Welcome to the Online Tender System</h2>
        
        <% 
            String logoutMessage = request.getParameter("logout");
            if ("true".equals(logoutMessage)) {
                out.println("<p style='color: green;'>You have logged out successfully.</p>");
            }
        %>

        <div class="description">
            <p>
                The Online Tender System is designed to streamline the tendering process, allowing users to easily view available tenders, place bids, and for admins to manage the entire process efficiently. Our platform aims to foster transparency and competitive bidding, ensuring that all participants have equal opportunities to submit their proposals.
            </p>
            <p>
                Whether you are a bidder looking for the best opportunities or an administrator managing the tenders, our system provides an intuitive interface to help you navigate the process with ease.
            </p>
        </div>
        <div class="links">
            <a href="login.jsp">Login</a> | <a href="register.jsp">Register</a>
        </div>
    </div>
</body>
</html>
