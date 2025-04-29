<%@ include file="DBConnection.jsp" %>
<%
    // Check if user is logged in
    if (session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
    }

    // Check if form is submitted
    if (request.getMethod().equalsIgnoreCase("post")) {
        int tenderId = Integer.parseInt(request.getParameter("tenderId"));
        double amount = Double.parseDouble(request.getParameter("amount"));
        int userId = (int) session.getAttribute("user_id"); // Assume user_id is set at login

        // Insert the bid into the database
        try (Connection conn = getConnection()) {
            PreparedStatement ps = conn.prepareStatement("INSERT INTO bids (tender_id, user_id, amount) VALUES (?, ?, ?)");
            ps.setInt(1, tenderId);
            ps.setInt(2, userId);
            ps.setDouble(3, amount);
            ps.executeUpdate();

            // Redirect to manageBids.jsp after successful bid
            response.sendRedirect("manageBids.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Place Bid - Online Tender System</title>
    <link rel="stylesheet" href="styles.css"> <!-- Link to your CSS file -->
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f4f4f4;
        }
        .container {
            max-width: 600px;
            margin: auto;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            color: #333;
            text-align: center;
        }
        input[type="number"], input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        button {
            width: 100%;
            padding: 10px;
            background-color: #007BFF;
            border: none;
            border-radius: 5px;
            color: white;
            font-size: 16px;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Place Your Bid</h2>
        <form action="placeBid.jsp" method="post">
            <input type="number" name="tenderId" placeholder="Tender ID" required>
            <input type="text" name="amount" placeholder="Bid Amount" required>
            <button type="submit">Place Bid</button>
        </form>
    </div>
</body>
</html>
