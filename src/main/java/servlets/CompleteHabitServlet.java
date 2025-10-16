package servlets;

import dao.HabitDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/CompleteHabitServlet")
public class CompleteHabitServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        
        String habitIdStr = request.getParameter("habitId");
        if (habitIdStr != null && !habitIdStr.trim().isEmpty()) {
            int habitId = Integer.parseInt(habitIdStr);
            HabitDAO.markAsCompleted(habitId);
        }
        // Redirect to dashboard (shows status) or to history page after completion
        response.sendRedirect("dashboard.jsp");
        // If you want to go to history immediately, use:
        // response.sendRedirect("history.jsp");
    }
}
