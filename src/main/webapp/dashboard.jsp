<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="dao.HabitDAO" %>
<%@ page import="java.util.Map" %>
<!DOCTYPE html>
<html>
<head>
  <title>Dashboard - Habit Tracker</title>
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
      background: #6a7b5f;
      transition: background 0.2s;
    }
    .nav-buttons a:hover {
      background: #222;
    }
    .main-container {
      max-width: 1200px;
      margin: 32px auto;
      padding: 0 20px;
    }
    .card {
      background: white;
      border-radius: 12px;
      box-shadow: 0 2px 8px rgba(0,0,0,0.1);
      padding: 24px;
      margin-bottom: 24px;
    }
    .card h3 {
      margin-top: 0;
      margin-bottom: 20px;
      color: #333;
      font-size: 1.4rem;
    }
    .habit-item {
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 16px 0;
      border-bottom: 1px solid #eee;
    }
    .habit-item:last-child {
      border-bottom: none;
    }
    .habit-name {
      font-weight: 500;
      font-size: 1.1rem;
    }
    .habit-actions {
      display: flex;
      gap: 8px;
      align-items: center;
    }
    .btn {
      padding: 8px 16px;
      border: none;
      border-radius: 8px;
      text-decoration: none;
      font-size: 0.98rem;
      cursor: pointer;
      transition: background 0.2s;
      font-family: inherit;
    }
    .btn-success {
      background: #6a7b5f;
      color: white;
    }
    .btn-success:hover {
      background: #222;
    }
    .btn-danger {
      background: #b94a48;
      color: white;
    }
    .btn-danger:hover {
      background: #900;
    }
    .empty-state {
      text-align: center;
      color: #666;
      font-style: italic;
      padding: 40px 0;
    }
  </style>
</head>
<body>
  <div class="navbar">
    <div class="container">
      <h1>Habit Tracker</h1>
      <div class="nav-buttons">
        <a href="dashboard.jsp">Dashboard</a>
        <a href="addhabit.jsp">Add Habit</a>
        <a href="HistoryServlet">History</a>
        <a href="UpcomingHabitsServlet">Upcoming</a>
        <a href="logout.jsp">Logout</a>
      </div>
    </div>
  </div>
  <div class="main-container">
    <div class="card">
      <h3>Today's Habits</h3>
      <%
        Integer userId = (Integer) session.getAttribute("userId");
        List<Map<String, Object>> habits = HabitDAO.getTodayHabits(userId);
        if (habits != null && !habits.isEmpty()) {
          for (Map<String, Object> habit : habits) {
      %>
      <div class="habit-item">
        <div>
          <div class="habit-name"><%= habit.get("habitName") %></div>
          <div style="font-size:0.95em; color:#555;">Date: <%= habit.get("date") %></div>
        </div>
        <div class="habit-actions">
          <% if ((Boolean)habit.get("completed")) { %>
            <span style="color: #28a745; font-weight: 500;">✓ Completed</span>
          <% } else { %>
            <form action="CompleteHabitServlet" method="post" style="display:inline;">
              <input type="hidden" name="habitId" value="<%= habit.get("id") %>">
              <button type="submit" class="btn btn-success">Complete</button>
            </form>
          <% } %>
          <form action="DeleteHabitServlet" method="get" style="display:inline;">
            <input type="hidden" name="id" value="<%= habit.get("id") %>">
            <button type="submit" class="btn btn-danger"
                    onclick="return confirm('Delete this habit?')">Delete</button>
          </form>
        </div>
      </div>
      <% 
          }
        } else {
      %>
      <div class="empty-state">
        No habits for today. <a href="addhabit.jsp">Add your first habit!</a>
      </div>
      <% } %>
    </div>
  </div>
</body>
</html>
