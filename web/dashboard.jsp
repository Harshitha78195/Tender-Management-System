<%@ page import="java.sql.*" %>
<%@ include file="DBConnection.jsp" %>
<%
    // Check if the user is logged in; if not, redirect to the login page
    if (session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
    }
    // Get the user's role from the session
    String role = (String) session.getAttribute("role");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Online Tender System</title>
    <link rel="stylesheet" href="styles.css"> <!-- Link to your CSS file -->
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f4f4f4;
        }
        .container {
            max-width: 800px;
            margin: auto;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            color: #333;
            text-align: center;
        }
        h2 {
            color: #555;
        }
        ul {
            list-style-type: none;
            padding: 0;
        }
        li {
            margin: 10px 0;
        }
        a {
            text-decoration: none;
            color: #007BFF;
            font-weight: bold;
        }
        a:hover {
            text-decoration: underline;
        }
        .logout {
            display: block;
            margin-top: 20px;
            text-align: center;
            background-color: #ff4444;
            color: white;
            padding: 10px;
            border-radius: 5px;
            text-decoration: none;
        }
        .logout:hover {
            background-color: #c0392b;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome, <%= session.getAttribute("username") %></h1>
        
        <h2>Available Actions:</h2>
        <ul>
            <li><a href="viewTenders.jsp">View Tenders</a></li>
            <li><a href="placeBid.jsp">Place Bid</a></li>
            <li><a href="manageBids.jsp">Manage Bids</a></li> <!-- Accessible to both users and admins -->
            <% if ("admin".equals(role)) { %>
                <li><a href="addTender.jsp">Add Tender</a></li>
            <% } %>
        </ul>
        
        <a class="logout" href="logout.jsp">Logout</a>
    </div>
</body>
</html>
