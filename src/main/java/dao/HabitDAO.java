package dao;

import db.DBConnection;
import java.sql.*;
import java.sql.Date;
import java.time.LocalDate;
import java.util.*;

public class HabitDAO {

    // Add a new habit for a user
    public static boolean addHabit(int userId, String habitName, LocalDate date) {
        String sql = "INSERT INTO habits (user_id, habit_name, habit_date, completed) VALUES (?, ?, ?, false)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            stmt.setString(2, habitName);
            stmt.setDate(3, Date.valueOf(date));
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Get all habits for today
    public static List<Map<String, Object>> getTodayHabits(int userId) {
        String sql = "SELECT * FROM habits WHERE user_id = ? AND habit_date = CURDATE()";
        List<Map<String, Object>> habits = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Map<String, Object> habit = new HashMap<>();
                habit.put("id", rs.getInt("id"));
                habit.put("habitName", rs.getString("habit_name"));
                habit.put("completed", rs.getBoolean("completed"));
                habit.put("date", rs.getDate("habit_date"));
                habits.add(habit);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return habits;
    }
    
    //completed habits
    public static List<Map<String, Object>> getCompletedHabits(int userId) {
        String sql = "SELECT * FROM habits WHERE user_id = ? AND completed = true ORDER BY habit_date DESC";
        List<Map<String, Object>> habits = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Map<String, Object> habit = new HashMap<>();
                habit.put("id", rs.getInt("id"));
                habit.put("habitName", rs.getString("habit_name"));
                habit.put("completed", rs.getBoolean("completed"));
                habit.put("date", rs.getDate("habit_date"));
                habits.add(habit);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return habits;
    }




    // Get all habits (for history, analytics, etc)
    public static List<Map<String, Object>> getAllHabits(int userId) {
        String sql = "SELECT * FROM habits WHERE user_id = ? ORDER BY habit_date DESC";
        List<Map<String, Object>> habits = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Map<String, Object> habit = new HashMap<>();
                habit.put("id", rs.getInt("id"));
                habit.put("habitName", rs.getString("habit_name"));
                habit.put("completed", rs.getBoolean("completed"));
                habit.put("date", rs.getDate("habit_date"));
                habits.add(habit);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return habits;
    }

    // Mark a habit as completed
    public static boolean markAsCompleted(int habitId) {
        String sql = "UPDATE habits SET completed = true WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, habitId);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    //upcoming habits
    public static List<Map<String, Object>> getUpcomingHabits(int userId) {
        String sql = "SELECT * FROM habits WHERE user_id = ? AND habit_date > CURDATE() ORDER BY habit_date ASC";
        List<Map<String, Object>> habits = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Map<String, Object> habit = new HashMap<>();
                habit.put("id", rs.getInt("id"));
                habit.put("habitName", rs.getString("habit_name"));
                habit.put("completed", rs.getBoolean("completed"));
                habit.put("date", rs.getDate("habit_date"));
                habits.add(habit);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return habits;
    }
    


    // Delete a habit by id
    public static boolean deleteHabit(int habitId) {
        String sql = "DELETE FROM habits WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, habitId);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
