<%@ include file="DBConnection.jsp" %>
<%
    // Check if the user is logged in
    if (session.getAttribute("username") == null) { 
        response.sendRedirect("login.jsp"); 
        return; // Ensure no further processing occurs
    }

    // Get the user's role to check if they are an admin
    String role = (String) session.getAttribute("role");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Bids - Online Tender System</title>
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
        h2 {
            color: #333;
            text-align: center;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 10px;
            text-align: left;
            border: 1px solid #ccc;
        }
        th {
            background-color: #007BFF;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        .message {
            color: green;
            text-align: center;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="container">
        <% 
            if (!"admin".equals(role)) {
                // Query to get bids for the logged-in user
                try (Connection conn = getConnection()) {
                    String sql = "SELECT b.bid_id, b.amount, b.bid_date, t.tender_name " +
                                 "FROM bids b " +
                                 "JOIN tenders t ON b.tender_id = t.tender_id " +
                                 "WHERE b.user_id = ?";
                    PreparedStatement ps = conn.prepareStatement(sql);
                    ps.setInt(1, (int) session.getAttribute("user_id")); // Assume user_id is stored in the session
                    ResultSet rs = ps.executeQuery();

                    out.println("<h2>Your Bids</h2>");
                    out.println("<table>");
                    out.println("<tr><th>Bid ID</th><th>Tender Name</th><th>Amount</th><th>Bid Date</th></tr>");
                    
                    // Loop through the results and display each bid
                    while (rs.next()) {
                        out.println("<tr>");
                        out.println("<td>" + rs.getInt("bid_id") + "</td>");
                        out.println("<td>" + rs.getString("tender_name") + "</td>");
                        out.println("<td>" + rs.getDouble("amount") + "</td>");
                        out.println("<td>" + rs.getDate("bid_date") + "</td>");
                        out.println("</tr>");
                    }
                    out.println("</table>");
                } catch (Exception e) {
                    e.printStackTrace();
                    response.sendRedirect("error.jsp");
                }
            } else {
                // Admin section to view all bids
                try (Connection conn = getConnection()) {
                    // Query to get all bids along with corresponding tender name and username
                    String sql = "SELECT b.bid_id, b.amount, b.bid_date, t.tender_name, u.username " +
                                 "FROM bids b " +
                                 "JOIN tenders t ON b.tender_id = t.tender_id " +
                                 "JOIN users u ON b.user_id = u.user_id";
                    PreparedStatement ps = conn.prepareStatement(sql);
                    ResultSet rs = ps.executeQuery();

                    out.println("<h2>Manage All Bids</h2>");
                    out.println("<table>");
                    out.println("<tr><th>Bid ID</th><th>Tender Name</th><th>Username</th><th>Amount</th><th>Bid Date</th></tr>");
                    
                    // Loop through the results and display each bid
                    while (rs.next()) {
                        out.println("<tr>");
                        out.println("<td>" + rs.getInt("bid_id") + "</td>");
                        out.println("<td>" + rs.getString("tender_name") + "</td>");
                        out.println("<td>" + rs.getString("username") + "</td>");
                        out.println("<td>" + rs.getDouble("amount") + "</td>");
                        out.println("<td>" + rs.getDate("bid_date") + "</td>");
                        out.println("</tr>");
                    }
                    out.println("</table>");
                } catch (Exception e) {
                    e.printStackTrace();
                    response.sendRedirect("error.jsp");
                }
            }
        %>
    </div>
</body>
</html>
