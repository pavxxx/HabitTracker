<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<!DOCTYPE html>
<html>
<head>
  <title>Habit History</title>
  <style>
    body { background: #f8f9fa; margin: 0; font-family: 'Segoe UI', Arial, sans-serif; color: #333; }
    .navbar { background: #77896c; color: white; padding: 16px 0; box-shadow: 0 2px 4px rgba(0,0,0,0.1);}
    .navbar .container { max-width: 1200px; margin: 0 auto; padding: 0 20px; display: flex; justify-content: space-between; align-items: center;}
    .navbar h1 { margin: 0; font-size: 1.8rem; font-weight: 500;}
    .nav-buttons a { color: white; text-decoration: none; padding: 8px 16px; border-radius: 8px; margin-left: 12px; background: #6a7b5f; transition: background 0.2s;}
    .nav-buttons a:hover { background: #222;}
    .main-container { max-width: 1200px; margin: 32px auto; padding: 0 20px;}
    .card { background: white; border-radius: 12px; box-shadow: 0 2px 8px rgba(0,0,0,0.1); padding: 24px; margin-bottom: 24px;}
    .card h3 {margin-top: 0; margin-bottom: 20px; color: #333; font-size: 1.4rem;}
    .habit-item {display: flex; justify-content: space-between; align-items: center; padding: 16px 0; border-bottom: 1px solid #eee;}
    .habit-item:last-child {border-bottom: none;}
    .habit-name {font-weight: 500; font-size: 1.1rem;}
    .done-tag {color: #28a745; font-weight: 500;}
    .empty-state {text-align: center; color: #666; font-style: italic; padding: 40px 0;}
  </style>
</head>
<body>
  <div class="navbar">
    <div class="container">
      <h1>Habit History</h1>
      <div class="nav-buttons">
        <a href="dashboard.jsp">Dashboard</a>
        <a href="addhabit.jsp">Add Habit</a>
        <a href="UpcomingHabitsServlet">Upcoming</a>
        <a href="logout.jsp">Logout</a>
      </div>
    </div>
  </div>
  <div class="main-container">
    <div class="card">
      <h3>Completed Habits</h3>
      <%
        List<Map<String, Object>> history = (List<Map<String, Object>>) request.getAttribute("history");
        if (history != null && !history.isEmpty()) {
          for (Map<String, Object> habit : history) {
      %>
      <div class="habit-item">
        <div>
          <div class="habit-name"><%= habit.get("habitName") %></div>
          <div style="font-size:0.93em; color:#555;">Date: <%= habit.get("date") %></div>
        </div>
        <span class="done-tag">✓ Completed</span>
      </div>
      <% } } else { %>
        <div class="empty-state">
            No completed habits yet.
        </div>
      <% } %>
    </div>
  </div>
</body>
</html>
