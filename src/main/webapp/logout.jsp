<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Logged Out - Habit Tracker</title>
    <style>
        body {
            background: #f8f9fa;
            margin: 0;
            font-family: 'Segoe UI', Arial, sans-serif;
            color: #333;
        }
        .navbar {
            background: #77896c;
            color: white;
            padding: 16px 0;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            margin-bottom: 0;
        }
        .navbar .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .navbar h1 {
            margin: 0;
            font-size: 1.8rem;
            font-weight: 500;
        }
        .main-container {
            max-width: 500px;
            margin: 80px auto 0 auto;
            padding: 0 20px;
        }
        .card {
            background: white;
            border-radius: 12px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.08);
            padding: 36px 32px 32px 32px;
            text-align: center;
        }
        .card h2 {
            color: #333;
            margin-top: 0;
            margin-bottom: 18px;
            font-size: 1.5rem;
            font-weight: 500;
        }
        .btn-primary {
            margin-top: 20px;
            padding: 10px 24px;
            border: none;
            border-radius: 6px;
            background: #77896c;
            color: #fff;
            font-size: 1rem;
            font-family: inherit;
            text-decoration: none;
            display: inline-block;
            transition: background 0.19s;
        }
        .btn-primary:hover {
            background: #6a7b5f;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <div class="container">
            <h1>Habit Tracker</h1>
        </div>
    </div>

    <div class="main-container">
        <div class="card">
            <h2>
                <% String msg = (String) request.getAttribute("logoutMessage"); %>
                <%= (msg != null) ? msg : "You are now logged out." %>
            </h2>
            <a href="login.jsp" class="btn-primary">Login again</a>
        </div>
        <%--
        <form action="LoginServlet" method="post">
    		<input type="text" name="username" />
    		<input type="password" name="password" />
    		<button type="submit">Login</button>
		</form>
        --%>
    
    </div>
</body>
</html>
