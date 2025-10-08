package servlets;

import dao.HabitDAO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.time.LocalDate;

@WebServlet("/AddHabitServlet")
public class AddHabitServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        
        int userId = (Integer) session.getAttribute("userId");
        String habitName = request.getParameter("habitName");
        String dateStr = request.getParameter("habitDate");
        
        if (habitName == null || habitName.trim().isEmpty()) {
            response.sendRedirect("addhabit.jsp");
            return;
        }
        
        LocalDate date = (dateStr == null || dateStr.isEmpty()) ? 
            LocalDate.now() : LocalDate.parse(dateStr);
        
        HabitDAO.addHabit(userId, habitName.trim(), date);
        response.sendRedirect("DashboardServlet");
    }
}
