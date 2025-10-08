<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Add Habit - Habit Tracker</title>
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
    .nav-buttons a {
      color: white;
      text-decoration: none;
      padding: 8px 16px;
      border-radius: 8px;
      margin-left: 12px;
      background: rgba(255,255,255,0.1);
      transition: background 0.2s;
    }
    .nav-buttons a:hover {
      background: rgba(255,255,255,0.2);
    }
    .main-container {
      max-width: 600px;
      margin: 32px auto;
      padding: 0 20px;
    }
    .card {
      background: white;
      border-radius: 12px;
      box-shadow: 0 2px 8px rgba(0,0,0,0.1);
      padding: 32px;
    }
    .card h3 {
      margin-top: 0;
      margin-bottom: 24px;
      color: #333;
      font-size: 1.6rem;
    }
    .form-group {
      margin-bottom: 20px;
    }
    .form-group label {
      display: block;
      margin-bottom: 8px;
      font-weight: 500;
      color: #555;
    }
    .form-control {
      width: 100%;
      padding: 12px;
      border: 1px solid #d6d6d6;
      border-radius: 8px;
      font-size: 1rem;
      background: #fafafa;
      box-sizing: border-box;
    }
    .form-control:focus {
      outline: none;
      border-color: #77896c;
      background: white;
    }
    .help-text {
      font-size: 0.9rem;
      color: #666;
      margin-top: 6px;
    }
    .btn {
      padding: 12px 24px;
      border: none;
      border-radius: 8px;
      font-size: 1rem;
      cursor: pointer;
      text-decoration: none;
      display: inline-block;
      transition: background 0.2s;
      margin-right: 12px;
    }
    .btn-primary {
      background: #77896c;
      color: white;
    }
    .btn-primary:hover {
      background: #6a7b5f;
    }
    .btn-secondary {
      background: #6c757d;
      color: white;
    }
    .btn-secondary:hover {
      background: #5a6268;
    }
  </style>
</head>
<body>
  <div class="navbar">
    <div class="container">
      <h1>Add New Habit</h1>
      <div class="nav-buttons">
        <a href="dashboard.jsp">Dashboard</a>
        <a href="history.jsp">History</a>
        <a href="LogoutServlet">Logout</a>
      </div>
    </div>
  </div>

  <div class="main-container">
    <div class="card">
      <h3>Create a New Habit</h3>
      <form action="AddHabitServlet" method="post">
        <div class="form-group">
          <label for="habitName">Habit Name</label>
          <input type="text" id="habitName" name="habitName" class="form-control" 
                 placeholder="e.g., Drink 8 glasses of water" required>
        </div>
        
        <div class="form-group">
          <label for="habitDate">Date (Optional)</label>
          <input type="date" id="habitDate" name="habitDate" class="form-control">
          <div class="help-text">Leave empty to add for today</div>
        </div>

        <button type="submit" class="btn btn-primary">Add Habit</button>
        <a href="dashboard.jsp" class="btn btn-secondary">Cancel</a>
      </form>
    </div>
  </div>
</body>
</html>
