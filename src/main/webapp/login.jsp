<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Habit Tracker - Login</title>
  <style>
    body {
      background: #77896c;
      margin: 0;
      min-height: 100vh;
      font-family: 'Segoe UI', Arial, sans-serif;
    }
    .center-box {
      background: #f4f4f4;
      border-radius: 24px;
      box-shadow: 0 4px 24px 0 rgba(0,0,0,0.10);
      width: 370px;
      margin: 80px auto 0 auto;
      padding: 40px 32px 28px 32px;
      display: flex;
      flex-direction: column;
      align-items: center;
    }
    .center-box h2 {
      font-size: 2.3rem;
      font-weight: 500;
      margin-bottom: 32px;
      margin-top: 0;
      text-align: center;
    }
    .custom-input {
      width: 100%;
      padding: 12px;
      margin-bottom: 18px;
      border-radius: 8px;
      border: 1px solid #d6d6d6;
      font-size: 1.06rem;
      background: #fafafa;
    }
    .custom-btn {
      width: 100%;
      background: #222;
      color: #fff;
      padding: 13px 0;
      border-radius: 26px;
      border: 0;
      font-size: 1.15rem;
      margin-top: 10px;
      transition: background 0.2s;
      cursor: pointer;
    }
    .custom-btn:hover {
      background: #444;
    }
    .alt-switcher {
      margin-top: 24px;
      text-align: center;
      font-size: 1rem;
      color: #333;
    }
    .alt-switcher a {
      color: #2563eb;
      text-decoration: underline;
    }
    .text-danger {
      color: #e53935;
      margin-top: 12px;
      min-height: 22px;
      text-align: center;
    }
  </style>
</head>
<body>
  <div class="center-box">
    <h2>Habit Tracker Login</h2>
    <form action="LoginServlet" method="post" style="width:100%">
      <input type="text" name="username" class="custom-input" placeholder="Username" required autocomplete="off">
      <input type="password" name="password" class="custom-input" placeholder="Password" required>
      <button class="custom-btn" type="submit">Login</button>
    </form>
    <div class="alt-switcher">
      Don't have an account? <a href="register.jsp">Register</a>
    </div>
    <div class="text-danger">
      <%= request.getAttribute("error") == null ? "" : request.getAttribute("error") %>
    </div>
  </div>
</body>
</html>
