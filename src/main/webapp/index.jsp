<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Habit Tracker</title>
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
      padding: 40px 32px 32px 32px;
      text-align: center;
    }
    .center-box h1 {
      font-size: 2.5rem;
      font-weight: 500;
      margin-bottom: 16px;
      color: #333;
    }
    .center-box p {
      font-size: 1.1rem;
      color: #666;
      margin-bottom: 32px;
    }
    .custom-btn {
      width: 100%;
      background: #222;
      color: #fff;
      padding: 13px 0;
      border-radius: 26px;
      border: 0;
      font-size: 1.15rem;
      margin-bottom: 12px;
      text-decoration: none;
      display: inline-block;
      transition: background 0.2s;
    }
    .custom-btn:hover {
      background: #444;
      color: #fff;
      text-decoration: none;
    }
    .custom-btn.secondary {
      background: #fff;
      color: #333;
      border: 1px solid #d6d6d6;
    }
    .custom-btn.secondary:hover {
      background: #f0f0f0;
      color: #333;
    }
  </style>
</head>
<body>
  <div class="center-box">
    <h1>Habit Tracker</h1>
    <p>Build better habits, track your progress</p>
    <a href="login.jsp" class="custom-btn">Login</a>
    <a href="register.jsp" class="custom-btn secondary">Register</a>
    <%-- 
    <a href="logout.jsp">Logout</a>
    --%>
    
  </div>
</body>
</html>
