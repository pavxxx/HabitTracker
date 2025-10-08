package servlets;

import dao.HabitDAO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
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
        if (habitIdStr != null) {
            int habitId = Integer.parseInt(habitIdStr);
            HabitDAO.markAsCompleted(habitId);
        }
        response.sendRedirect("DashboardServlet");
    }
}
