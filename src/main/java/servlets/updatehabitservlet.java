package servlets;

import dao.HabitDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/UpdateHabitServlet")
public class updatehabitservlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String hid = req.getParameter("habitId");
        if (hid != null) {
            int habitId = Integer.parseInt(hid);
            HabitDAO.markAsCompleted(habitId);
        }
        resp.sendRedirect("DashboardServlet");
    }
}
