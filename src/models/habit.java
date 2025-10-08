package models;

import java.time.LocalDate;

public class Habit {
    private int id;
    private int userId;
    private String habitName;
    private LocalDate habitDate;
    private String status;

    public Habit() {}

    public Habit(int id, int userId, String habitName, LocalDate habitDate, String status) {
        this.id = id; this.userId = userId; this.habitName = habitName; this.habitDate = habitDate; this.status = status;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public String getHabitName() { return habitName; }
    public void setHabitName(String habitName) { this.habitName = habitName; }

    public LocalDate getHabitDate() { return habitDate; }
    public void setHabitDate(LocalDate habitDate) { this.habitDate = habitDate; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}
