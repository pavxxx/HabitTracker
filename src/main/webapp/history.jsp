<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<!DOCTYPE html>
<html>
<head>
  <title>History - Habit Tracker</title>
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
    .history-table {
      width: 100%;
      border-collapse: collapse;
    }
    .history-table th,
    .history-table td {
      padding: 12px;
      text-align: left;
      border-bottom: 1px solid #eee;
    }
    .history-table th {
      background: #f8f9fa;
      font-weight: 600;
      color: #555;
    }
    .status-completed {
      color: #28a745;
      font-weight: 500;
    }
    .status-pending {
      color: #ffc107;
      font-weight: 500;
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
      <h1>Habit History</h1>
      <div class="nav-buttons">
        <a href="dashboard.jsp">Dashboard</a>
        <a href="addhabit.jsp">Add Habit</a>
        <a href="logout.jsp">Logout</a>
      </div>
    </div>
  </div>

  <div class="main-container">
    <div class="card">
      <h3>Your Habit History</h3>
      <%
        List<Map<String, Object>> history = (List<Map<String, Object>>) request.getAttribute("history");
        if (history != null && !history.isEmpty()) {
      %>
      <table class="history-table">
        <thead>
          <tr>
            <th>Date</th>
            <th>Habit</th>
            <th>Status</th>
          </tr>
        </thead>
        <tbody>
          <%
            for (Map<String, Object> record : history) {
          %>
          <tr>
            <td><%= record.get("date") %></td>
            <td><%= record.get("habitName") %></td>
            <td>
              <% if ((Boolean) record.get("completed")) { %>
                <span class="status-completed">✓ Completed</span>
              <% } else { %>
                <span class="status-pending">⏳ Pending</span>
              <% } %>
            </td>
          </tr>
          <% } %>
        </tbody>
      </table>
      <% } else { %>
      <div class="empty-state">
        No habits recorded yet. <a href="addhabit.jsp">Start tracking your first habit!</a>
      </div>
      <% } %>
    </div>
  </div>
</body>
</html>
