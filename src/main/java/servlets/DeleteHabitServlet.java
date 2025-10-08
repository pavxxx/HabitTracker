package servlets;

import dao.HabitDAO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/DeleteHabitServlet")
public class DeleteHabitServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        
        String habitIdStr = request.getParameter("id");
        if (habitIdStr != null) {
            int habitId = Integer.parseInt(habitIdStr);
            HabitDAO.deleteHabit(habitId);
        }
        response.sendRedirect("DashboardServlet");
    }
}
