package servlets;

import dao.HabitDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/UpdateHabitServlet")
public class UpdateHabitServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String hid = req.getParameter("habitId");
        if (hid != null) {
            int habitId = Integer.parseInt(hid);
            HabitDAO.markDone(habitId);
        }
        resp.sendRedirect("DashboardServlet");
    }
}
