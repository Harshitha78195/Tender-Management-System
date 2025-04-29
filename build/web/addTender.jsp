<%@ include file="DBConnection.jsp" %>
<%
    // Check if the user is logged in and has admin privileges
    if (session.getAttribute("username") == null || !"admin".equals(session.getAttribute("role"))) { 
        response.sendRedirect("login.jsp"); 
    }

    // Process form submission
    if (request.getMethod().equalsIgnoreCase("post")) {
        String tenderName = request.getParameter("tenderName");
        String description = request.getParameter("description");
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        int createdBy = (int) session.getAttribute("user_id"); // Assume user_id is set at login

        try (Connection conn = getConnection()) {
            // Prepare SQL statement for inserting a new tender
            PreparedStatement ps = conn.prepareStatement("INSERT INTO tenders (tender_name, description, start_date, end_date, created_by) VALUES (?, ?, ?, ?, ?)");
            ps.setString(1, tenderName);
            ps.setString(2, description);
            ps.setDate(3, Date.valueOf(startDate));
            ps.setDate(4, Date.valueOf(endDate));
            ps.setInt(5, createdBy);
            ps.executeUpdate();
            response.sendRedirect("dashboard.jsp");
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
    <title>Add Tender - Online Tender System</title>
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
        label {
            display: block;
            margin: 10px 0 5px;
        }
        input[type="text"], input[type="date"], textarea {
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
        <h2>Add New Tender</h2>
        <form action="addTender.jsp" method="post">
            <label for="tenderName">Tender Name:</label>
            <input type="text" name="tenderName" placeholder="Tender Name" required>
            
            <label for="description">Description:</label>
            <textarea name="description" placeholder="Description" required></textarea>
            
            <label for="startDate">Start Date:</label>
            <input type="date" name="startDate" required>
            
            <label for="endDate">End Date:</label>
            <input type="date" name="endDate" required>
            
            <button type="submit">Add Tender</button>
        </form>
    </div>
</body>
</html>
