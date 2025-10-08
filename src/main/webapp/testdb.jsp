<%@ page import="java.sql.*" %>
<%@ page import="db.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
    <title>Database Connection Test</title>
</head>
<body>
<%
    try (Connection conn = DBConnection.getConnection()) {
        if (conn != null) {
            out.println("<h2 style='color:green;'>✅ Database connected successfully!</h2>");
        } else {
            out.println("<h2 style='color:red;'>❌ Connection failed.</h2>");
        }
    } catch (Exception e) {
        out.println("<h2 style='color:red;'>❌ Error: " + e.getMessage() + "</h2>");
        e.printStackTrace();
    }
%>
</body>
</html>
