package servlets;

import dao.HabitDAO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet("/HistoryServlet")
public class HistoryServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        
        int userId = (Integer) session.getAttribute("userId");
        List<Map<String, Object>> history = HabitDAO.getAllHabits(userId);
        request.setAttribute("history", history);
        request.getRequestDispatcher("history.jsp").forward(request, response);
    }
}
