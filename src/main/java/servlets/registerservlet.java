package servlets;

import dao.UserDAO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        if (username == null || username.trim().isEmpty() || 
            password == null || password.trim().isEmpty()) {
            request.setAttribute("error", "Username and password cannot be empty");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }
        
        if (UserDAO.registerUser(username.trim(), password)) {
            response.sendRedirect("login.jsp");
        } else {
            request.setAttribute("error", "Username already exists or registration failed");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }
}
