package servlets;

import dao.HabitDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.time.LocalDate;

@WebServlet("/AddHabitServlet")
public class AddHabitServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String habitName = req.getParameter("habitName");
        String habitDateStr = req.getParameter("habitDate");
        HttpSession session = req.getSession();
        Integer userId = (Integer) session.getAttribute("userId"); // Set this upon login

        if(userId == null) {
            resp.sendRedirect("login.jsp");
            return;
        }

        if (habitName == null || habitName.trim().isEmpty() || habitDateStr == null || habitDateStr.trim().isEmpty()) {
            req.setAttribute("error", "Habit and date required");
            req.getRequestDispatcher("addhabit.jsp").forward(req, resp);
            return;
        }

        LocalDate habitDate = LocalDate.parse(habitDateStr);
        boolean success = HabitDAO.addHabit(userId, habitName.trim(), habitDate);
        if (success) {
            resp.sendRedirect("dashboard.jsp");
        } else {
            req.setAttribute("error", "Could not save habit");
            req.getRequestDispatcher("addhabit.jsp").forward(req, resp);
        }
    }
}
