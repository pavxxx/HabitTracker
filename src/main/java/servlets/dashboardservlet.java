package servlets;

import dao.HabitDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet("/DashboardServlet")
public class dashboardservlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        
        int userId = (Integer) session.getAttribute("userId");
        List<Map<String, Object>> habits = HabitDAO.getTodayHabits(userId);
        request.setAttribute("habits", habits);
        request.getRequestDispatcher("dashboard.jsp").forward(request, response);
    }
}
