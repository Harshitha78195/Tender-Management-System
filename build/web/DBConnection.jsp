<%@ page import="java.sql.*" %>
<%!
    public Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName("org.postgresql.Driver");
        String url = "jdbc:postgresql://localhost:3157/tender_system";
        String user = "postgres";
        String password = "9398040754";
        return DriverManager.getConnection(url, user, password);
    }
%>

