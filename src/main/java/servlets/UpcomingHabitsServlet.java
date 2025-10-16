package servlets;

import dao.HabitDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet("/UpcomingHabitsServlet")
public class UpcomingHabitsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Integer userId = (Integer) session.getAttribute("userId");
        if (userId == null) {
            resp.sendRedirect("login.jsp");
            return;
        }
        List<Map<String, Object>> habits = HabitDAO.getUpcomingHabits(userId);
        req.setAttribute("habits", habits);
        req.getRequestDispatcher("upcominghabits.jsp").forward(req, resp);
    }
}
