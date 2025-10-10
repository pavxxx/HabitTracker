package servlets;

import dao.UserDAO;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        if (UserDAO.isValidUser(username, password)) {
            HttpSession session = request.getSession();
            session.setAttribute("userId", UserDAO.getUserId(username));
            session.setAttribute("username", username);

            // Update the destination below to match your dashboard
            response.sendRedirect("dashboard.jsp"); 
            // Or: response.sendRedirect("DashboardServlet"); 
            // Or: response.sendRedirect("dashboard"); 
        } else {
            request.setAttribute("error", "Invalid username or password");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
