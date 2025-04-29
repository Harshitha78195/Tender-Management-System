<%@ include file="DBConnection.jsp" %>
<%
    // Check if the user is logged in
    if (session.getAttribute("username") == null) { 
        response.sendRedirect("login.jsp"); 
        return; // Ensure no further processing occurs
    }

    // Retrieve the success or error message from the session
    String message = (String) session.getAttribute("tenderMessage");
    session.removeAttribute("tenderMessage"); // Clear the message after displaying it
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Tenders - Online Tender System</title>
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
        <h2>Available Tenders</h2>

        <% if (message != null) { %>
            <p class="message"><%= message %></p>
        <% } %>

        <!-- Display tenders from the database -->
        <table>
            <thead>
                <tr>
                    <th>Tender ID</th> <!-- Added Tender ID header -->
                    <th>Tender Name</th>
                    <th>Description</th>
                    <th>Start Date</th>
                    <th>End Date</th>
                </tr>
            </thead>
            <tbody>
                <%
                    try (Connection conn = getConnection()) {
                        PreparedStatement ps = conn.prepareStatement("SELECT tender_id, tender_name, description, start_date, end_date FROM tenders");
                        ResultSet rs = ps.executeQuery();
                        while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getInt("tender_id") %></td> <!-- Display Tender ID -->
                    <td><%= rs.getString("tender_name") %></td>
                    <td><%= rs.getString("description") %></td>
                    <td><%= rs.getDate("start_date") %></td>
                    <td><%= rs.getDate("end_date") %></td>
                </tr>
                <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>
