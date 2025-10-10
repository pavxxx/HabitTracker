<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Logged Out</title>
</head>
<body>
    <h2>
        <%
            String msg = (String) request.getAttribute("logoutMessage");
            if(msg != null) out.print(msg);
            else out.print("You are now logged out.");
        %>
    </h2>
    <a href="login.jsp">Login again</a>
</body>
</html>
